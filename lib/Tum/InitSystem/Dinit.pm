#!/usr/bin/perl

package Tum::InitSystem::Dinit;

use strict;
use warnings;

use constant RED   => "\e[31m";
use constant RESET => "\e[0m";

=pod

=head1 NAME

Tum::InitSystem::Dinit - Perl interface to control dinit init system commands.

=head1 SYNOPSIS

    use Tum::InitSystem::Dinit;

    my $dinit = Tum::InitSystem::Dinit->new('start', ['myservice']);
    
    if ($dinit->execute)
    {
        print "Service started successfully\n";
    }
    else
    {
        print "Failed to start service\n";
    }

=head1 DESCRIPTION

This module provides an object-oriented Perl interface to execute commands
using the "dinitctl" utility, which controls the dinit init system.

You can create a new object with a command and optional arguments, then call
C<execute> to run the command.

=head1 METHODS

=head2 new($command, $args_arrayref_or_scalar)

Creates a new Tum::InitSystem::Dinit object.

=over 4

=item * C<$command> - A string with the dinit command to run (e.g., 'start', 'stop', 'status').

=item * C<$args_arrayref_or_scalar> - Optional. Arguments to pass to the dinit command.
Can be a scalar string or an array reference of strings.

=back

=head2 execute()

Executes the dinit command provided when constructing the object.

Returns 1 on success, 0 on failure.

=head1 SUPPORTED COMMANDS

The following dinit commands are supported as values for C<$command>:

start, stop, status, is-started, is-failed, restart, wake, release, unpin, unload,
reload, list, shutdown, add-dep, rm-dep, enable, disable, trigger, untrigger,
setenv, unsetenv, catalog, signal

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

    $args = [] unless defined $args;
    $args = [$args] unless ref $args eq "ARRAY";

    my $self = {
        command => $command,
        args    => $args,
    };

    bless $self, $class;
    return $self;
}

sub _run_dinitctl
{
    my ($self, $action) = @_;
    my @cmd = ("dinitctl", $action, @{ $self->{args} });

    my $exit_code;
    eval
    {
        $exit_code = system(@cmd);
        if ($exit_code == -1)
        {
            die RED . "[!] Failed to execute dinitctl: $!\n" . RESET;
        }
        $exit_code = $exit_code >> 8;
        die RED . "[!] 'dinitctl @cmd' failed with exit code $exit_code\n" . RESET if $exit_code != 0;
    };

    if ($@)
    {
        print RED, "[!] Error: $@", RESET;
        return 0;
    }

    return 1;
}

my @actions = qw(
    start stop status is-started is-failed restart wake release unpin unload reload list shutdown
    add-dep rm-dep enable disable trigger untrigger setenv unsetenv catalog signal
);

for my $action (@actions)
{
    (my $sub_name = $action) =~ s/-/_/g;
    no strict "refs";
    *{$sub_name} = sub { shift->_run_dinitctl($action) };
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

