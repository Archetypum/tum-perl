package Tum::PackageManager::Apt;

use strict;
use warnings;

use constant RED   => "\e[0;31m";
use constant GREEN => "\e[0;32m";
use constant RESET => "\e[0m";

=pod

=head1 NAME

Tum::PackageManager::Apt - A simple wrapper for the apt package manager.

=head1 SYNOPSIS

    use Tum::PackageManager::Apt;

    Tum::PackageManager::Apt::apt_update();
    Tum::PackageManager::Apt::apt_install("package_name");
    Tum::PackageManager::Apt::apt_remove("package_name");

=head1 DESCRIPTION

This module provides a simple interface to interact with the apt package
manager, providing Perl functions for common operations.

=head1 FUNCTIONS

=head2 apt_autoclean

    apt_autoclean(@args);

Executes `apt autoclean` with the provided arguments. Removes old downloaded
package files from the cache.

=over 4

=item Arguments:

A list of arguments to pass to the `apt autoclean` command.

=item Returns:

0 on success, 1 on failure.  See L</execute> for details.

=item Example:

    C<Tum::PackageManager::Apt::apt_autoclean();>

=back

=head2 apt_autoremove

    apt_autoremove(@args);

Executes `apt autoremove` with the provided arguments. Removes automatically
all unused packages.

=over 4

=item Arguments:

A list of arguments to pass to the `apt autoremove` command.

=item Returns:

0 on success, 1 on failure.  See L</execute> for details.

=item Example:

    C<Tum::PackageManager::Apt::apt_autoremove();>

=back

=head2 apt_changelog

    apt_changelog(@args);

Executes `apt changelog` with the provided arguments. Fetches and displays
the changelog for a package.

=over 4

=item Arguments:

A list of arguments to pass to the `apt changelog` command.

=item Returns:

0 on success, 1 on failure.  See L</execute> for details.

=item Example:

    C<Tum::PackageManager::Apt::apt_changelog("package_name");>

=back

=head2 apt_depends

    apt_depends(@args);

Executes `apt depends` with the provided arguments. Shows dependency
information for a package.

=over 4

=item Arguments:

A list of arguments to pass to the `apt depends` command.

=item Returns:

0 on success, 1 on failure.  See L</execute> for details.

=item Example:

    C<Tum::PackageManager::Apt::apt_depends("package_name");>

=back

=head2 apt_download

    apt_download(@args);

Executes `apt download` with the provided arguments.  Downloads the .deb
package file.

=over 4

=item Arguments:

A list of arguments to pass to the `apt download` command.

=item Returns:

0 on success, 1 on failure.  See L</execute> for details.

=item Example:
    C<Tum::PackageManager::Apt::apt_download("package_name");>

=back

=head2 apt_full_upgrade

    apt_full_upgrade(@args);

Executes `apt full-upgrade` with the provided arguments. Performs an upgrade
similar to `dist-upgrade` but may remove installed packages.

=over 4

=item Arguments:

A list of arguments to pass to the `apt full-upgrade` command.

=item Returns:

0 on success, 1 on failure.  See L</execute> for details.

=item Example:

    C<Tum::PackageManager::Apt::apt_full_upgrade();>

=back

=head2 apt_install

    apt_install(@args);

Executes `apt install` with the provided arguments.  Installs packages.

=over 4

=item Arguments:

A list of arguments to pass to the `apt install` command.

=item Returns:

0 on success, 1 on failure.  See L</execute> for details.

=item Example:

    C<Tum::PackageManager::Apt::apt_install("package_name");>

=back

=head2 apt_moo

    apt_moo(@args);

Executes `apt moo` with the provided arguments.  A fun command.

=over 4

=item Arguments:

A list of arguments to pass to the `apt moo` command.

=item Returns:

0 on success, 1 on failure.  See L</execute> for details.

=item Example:

    C<Tum::PackageManager::Apt::apt_moo();>

=back

=head2 apt_purge

    apt_purge(@args);

Executes `apt purge` with the provided arguments.  Removes packages and their
configuration files.

=over 4

=item Arguments:

A list of arguments to pass to the `apt purge` command.

=item Returns:

0 on success, 1 on failure.  See L</execute> for details.

=item Example:

    C<Tum::PackageManager::Apt::apt_purge("package_name");>

=back

=head2 apt_reinstall

    apt_reinstall(@args);

Executes `apt reinstall` with the provided arguments.  Reinstalls a package.

=over 4

=item Arguments:

A list of arguments to pass to the `apt reinstall` command.

=item Returns:

0 on success, 1 on failure.  See L</execute> for details.

=item Example:

    C<Tum::PackageManager::Apt::apt_reinstall("package_name");>

=back

=head2 apt_search

    apt_search(@args);

Executes `apt search` with the provided arguments.  Searches for packages.

=over 4

