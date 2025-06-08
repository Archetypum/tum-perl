#!perl

package Tum::PackageManager::Pacman;

use strict;
use warnings;

use constant RED   => "\e[31m";
use constant GREEN => "\e[0;32m";
use constant RESET => "\e[0m";

=head1 NAME

Tum::PackageManager::Pacman - A simple wrapper for the pacman package manager.

=head1 SYNOPSIS

    use Tum::PackageManager::Pacman;

    Tum::PackageManager::Pacman::pacman_sync("--refresh");
    Tum::PackageManager::Pacman::pacman_upgrade("--noconfirm");
    Tum::PackageManager::Pacman::pacman_remove("package_name");

=head1 DESCRIPTION

This module provides a simple interface to interact with the pacman package
manager, providing Perl functions for common operations.

=head1 FUNCTIONS

=head2 pacman_help

    pacman_help(@args);

Executes pacman --help with the provided arguments.

=over 4

=item Arguments:

Anything you want to pass to the pacman --help command.

=item Returns:

0 on success, 1 on failure.  See L</execute> for details.

=item Example:

    C<Tum::PackageManager::Pacman::pacman_help("| less");>

=back

=head2 pacman_version

    pacman_version(@args);

Executes pacman --version with the provided arguments.

=over 4

=item Arguments:

A list of arguments to pass to the pacman --version command.

=item Returns:

0 on success, 1 on failure.  See L</execute> for details.

=item Example:

    C<Tum::PackageManager::Pacman::pacman_version();>

=back

=head2 pacman_database

    pacman_database(@args);

Executes pacman --database with the provided arguments.

=over 4

=item Arguments:

A list of arguments to pass to the pacman --database command.

=item Returns:

0 on success, 1 on failure.  See L</execute> for details.

=item Example:

    C<Tum::PackageManager::Pacman::pacman_database("-S", "package_name");>

=back

=head2 pacman_files

    pacman_files(@args);

Executes pacman --files with the provided arguments.

=over 4

=item Arguments:

A list of arguments to pass to the pacman --files command.

=item Returns:

0 on success, 1 on failure.  See L</execute> for details.

=item Example:

    C<Tum::PackageManager::Pacman::pacman_files("package_name");>

=back

=head2 pacman_query

    pacman_query(@args);

Executes pacman --query with the provided arguments.

=over 4

=item Arguments:

A list of arguments to pass to the pacman --query command.

=item Returns:

0 on success, 1 on failure.  See L</execute> for details.

=item Example:

    C<Tum::PackageManager::Pacman::pacman_query("-i", "package_name");>

=back

=head2 pacman_remove

    pacman_remove(@args);

Executes pacman --remove with the provided arguments.

=over 4

=item Arguments:

A list of arguments to pass to the pacman --remove command.

=item Returns:
0 on success, 1 on failure.  See L</execute> for details.

=item Example:

    C<Tum::PackageManager::Pacman::pacman_remove("package_name");>

=back

=head2 pacman_sync

    pacman_sync(@args);

Executes pacman --sync with the provided arguments.

=over 4

=item Arguments:

A list of arguments to pass to the pacman --sync command.

=item Returns:

0 on success, 1 on failure.  See L</execute> for details.

=item Example:

    C<Tum::PackageManager::Pacman::pacman_sync("--refresh");>

=back

=head2 pacman_deptest

    pacman_deptest(@args);

Executes pacman --deptest with the provided arguments.

=over 4

=item Arguments:

A list of arguments to pass to the pacman --deptest command.

=item Returns:

0 on success, 1 on failure.  See L</execute> for details.

=item Example:

    C<Tum::PackageManager::Pacman::pacman_deptest("package_name");>

=back

=head2 pacman_upgrade

    pacman_upgrade(@args);

Executes pacman --upgrade with the provided arguments.

=over 4

=item Arguments:

A list of arguments to pass to the pacman --upgrade command.

=item Returns:

0 on success, 1 on failure.  See L</execute> for details.

=item Example:

    C<Tum::PackageManager::Pacman::pacman_upgrade("--noconfirm");>

=back

=head2 execute

    execute(@execution_target);

Executes a system command. Prints the command being executed in green,
and any error messages in red.

=over 4

=item Arguments:

A list representing the command to execute.

=item Returns:

0 on success, 1 on failure.  Failure is determined by the return value
of the system() call.

=back

=head1 SEE ALSO

L<pacman(8)>

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

sub pacman_help
{
    my @args = @_;
    my @cmd = ("pacman", "--help", @args);
    execute(@cmd);
}

sub pacman_version
{
    my @args = @_;
    my @cmd = ("pacman", "--version", @args);
    execute(@cmd);
}

sub pacman_database
{
    my @args = @_;
    my @cmd = ("pacman", "--database", @args);
    execute(@cmd);

}

sub pacman_files
{
    my @args = @_;
    my @cmd = ("pacman", "--files", @args);
    execute(@cmd)
}

sub pacman_query
{
    my @args = @_;
    my @cmd = ("pacman", "--query", @args);
    execute(@cmd);
}

sub pacman_remove
{
    my @args = @_;
    my @cmd = ("pacman", "--remove", @args);
    execute(@cmd);
}

sub pacman_sync
{
    my @args = @_;
    my @cmd = ("pacman", "--sync", @args);
    execute(@cmd);
}

sub pacman_deptest
{
    my @args = @_;
    my @cmd = ("pacman", "--deptest", @args);
    execute(@cmd);
}

sub pacman_upgrade
{
    my @args = @_;
    my @cmd = ("pacman", "--upgrade", @args);
    execute(@cmd);
}

sub execute
{
    my @execution_target = @_;

    print GREEN, "[<==] Executing '@execution_target'...\n", RESET;
    system(@execution_target) == 0 or do { print RED, "[!] Error: Failed to execute: '@execution_target'.", RESET, "\n"; return 1; };
    print GREEN, "[*] Success!\n", RESET;
    return 0;
}

1;
