#!/usr/bin/perl

package Tum::PackageManager::Aptitude;

use strict;
use warnings;

use constant RED   => "\e[31m";
use constant GREEN => "\e[0;32m";
use constant RESET => "\e[0m";

=pod

Tum::PackageManager::Aptitude - A simple wrapper for the `aptitude` package manager.

=head1 SYNOPSIS
    
    use Tum::PackageManager::Aptitude;

    Tum::PackageManager::Aptitude::aptitude_update();
    Tum::PackageManager::Aptitude::aptitude_upgrade();

=head1 DESCRIPTION

This module provides a simple interface to interact with `aptitude`,
providing Perl functions for common operations. It relies on the `aptitude`
tool being available in the system's PATH.

`aptitude` is a text-based interface to the Debian GNU/Linux package system.

It allows the user to view the list of packages and to perform package management tasks such as
installing, upgrading, and removing packages. Actions may be performed from a visual interface or from the command-line.

=head1 FUNCTIONS

=head2 aptitude

    aptitude(@args);

Executes `aptitude` with the provided arguments.

High-level interface to the package manager.

=over 4

=back

=head2 aptitude_add_user_tag, aptitude_remove_user_tag

    aptitude_add_user_tag(@args);
    aptitude_remove_user_tag(@args);

Executes `aptitude add-user-tag`/`aptitude remove-user-tag` with the provided arguments.

Adds a user tag to or removes a user tag from the selected group of packages. If a package name
contains a tilde ("~") or question mark ("?"), it is treated as a search pattern and the tag is added
to or removed from all the packages that match the pattern (see the section "Search Patterns" in the aptitude
reference manual).

=over 4

=back

=head2 aptitude_clean

    aptitude_clean(@args);

Executes `aptitude clean` with the provided arguments.

Removes all previously downloaded .deb files from the package cache directory (usually /var/cache/apt/archives).

=over 4

=back

=head2 aptitude_forget_new

Executes `aptitude forget-new` with the provided arguments.

Forgets all internal information about what packages are "new" (equivalent to pressing "f" when in visual mode).

=over 4

=back

=head2 aptitude_hold, aptitude_unhold, aptitude_keep
    
    aptitude_hold(@args);
    aptitude_unhold(@args);
    aptitude_keep(@args);

Executes `aptitude keep`/`aptitude unhold`/`aptitude keep` with the provided arguments.

Mark packages to be on hold, remove this property, or set to keep in the current state.

The difference between hold and keep is that hold will cause a package to be ignored by future safe-upgrade
or full-upgrade commands, while keep merely cancels any scheduled actions on the package. unhold will allow a
package to be upgraded by future `safe-upgrade` or `full-upgrade` commands, without otherwise altering its state.

=over 4

=back

=head2 aptitude_remove, aptitude_purge, aptitude_reinstall

    aptitude_remove(@args);
    aptitude_purge(@args);
    aptitude_reinstall(@args);

Executes `aptitude remove`/`aptitude purge`/`aptitude reinstall`

These commands are the same as "install", but apply the named action
to all packages given on the command line for which it is not overridden.

=over 4

=back

=head2 aptitude_search

    aptitude_search(@args);

Executes `aptitude search` with the provided arguments. 
    
Searches for packages matching one of the patterns supplied on the command-line.

=over 4

=back

=head2 aptitude_update

    aptitude_update(@args);

Executes `aptitude update` with the provided arguments.

Updates the list of available packages from the apt sources (this is equivalent to "apt-get update").

=over 4

=back

=head2 aptitude_why, aptitude_why_not

    aptitude_why(@args);
    aptitude_why_not(@args);

Executes `aptitude why`/`aptitude why-not` with the provided arguments.

Explains the reason that a particular package should or cannot be installed on the system. 

=over 4

=back

=head2 aptitude_autoclean

    aptitude_autoclean();

Executes `aptitude autoclean` with the provided arguments

