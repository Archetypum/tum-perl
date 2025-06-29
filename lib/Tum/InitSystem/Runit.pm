#!/usr/bin/perl

package Tum::InitSystem::Runit;

use strict;
use warnings;

use constant RED   => "\e[31m";
use constant RESET => "\e[0m";

=pod

=head1 NAME

...
    
=head1 DESCRIPTION

...

=head1 FUNCTIONS

...

=head1 AUTHOR

Archetypum <archetypum@tutamail.com>

=head1 COPYRIGHT AND LICENSE

Copyright (C) 2025 Archetypum

This program is free software: you can redistribute it and/or modify it
under the terms of the GNU Lesser General Public License as published by the
Free Software Foundation, either version 3 of the License, or any later version.

This program is distributed in the hope that it will be useful, but
WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License
for more details.

You should have received a copy of the GNU Lesser General Public License along
with this program. If not, see L<https://www.gnu.org/licenses/>.

=cut

sub new
{
    my ($class, $command, $args) = @_;
    die RED . "[!] Error: Command is required.\n" . RESET unless defined $command;

    my $self = {
        command => $command,
        args => $args // "",
    };

    bless $self, $class;

    return $self;
}

sub _run_sv
{
    my ($self, $action) = @_;
    my $exit_code;

    eval
    {
        $exit_code = system("sv", $action, $self->{args});
        $exit_code = $exit_code >> 8;
        die RED . "[!] 'sv $action $self->{args}' failed with exit code $exit_code\n" . RESET if $exit_code != 0;
    };

    if ($@)
    {
        print RED, "[!] Error: $@", RESET;
        return 0;
    }

    return 1;
}

my @actions = qw(
    status up down once pause cont hup alarm interrupt quit 1 2 term kill exit start
    stop reload restart shutdown force-stop force-restart force-shutdown try-restart
    check
);

for my $action (@actions)
{
    (my $sub_name = $action) =~ s/-/_/g;
    no strict "refs";
    *{$sub_name} = sub { shift->_run_sv($action) };
}

sub execute
{
    my $self = shift;

    my %commands = map 
    {
        my $method = $_;
        $method => sub 
        {
            my $method_name = $method;
            $method_name =~ s/-/_/g;
            return $self->$method_name;
        }
    } @actions;

    if (exists $commands{ $self->{command} })
    {
        return $commands{ $self->{command} }->();
    }
    else
    {
        print RED, "[!] Error: Unknown command: $self->{command}\n", RESET;
        return 0;
    }
}

1;