=item Arguments:

A list of arguments to pass to the `apt search` command.

=item Returns:

0 on success, 1 on failure.  See L</execute> for details.

=item Example:

    C<Tum::PackageManager::Apt::apt_search("package_name");>

=back

=head2 apt_showsrc

    apt_showsrc(@args);

Executes `apt showsrc` with the provided arguments.  Displays source package
records.

=over 4

=item Arguments:

A list of arguments to pass to the `apt showsrc` command.

=item Returns:

0 on success, 1 on failure.  See L</execute> for details.

=item Example:

    C<Tum::PackageManager::Apt::apt_showsrc("package_name");>

=back

=head2 apt_update

    apt_update(@args);

Executes `apt update` with the provided arguments.  Refreshes the package lists.

=over 4

=item Arguments:

A list of arguments to pass to the `apt update` command.

=item Returns:

0 on success, 1 on failure.  See L</execute> for details.

=item Example:

    C<Tum::PackageManager::Apt::apt_update();>

=back

=head2 apt_autopurge

    apt_autopurge(@args);

Executes `apt autopurge` with the provided arguments.  Removes automatically
all unused packages, including their configuration files.

=over 4

=item Arguments:

A list of arguments to pass to the `apt autopurge` command.

=item Returns:

0 on success, 1 on failure.  See L</execute> for details.

=item Example:

    C<Tum::PackageManager::Apt::apt_autopurge();>

=back

=head2 apt_build_dep

    apt_build_dep(@args);

Executes `apt build-dep` with the provided arguments.  Satisfy build
dependencies for a source package.

=over 4

=item Arguments:

A list of arguments to pass to the `apt build-dep` command.

=item Returns:

0 on success, 1 on failure.  See L</execute> for details.
=item Example:

    C<Tum::PackageManager::Apt::apt_build_dep("package_name");>

=back

=head2 apt_clean

    apt_clean(@args);

Executes `apt clean` with the provided arguments.  Erase downloaded archive
files.

=over 4

=item Arguments:

A list of arguments to pass to the `apt clean` command.

=item Returns:

0 on success, 1 on failure.  See L</execute> for details.

=item Example:

    C<Tum::PackageManager::Apt::apt_clean();>

=back

=head2 apt_dist_upgrade

    apt_dist_upgrade(@args);

Executes `apt dist-upgrade` with the provided arguments.  Performs an upgrade,
possibly installing or removing packages.

=over 4

=item Arguments:

A list of arguments to pass to the `apt dist-upgrade` command.

=item Returns:

0 on success, 1 on failure.  See L</execute> for details.

=item Example:

    C<Tum::PackageManager::Apt::apt_dist_upgrade();>

=back

=head2 apt_edit_sources

    apt_edit_sources(@args);

Executes `apt edit-sources` with the provided arguments.  Edits the source
list(s).

=over 4

=item Arguments:

A list of arguments to pass to the `apt edit-sources` command.

=item Returns:

0 on success, 1 on failure.  See L</execute> for details.

=item Example:

    C<Tum::PackageManager::Apt::apt_edit_sources();>

=back

=head2 apt_help

    apt_help(@args);

Executes `apt help` with the provided arguments.  Displays help information.

=over 4

=item Arguments:

A list of arguments to pass to the `apt help` command.

=item Returns:

0 on success, 1 on failure.  See L</execute> for details.

=item Example:

    C<Tum::PackageManager::Apt::apt_help();>

=back

=head2 apt_list

    apt_list(@args);

Executes `apt list` with the provided arguments.  List packages based on name
and version.

=over 4

=item Arguments:

A list of arguments to pass to the `apt list` command.

=item Returns:

0 on success, 1 on failure.  See L</execute> for details.

=item Example:

    C<Tum::PackageManager::Apt::apt_list();>

=back

=head2 apt_policy

    apt_policy(@args);

Executes `apt policy` with the provided arguments.  Show policy settings.

=over 4

=item Arguments:

A list of arguments to pass to the `apt policy` command.

=item Returns:

0 on success, 1 on failure.  See L</execute> for details.

=item Example:

    C<Tum::PackageManager::Apt::apt_policy();>

=back

=head2 apt_rdepends

    apt_rdepends(@args);

Executes `apt rdepends` with the provided arguments.  Show reverse dependency
information for a package.

=over 4

=item Arguments:

A list of arguments to pass to the `apt rdepends` command.

=item Returns:

0 on success, 1 on failure.  See L</execute> for details.

=item Example:

    C<Tum::PackageManager::Apt::apt_rdepends("package_name");>

=back

=head2 apt_remove

    apt_remove(@args);

Executes `apt remove` with the provided arguments.  Removes packages.

=over 4

=item Arguments:

A list of arguments to pass to the `apt remove` command.

=item Returns:

0 on success, 1 on failure.  See L</execute> for details.

