#!perl

package Tum::PackageManager::AptGet;

use strict;
use warnings;

use constant RED   => "\e[31m";
use constant GREEN => "\e[0;32m";
use constant RESET => "\e[0m";

=pod

=head1 NAME

Tum::PackageManager::AptGet - A simple wrapper for the `apt-get`.

=head1 SYNOPSIS
    
    use Tum::PackageManager::AptGet

    Tum::PackageManager::AptGet::apt_get_update("--quiet");
    Tum::PackageManager::AptGet::apt_get_upgrade("--autoremove", "--assume-yes");
    Tum::PackageManager::AptGet::apt_get_install("perl");

=head1 DESCRIPTION

This module provides a simple interface to interact with `apt-get`,
providing Perl functions for common operations. It relies on the `apt-get`
tool being available in the system's PATH.

`apt-get` is the command-line tool for handling packages in the Advanced Packaging Tool (APT) system.
While `apt-get` offers fine-grained control over package management, including installation, removal, and upgrading.

For most everyday tasks, `apt` is generally preferred.

=head1 FUNCTIONS

=head2 apt_get_autoclean

    apt_get_autoclean(@args);

Executes `apt-get autoclean` with provided arguments.

Like clean, autoclean clears out the local repository of retrieved package files. 
The difference is that it only removes package files that can no longer be downloaded, and are largely useless.

=over 4

=back

=head2 apt_get_build_dep

    apt_get_build_dep(@args);

Executes `apt-get build-dep` with provided arguments.

Causes apt-get to install/remove packages in an attempt to satisfy the build dependencies for a source package. 

=over 4

=back

=head2 apt_get_check

    apt_get_check(@args);

Executes `apt-get check` with the provided arguments.

Diagnostic tool; it updates the package cache and checks for broken dependencies.

=over 4

=back

=head2 apt_get_dist_upgrade

    apt_get_dist_upgrade(@args);

Executes `apt-get dist-upgrade` with the provided arguments.

In addition to performing the function of upgrade, this option also intelligently handles changing dependencies
with new versions of packages; apt-get has a "smart" conflict resolution system, and it will attempt to upgrade
the most important packages at the expense of less important ones, if necessary. 

=over 4

=back

=head2 apt_get_dselect_upgrade

    apt_get_dselect_upgrade(@args);

Executes `apt-get dselect-upgrade` with the provided arguments.

dselect-upgrade is used in conjunction with the traditional Debian packaging front-end, dselect(1).
dselect-upgrade follows the changes made by dselect(1) to the Status field of available packages, and
performs the actions necessary to realize that state (for instance, the removal of old and the
installation of new packages).

=over 4

=back

=head2 apt_get_install

    apt_get_install(@args);

Executes `apt-get install` with the provided arguments.

This option is followed by one or more packages desired for installation.

=over 4

=back

=head2 apt_get_remove

    apt_get_remove(@args);

Executes `apt-get remove` with the provided arguments.

Identical to install except that packages are removed instead of installed. If a plus sign (+)
is appended to the package name (with no intervening space), the identified package will be installed instead of removed.

=over 4

=back

=head2 apt_get_update

    apt_get_update(@args);

Executes `apt-get update` with the provided arguments.

Used to re-synchronize the package index files from their sources. The indexes of available packages
are fetched from the location(s) specified in /etc/apt/sources.list(5). An update should always be performed
before an upgrade or dist-upgrade. 

=over 4

=back

=head2 apt_get_autoremove

    apt_get_autoremove(@args);

Executes `apt-get autoremove` with the provided arguments.

autoremove is used to remove packages that were automatically installed to satisfy dependencies for
other packages and are now no longer needed.

=over 4

=back

=head2 apt_get_changelog

    apt_get_changelog(@args);

Executes `apt-get changelog` with the provided arguments.

changelog tries to download the changelog of a package and displays it through sensible-pager. By
default it displays the changelog for the version that is installed. However, you can specify the
same options as for the install command.

=over 4

=back

=head2 apt_get_clean

    apt_get_clean(@args);

Executes `apt-get clean` with the provided arguments.

Clears out the local repository of retrieved package files. It removes everything but the lock file
from /var/cache/apt/archives/ and /var/cache/apt/archives/partial/.

