#!/usr/bin/perl

package Tum::InitSystem::Runit;

use strict;
use warnings;

use constant RED   => "\e[31m";
use constant RESET => "\e[0m";

=pod

=head1 NAME

Tum::InitSystem::Runit - Perl interface to the Runit service manager via the `sv` command

=head1 SYNOPSIS

    use Tum::InitSystem::Runit;

    my $runit = Tum::InitSystem::Runit->new('restart', '/etc/service/mydaemon');

    if ($runit->execute)
    {
        print "Service restarted successfully.\n";
    }
    else
    {
        print "Failed to restart service.\n";
    }

=head1 DESCRIPTION

This module provides an object-oriented wrapper for interacting with the
Runit init system using the `sv` command. It simplifies service control
in Perl scripts or CLI automation.

Runit is a fast and minimal init system typically used on lightweight distributions.

=head1 METHODS

=head2 new($command, $args)

Creates a new instance of the Runit command interface.

=over 4

=item * C<$command>: Required. A valid C<sv> subcommand (e.g., C<status>, C<start>, C<stop>, etc.).

=item * C<$args>: Optional. Either a string or arrayref of arguments passed to the command.

=back

=head2 execute()

Executes the command passed at construction time using the C<sv> tool.

Returns true (1) on success, false (0) on failure.

=head1 SUPPORTED COMMANDS

The following commands are mapped to method calls and may be used as constructor arguments:

    status up down once pause cont hup alarm interrupt quit 1 2 term kill exit
    start stop reload restart shutdown force-stop force-restart force-shutdown try-restart check

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

sub new {
    my ($class, $command, $args) = @_;
    die RED . "[!] Error: Command is required.\n" . RESET unless defined $command;

    $args = [] unless defined $args;
    $args = [$args] unless ref $args eq "ARRAY";

    my $self = {
        command => $command,
        args    => $args,
    };

    bless $self, $class;
    return $self;
}

sub _run_sv
{
    my ($self, $action) = @_;
    my @cmd = ("sv", $action, @{ $self->{args} });

    my $exit_code;

    eval
    {
        $exit_code = system(@cmd);
        if ($exit_code == -1)
        {
            die RED . "[!] Failed to execute sv: $!\n" . RESET;
        }

        $exit_code = $exit_code >> 8;
        die RED . "[!] 'sv @cmd' failed with exit code $exit_code\n" . RESET if $exit_code != 0;
    };

    if ($@)
    {
        print RED, "[!] Error: $@", RESET;
        return 0;
    }

    return 1;
}

my @actions = qw(
    status up down once pause cont hup alarm interrupt quit 1 2 term kill exit
    start stop reload restart shutdown force-stop force-restart force-shutdown try-restart check
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
    (my $method_name = $self->{command}) =~ s/-/_/g;

    if ($self->can($method_name))
    {
        return $self->$method_name;
    }
    else
    {
        print RED, "[!] Error: Unknown command: $self->{command}\n", RESET;
        return 0;
    }
}

1;

