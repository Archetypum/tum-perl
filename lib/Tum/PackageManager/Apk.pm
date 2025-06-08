#!perl

package Tum::PackageManager::Apk;

use strict;
use warnings;

use constant RED   => "\e[31m";
use constant GREEN => "\e[0;32m";
use constant RESET => "\e[0m";

=pod

=head1 NAME

Tum::PackageManager::Apk - A simple wrapper for the apk package manager.

=head1 SYNOPSIS

    use Tum::PackageManager::Apk;

    Tum::PackageManager::Apk::apk_update();
    Tum::PackageManager::Apk::apk_add("package_name");
    Tum::PackageManager::Apk::apk_del("package_name");

=head1 DESCRIPTION

This module provides a simple interface to interact with the apk package
manager, providing Perl functions for common operations. It relies on the
`apk` tool being available in the system's PATH.

=head1 FUNCTIONS

=head2 apk_help

    apk_help(@args);

Executes `apk --help` with the provided arguments. Displays help information.

=over 4

=item Arguments:

A list of arguments to pass to the `apk --help` command.

=item Returns:

0 on success, 1 on failure.  See L</execute> for details.

=item Example:

    C<Tum::PackageManager::Apk::apk_help();>

=back

=head2 apk_add

    apk_add(@args);

Executes `apk add` with the provided arguments.  Installs packages.

=over 4

=item Arguments:

A list of arguments to pass to the `apk add` command.

=item Returns:

0 on success, 1 on failure.  See L</execute> for details.

=item Example:

    C<Tum::PackageManager::Apk::apk_add("package_name");>

=back

=head2 apk_del

    apk_del(@args);

Executes `apk del` with the provided arguments.  Removes packages.

=over 4

=item Arguments:

A list of arguments to pass to the `apk del` command.

=item Returns:

0 on success, 1 on failure.  See L</execute> for details.

=item Example:

    C<Tum::PackageManager::Apk::apk_del("package_name");>

=back

=head2 apk_fix

    apk_fix(@args);

Executes `apk fix` with the provided arguments.  Fixes package dependencies.

=over 4

=item Arguments:

A list of arguments to pass to the `apk fix` command.

=item Returns:

0 on success, 1 on failure.  See L</execute> for details.

=item Example:

    C<Tum::PackageManager::Apk::apk_fix();>

=back

=head2 apk_update

    apk_update(@args);

Executes `apk update` with the provided arguments.  Refreshes the package index.

=over 4

=item Arguments:

A list of arguments to pass to the `apk update` command.

=item Returns:

0 on success, 1 on failure.  See L</execute> for details.

=item Example:

    C<Tum::PackageManager::Apk::apk_update();>

=back

=head2 apk_upgrade

    apk_upgrade(@args);

Executes `apk upgrade` with the provided arguments.  Upgrades installed packages.

=over 4

=item Arguments:

A list of arguments to pass to the `apk upgrade` command.
=item Returns:

0 on success, 1 on failure.  See L</execute> for details.

=item Example:

    C<Tum::PackageManager::Apk::apk_upgrade();>

=back

=head2 apk_cache

    apk_cache(@args);

Executes `apk cache` with the provided arguments.  Manages the apk cache.

=over 4

=item Arguments:

A list of arguments to pass to the `apk cache` command.

=item Returns:

0 on success, 1 on failure.  See L</execute> for details.

=item Example:

    C<Tum::PackageManager::Apk::apk_cache();>

=back

=head2 apk_info

    apk_info(@args);

Executes `apk info` with the provided arguments.  Displays package information.

=over 4

=item Arguments:

A list of arguments to pass to the `apk info` command.

=item Returns:

0 on success, 1 on failure.  See L</execute> for details.

=item Example:

    C<Tum::PackageManager::Apk::apk_info("package_name");>

=back

=head2 apk_list

    apk_list(@args);

Executes `apk list` with the provided arguments.  Lists available packages.

=over 4

=item Arguments:

A list of arguments to pass to the `apk list` command.

=item Returns:

0 on success, 1 on failure.  See L</execute> for details.

=item Example:

    C<Tum::PackageManager::Apk::apk_list();>

=back

=head2 apk_dot

    apk_dot(@args);

Executes `apk dot` with the provided arguments.  Generates a graph of package dependencies in DOT format.

=over 4

=item Arguments:

A list of arguments to pass to the `apk dot` command.

=item Returns:

0 on success, 1 on failure.  See L</execute> for details.

=item Example:

    C<Tum::PackageManager::Apk::apk_dot();>

=back

=head2 apk_policy

    apk_policy(@args);

Executes `apk policy` with the provided arguments.  Displays the configured package repositories.

=over 4

=item Arguments:

A list of arguments to pass to the `apk policy` command.

=item Returns:

0 on success, 1 on failure.  See L</execute> for details.

=item Example:

    C<Tum::PackageManager::Apk::apk_policy();>

=back

=head2 apk_search

    apk_search(@args);

Executes `apk search` with the provided arguments.  Searches for packages.

=over 4

=item Arguments:

A list of arguments to pass to the `apk search` command.

=item Returns:

0 on success, 1 on failure.  See L</execute> for details.