=over 4

=back

=head2 apt_get_download

    apt_get_download(@args);

Executes `apt-get download` with the provided arguments.

download will download the given binary package into the current directory.

=over 4

=back

=head2 apt_get_indextargets

    apt_get_indextargets(@args);

Executes `apt-get indextargets` with the provided arguments.

Displays by default a deb822 formatted listing of information about all data files (aka index
targets) `apt-get update` would download. Supports a `--format` option to modify the output format as
well as accepts lines of the default output to filter the records by. The command is mainly used as
an interface for external tools working with APT to get information as well as filenames for
downloaded files so they can use them as well instead of downloading them again on their own.

=over 4

=back

=head2 apt_get_purge

    apt_get_purge(@args);

Executes `apt-get purge` with the provided arguments.

purge is identical to remove except that packages are removed and purged
(any configuration files are deleted too).

=over 4

=back

=head2 apt_get_source

    apt_get_source(@args);

Executes `apt-get source` with the provided arguments.

source causes apt-get to fetch source packages. APT will examine the available packages to decide
which source package to fetch. It will then find and download into the current directory the newest
available version of that source package while respecting the default release, set with the option
APT::Default-Release, the -t option or per package with the pkg/release syntax, if possible.

=over 4

=back

=head2 apt_get_upgrade

    apt_get_upgrade(@args);

Executes `apt-get upgrade` with the provided arguments. 

Used to install the newest versions of all packages currently installed on the system from the sources
enumerated in /etc/apt/sources.list(5). Packages currently installed with new versions available are retrieved
and upgraded; under no circumstances are currently installed packages removed, nor are packages that are not
already installed retrieved and installed. New versions of currently installed packages that cannot be upgradeD
without changing the install status of another package will be left at their current version. An update must be
performed first so that apt-get knows that new versions of packages are available. 

=over 4

=back

=head1 DIAGNOSTICS

The module will print error messages to STDERR if any of the `apt-get`
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

sub apt_get_autoclean
{
    my @args = @_;
    my @cmd = ("apt-get", "autoclean", @args);
    execute(@cmd);
}

sub apt_get_build_dep
{
    my @args = @_;
    my @cmd = ("apt-get", "build-dep", @args);
    execute(@cmd);
}

sub apt_get_check
{
    my @args = @_;
    my @cmd = ("apt-get", "check", @args);
    execute(@cmd);
}

sub apt_get_dist_upgrade
{
    my @args = @_;
    my @cmd = ("apt-get", "dist-upgrade", @args);
    execute(@cmd);
}

sub apt_get_dselect_upgrade
{
    my @args = @_;
    my @cmd = ("apt-get", "dselect-upgrade", @args);
    execute(@cmd);
}

sub apt_get_install
{
    my @args = @_;
    my @cmd = ("apt-get", "install", @args);
    execute(@cmd);
}

sub apt_get_remove
{
    my @args = @_;
    my @cmd = ("apt-get", "remove", @args);
    execute(@cmd);
}

sub apt_get_update
{
    my @args = @_;
    my @cmd = ("apt-get", "update", @args);
    execute(@cmd);
}

sub apt_get_autoremove
{
    my @args = @_;
    my @cmd = ("apt-get", "autoremove", @args);
    execute(@cmd);
}

sub apt_get_changelog
{
    my @args = @_;
    my @cmd = ("apt-get", "changelog", @args);
    execute(@cmd);
}

sub apt_get_clean
{
    my @args = @_;
    my @cmd = ("apt-get", "clean", @args);
    execute(@cmd);
}

sub apt_get_download
{
    my @args = @_;
    my @cmd = ("apt-get", "download", @args);
    execute(@cmd);
}

sub apt_get_indextargets
{
    my @args = @_;
    my @cmd = ("apt-get", "indextargets", @args);
    execute(@cmd);
}

sub apt_get_purge
{
    my @args = @_;
    my @cmd = ("apt-get", "purge", @args);
    execute(@cmd);
}

sub apt_get_source
{
    my @args = @_;
    my @cmd = ("apt-get", "source", @args);
    execute(@cmd);
}

sub apt_get_upgrade
{
    my @args = @_;
    my @cmd = ("apt-get", "upgrade", @args);
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