=item Example:

    C<Tum::PackageManager::Apt::apt_remove("package_name");>

=back

=head2 apt_show

    apt_show(@args);

Executes `apt show` with the provided arguments.  Show package records.

=over 4

=item Arguments:

A list of arguments to pass to the `apt show` command.

=item Returns:

0 on success, 1 on failure.  See L</execute> for details.

=item Example:

    C<Tum::PackageManager::Apt::apt_show("package_name");>

=back

=head2 apt_source

    apt_source(@args);

Executes `apt source` with the provided arguments.  Download source packages.

=over 4

=item Arguments:

A list of arguments to pass to the `apt source` command.

=item Returns:

0 on success, 1 on failure.  See L</execute> for details.

=item Example:

    C<Tum::PackageManager::Apt::apt_source("package_name");>

=back

=head2 apt_upgrade

    apt_upgrade(@args);

Executes `apt upgrade` with the provided arguments.  Performs an upgrade without
installing or removing packages.

=over 4

=item Arguments:

A list of arguments to pass to the `apt upgrade` command.

=item Returns:

0 on success, 1 on failure.  See L</execute> for details.

=item Example:

    C<Tum::PackageManager::Apt::apt_upgrade();>

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

The module will print error messages to STDERR if any of the apt
commands fail. The error messages will be colorized in red.

=head1 SEE ALSO

L<apt(8)>

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

sub apt_autoclean
{
    my @args = @_;
    my @cmd = ("apt", "autoclean", @args);
    execute(@cmd);
}

sub apt_autoremove
{
    my @args = @_;
    my @cmd = ("apt", "autoremove", @args);
    execute(@cmd);
}

sub apt_changelog
{
    my @args = @_;
    my @cmd = ("apt", "changelog", @args);
    execute(@cmd);
}

sub apt_depends
{
    my @args = @_;
    my @cmd = ("apt", "depends", @args);
    execute(@cmd);
}

sub apt_download
{
    my @args = @_;
    my @cmd = ("apt", "download", @args);
    execute(@cmd);
}

sub apt_full_upgrade
{
    my @args = @_;
    my @cmd = ("apt", "full-upgrade", @args);
    execute(@cmd);
}

sub apt_install
{
    my @args = @_;
    my @cmd = ("apt", "install", @args);
    execute(@cmd);
}

sub apt_moo
{
    my @args = @_;
    my @cmd = ("apt", "moo", @args);
    execute(@cmd);
}

sub apt_purge
{
    my @args = @_;
    my @cmd = ("apt", "purge", @args);
    execute(@cmd);
}

sub apt_reinstall
{
    my @args = @_;
    my @cmd = ("apt", "reinstall", @args);
    execute(@cmd);
}

sub apt_search
{
    my @args = @_;
    my @cmd = ("apt", "search", @args);
    execute(@cmd);
}

sub apt_showsrc
{
    my @args = @_;
    my @cmd = ("apt", "showsrc", @args);
    execute(@cmd);
}

sub apt_update
{
    my @args = @_;
    my @cmd = ("apt", "update", @args);
    execute(@cmd);
}

sub apt_autopurge
{
    my @args = @_;
    my @cmd = ("apt", "autopurge", @args);
    execute(@cmd);
}

sub apt_build_dep
{
    my @args = @_;
    my @cmd = ("apt", "build-dep", @args);
    execute(@cmd);
}

sub apt_clean
{
    my @args = @_;
    my @cmd = ("apt", "clean", @args);
    execute(@cmd);
}

sub apt_dist_upgrade
{
    my @args = @_;
    my @cmd = ("apt", "dist-upgrade", @args);
    execute(@cmd);
}

sub apt_edit_sources
{
    my @args = @_;
    my @cmd = ("apt", "edit-sources", @args);
    execute(@cmd);
}

sub apt_help
{
    my @args = @_;
    my @cmd = ("apt", "help", @args);
    execute(@cmd);
}

sub apt_list
{
    my @args = @_;
    my @cmd = ("apt", "list", @args);
    execute(@cmd);
}

sub apt_policy
{
    my @args = @_;
    my @cmd = ("apt", "policy", @args);
    execute(@cmd);
}

sub apt_rdepends
{
    my @args = @_;
    my @cmd = ("apt", "rdepends", @args);
    execute(@cmd);
}

sub apt_remove
{
    my @args = @_;
    my @cmd = ("apt", "remove", @args);
    execute(@cmd);
}

sub apt_show
{
    my @args = @_;
    my @cmd = ("apt", "show", @args);
    execute(@cmd);
}

sub apt_source
{
    my @args = @_;
    my @cmd = ("apt", "source", @args);
    execute(@cmd);
}

sub apt_upgrade
{
    my @args = @_;
    my @cmd = ("apt", "depends", @args);
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

apt_update();

1;