=item Example:

    C<Tum::PackageManager::Apk::apk_search("package_name");>

=back

=head2 apk_index

    apk_index(@args);

Executes `apk index` with the provided arguments.  Creates a package index.

=over 4

=item Arguments:

A list of arguments to pass to the `apk index` command.

=item Returns:

0 on success, 1 on failure.  See L</execute> for details.

=item Example:

    C<Tum::PackageManager::Apk::apk_index();>

=back

=head2 apk_fetch

    apk_fetch(@args);

Executes `apk fetch` with the provided arguments.  Downloads packages.

=over 4

=item Arguments:

A list of arguments to pass to the `apk fetch` command.

=item Returns:

0 on success, 1 on failure.  See L</execute> for details.

=item Example:

    C<Tum::PackageManager::Apk::apk_fetch("package_name");>

=back

=head2 apk_manifest

    apk_manifest(@args);

Executes `apk manifest` with the provided arguments. Displays or creates a manifest file.

=over 4

=item Arguments:

A list of arguments to pass to the `apk manifest` command.

=item Returns:

0 on success, 1 on failure.  See L</execute> for details.

=item Example:

    C<Tum::PackageManager::Apk::apk_manifest();>

=back

=head2 apk_verify

    apk_verify(@args);

Executes `apk verify` with the provided arguments.  Verifies package integrity.

=over 4

=item Arguments:

A list of arguments to pass to the `apk verify` command.

=item Returns:

0 on success, 1 on failure.  See L</execute> for details.

=item Example:

    C<Tum::PackageManager::Apk::apk_verify("package_name");>

=back

=head2 apk_audit

    apk_audit(@args);

Executes `apk audit` with the provided arguments. Performs security auditing.

=over 4

=item Arguments:

A list of arguments to pass to the `apk audit` command.

=item Returns:

0 on success, 1 on failure.  See L</execute> for details.

=item Example:

    C<Tum::PackageManager::Apk::apk_audit();>

=back

=head2 apk_stats

    apk_stats(@args);

Executes `apk stats` with the provided arguments.  Displays statistics.

=over 4

=item Arguments:

A list of arguments to pass to the `apk stats` command.

=item Returns:

0 on success, 1 on failure.  See L</execute> for details.

=item Example:

    C<Tum::PackageManager::Apk::apk_stats();>

=back

=head2 apk_version

    apk_version(@args);

Executes `apk version` with the provided arguments.  Displays the version of a package.

=over 4

=item Arguments:

A list of arguments to pass to the `apk version` command.

=item Returns:

0 on success, 1 on failure.  See L</execute> for details.

=item Example:

    C<Tum::PackageManager::Apk::apk_version("package_name");>

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

=head1 DIAGNOSTICS

The module will print error messages to STDERR if any of the apk
commands fail.  The error messages will be colorized in red.

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

sub apk_help
{
    my @args = @_;
    my @cmd = ("apk", "--help", @args);
    execute(@cmd);
}

sub apk_add
{
    my @args = @_;
    my @cmd = ("apk", "add", @args);
    execute(@cmd);
}

sub apk_del
{
    my @args = @_;
    my @cmd = ("apk", "del", @args);
    execute(@cmd);
}

sub apk_fix
{
    my @args = @_;
    my @cmd = ("apk", "fix", @args);
    execute(@cmd);
}

sub apk_update
{
    my @args = @_;
    my @cmd = ("apk", "update", @args);
    execute(@cmd);
}

sub apk_upgrade
{
    my @args = @_;
    my @cmd = ("apk", "upgrade", @args);
    execute(@cmd);
}

sub apk_cache
{
    my @args = @_;
    my @cmd = ("apk", "cache", @args);
    execute(@cmd);
}

sub apk_info
{
    my @args = @_;
    my @cmd = ("apk", "info", @args);
    execute(@cmd);
}

sub apk_list
{
    my @args = @_;
    my @cmd = ("apk", "list", @args);
    execute(@cmd);
}

sub apk_dot
{
    my @args = @_;
    my @cmd = ("apk", "dot", @args);
    execute(@cmd);
}

sub apk_policy
{
    my @args = @_;
    my @cmd = ("apk", "policy", @args);
    execute(@cmd);
}

sub apk_search
{
    my @args = @_;
    my @cmd = ("apk", "search", @args);
    execute(@cmd);
}

sub apk_index
{
    my @args = @_;
    my @cmd = ("apk", "index", @args);
    execute(@cmd);
}

sub apk_fetch
{
    my @args = @_;
    my @cmd = ("apk", "fetch", @args);
    execute(@cmd);
}

sub apk_manifest
{
    my @args = @_;
    my @cmd = ("apk", "manifest", @args);
    execute(@cmd);
}

sub apk_verify
{
    my @args = @_;
    my @cmd = ("apk", "verify", @args);
    execute(@cmd);
}

sub apk_audit
{
    my @args = @_;
    my @cmd = ("apk", "audit", @args);
    execute(@cmd);
}

sub apk_stats
{
    my @args = @_;
    my @cmd = ("apk", "stats", @args);
    execute(@cmd);
}

sub apk_version
{
    my @args = @_;
    my @cmd = ("apk", "version", @args);
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
