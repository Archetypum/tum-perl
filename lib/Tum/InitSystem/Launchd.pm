#!/usr/bin/perl

package Tum::InitSystem::Launchd;

use strict;
use warnings;

use constant RED   => "\e[31m";
use constant RESET => "\e[0m";

=pod

=head1 NAME

Tum::InitSystem::Launchd - Perl interface to interact with the launchd service manager on macOS.

=head1 SYNOPSIS

    use Tum::InitSystem::Launchd;

    my $launchd = Tum::InitSystem::Launchd->new("load", ["/Library/LaunchDaemons/com.example.daemon.plist"]);

    if ($launchd->execute)
    {
        print "Service loaded successfully\n";
    }
    else
    {
        print "Failed to load service\n";
    }

=head1 DESCRIPTION

This module provides a programmatic Perl interface for managing services on macOS using the
C<launchctl> command, the user-facing utility for interacting with the launchd service manager.

It supports common launchctl subcommands and wraps them in object-oriented methods
for convenient use in scripts or CLI tools.

=head1 METHODS

=head2 new($command, $args)

Constructs a new C<Tum::InitSystem::Launchd> object.

=over 4

=item * C<$command>: A string with a launchctl command (e.g., 'load', 'start', 'unload', etc.).

=item * C<$args>: Optional. Either a string or an array reference of arguments passed to the command.

=back

=head2 execute()

Executes the command that was passed during object construction.
Returns true on success and false on failure.

=head1 SUPPORTED COMMANDS

bootstrap, bootout, enable, disable, uncache, kickstart, attach, debug, kill,
blame, print, print-cache, print-disabled, plist, procinfo, hostinfo, resolveport,
examine, reboot, error, variant, version, load, unload, submit, remove,
start, stop, list, setenv, unsetenv, getenv, export, limit, bsexec, asuser,
managerpid, manageruid, managername, help

Each of these commands can be passed to the constructor, or called as an OO method
(e.g., `$obj->load`).

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

sub _run_launchctl
{
    my ($self, $action) = @_;
    my @cmd = ("launchctl", $action, @{ $self->{args} });

    my $exit_code;

    eval
    {
        $exit_code = system(@cmd);
        if ($exit_code == -1)
        {
            die RED . "[!] Failed to execute launchctl: $!\n" . RESET;
        }

        $exit_code = $exit_code >> 8;
        die RED . "[!] 'launchctl @cmd' failed with exit code $exit_code\n" . RESET if $exit_code != 0;
    };

    if ($@)
    {
        print RED, "[!] Error: $@", RESET;
        return 0;
    }

    return 1;
}

my @actions = qw(
    bootstrap bootout enable disable uncache kickstart attach debug kill blame print
    print-cache print-disabled plist procinfo hostinfo resolveport examine reboot error
    variant version load unload submit remove start stop list setenv unsetenv getenv
    export limit bsexec asuser managerpid manageruid managername help
);

for my $action (@actions)
{
    (my $sub_name = $action) =~ s/-/_/g;
    no strict "refs";
    *{$sub_name} = sub { shift->_run_launchctl($action) };
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