Removes any cached packages which can no longer be downloaded.
This allows you to prevent a cache from growing out of control over time without completely emptying it.

=over 4

=back

=head2 aptitude_dist_upgrade, aptitude_full_upgrade

    aptitude_dist_upgrade(@args);
    aptitude_full_upgrade(@args);

Executes `aptitude dist-upgrade`/`aptitude full-upgrade` with the provided arguments.

Upgrades installed packages to their most recent version, removing or installing packages as necessary.
It also installs new Essential or Required packages. This command is less conservative than safe-upgrade and
thus more likely to perform unwanted actions. However, it is capable of upgrading packages that safe-upgrade cannot upgrade.

This command was originally named dist-upgrade for historical reasons, and aptitude still recognizes dist-upgrade as a synonym for full-upgrade.

=over 4

=back

=head2 aptitude_keep_all

    aptitude_keep_all(@args);

Executes `aptitude keep-all` with the provided arguments.

Cancels all scheduled actions on all packages;
any packages whose sticky state indicates an installation, removal, or upgrade will have this sticky state cleared.

=over 4

=back

=head2 aptitude_show

    aptitude_show(@args);

Executes `aptitude keep-all` with the provided arguments.

Displays detailed information about one or more packages.

=over 4

=back 

=head2 aptitude_build_dep

    aptitude_build_dep(@args);

Executes `aptitude build-dep` with the provided arguments.

Satisfy the build-dependencies of a package.

=over 4

=back

=head2 aptitude_download

    aptitude_download(@args);

Executes `aptitude download` with the provided arguments.

Downloads the .deb file for the given package to the current directory.

=over 4

=back

=head2 aptitude_markauto, aptitude_unmarkauto

    aptitude_markauto(@args);
    aptitude_unmarkauto(@args);

Executes `aptitude markauto`/`aptitude unmarkauto` with the provided arguments.

Mark packages as automatically installed or manually installed, respectively.

=over 4

=back

=head2 aptitude_versions

    aptitude_versions(@args);

Executes `aptitude versions` with the provided arguments.

Displays the versions of the packages listed on the command-line.

=over 4

=back

=head2 aptitude_changelog

    aptitude_changelog(@args);

Executes `aptitude changelog` with the provided arguments.

Downloads and displays the Debian changelog for each of the given source or binary packages.

=over 4

=back

=head2 aptitude_forbid_version

    aptitude_forbid_version(@args);

Executes `aptitude forbid-version` with the provided arguments.

Forbid a package from being upgraded to a particular version, while allowing automatic upgrades to future versions.
This is useful for example to avoid a known broken version of a package, without having to set and clear manual holds. 

=over 4

=back

=head2 aptitude_install

    aptitude_install(@args);

Executes `aptitude install` with the provided arguments.

Install one or more packages.

=over 4

=back

=head2 aptitude_safe_upgrade

    aptitude_safe_upgrade(@args);

Executes `aptitude safe-upgrade` with the provided arguments.

Upgrades installed packages to their most recent version. Installed packages will not be removed unless they are unused.

=over 4

=back

=head1 DIAGNOSTICS

The module will print error messages to STDERR if any of the `aptitude`
commands fail. The error messages will be colorized in red.

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

sub aptitude
{
    my @args = @_;
    my @cmd = ("aptitude", @args);
    execute(@cmd);
}

sub aptitude_add_user_tag
{
    my @args = @_;
    my @cmd = ("aptitude", "add-user-tag", @args);
    execute(@cmd);
}

sub aptitude_clean
{
    my @args = @_;
    my @cmd = ("aptitude", "clean", @args);
    execute(@cmd);
}

sub aptitude_forget_new
{
    my @args = @_;
    my @cmd = ("aptitude", "forget-new", @args);
    execute(@cmd);
}

sub aptitude_keep
{
    my @args = @_;
    my @cmd = ("aptitude", "keep", @args);
    execute(@cmd);
}

sub aptitude_reinstall
{
    my @args = @_;
    my @cmd = ("aptitude", "reinstall", @args);
    execute(@cmd);
}

sub aptitude_search
{
    my @args = @_;
    my @cmd = ("aptitude", "search", @args);
    execute(@cmd);
}

sub aptitude_update
{
    my @args = @_;
    my @cmd = ("aptitude", "update", @args);
    execute(@cmd);
}

sub aptitude_why_not
{
    my @args = @_;
    my @cmd = ("aptitude", "why-not", @args);
    execute(@cmd);
}

sub aptitude_autoclean
{
    my @args = @_;
    my @cmd = ("aptitude", "autoclean", @args);
    execute(@cmd);
}

sub aptitude_dist_upgrade
{
    my @args = @_;
    my @cmd = ("aptitude", "dist-upgrade", @args);
    execute(@cmd);
}

sub aptitude_full_upgrade
{
    my @args = @_;
    my @cmd = ("aptitude", "full-upgrade", @args);
    execute(@cmd);
}

sub aptitude_keep_all
{
    my @args = @_;
    my @cmd = ("aptitude", "keep-all", @args);
    execute(@cmd);
}

sub aptitude_remove
{
    my @args = @_;
    my @cmd = ("aptitude", "remove", @args);
    execute(@cmd);
}

sub aptitude_show
{
    my @args = @_;
    my @cmd = ("aptitude", "show", @args);
    execute(@cmd);
}

sub aptitude_upgrade
{
    my @args = @_;
    my @cmd = ("aptitude", "upgrade", @args);
    execute(@cmd);
}

sub aptitude_build_dep
{
    my @args = @_;
    my @cmd = ("aptitude", "build-dep", @args);
    execute(@cmd);
}

sub aptitude_download
{
    my @args = @_;
    my @cmd = ("aptitude", "download", @args);
    execute(@cmd);
}

sub aptitude_hold
{
    my @args = @_;
    my @cmd = ("aptitude", "hold", @args);
    execute(@cmd);
}

sub aptitude_markauto
{
    my @args = @_;
    my @cmd = ("aptitude", "markauto", @args);
    execute(@cmd);
}

sub aptitude_remove_user_tag
{
    my @args = @_;
    my @cmd = ("aptitude", "remove-user-tag", @args);
    execute(@cmd);
}

sub aptitude_unhold
{
    my @args = @_;
    my @cmd = ("aptitude", "unhold", @args);
    execute(@cmd);
}

sub aptitude_versions
{
    my @args = @_;
    my @cmd = ("aptitude", "versions", @args);
    execute(@cmd);
}

sub aptitude_changelog
{
    my @args = @_;
    my @cmd = ("aptitude", "changelog", @args);
    execute(@cmd);
}

sub aptitude_forbid_version
{
    my @args = @_;
    my @cmd = ("aptitude", "forbid-version", @args);
    execute(@cmd);
}

sub aptitude_install
{
    my @args = @_;
    my @cmd = ("aptitude", "install", @args);
    execute(@cmd);
}

sub aptitude_purge
{
    my @args = @_;
    my @cmd = ("aptitude", "purge", @args);
    execute(@cmd);
}

sub aptitude_safe_upgrade
{
    my @args = @_;
    my @cmd = ("aptitude", "safe-upgrade", @args);
    execute(@cmd);
}

sub aptitude_unmarkauto
{
    my @args = @_;
    my @cmd = ("aptitude", "unmarkauto", @args);
    execute(@cmd);
}

sub aptitude_why
{
    my @args = @_;
    my @cmd = ("aptitude", "why", @args);
    execute(@cmd);
}

sub execute
{
    my @execution_target = @_;

    print GREEN, "[<==] Executing '@execution_target'...\n", RESET;
    system(@execution_target) == 0 or do { print RED, "[!] Error: Failed to execute: '@execution_target'.", RESET, "\n"; return 0; };
    print GREEN, "[*] Success!\n", RESET;
    return 1;
}

1;
