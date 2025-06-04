#!/usr/bin/perl
#
# This file is part of tum-perl.
# tum-perl is free software: you can redistribute it and/or modify it under the terms of
# the GNU General Public License as published by the Free Software Foundation,
# either version 3 of the License, or (at your option) any later version.
#
# tum-perl is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY;
# without even the implied warranty of MERCHANTABILITY or
# FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for
# more details.
#
# You should have received a copy of the GNU General Public License along with
# tum-perl. If not, see <https://www.gnu.org/licenses/>. 

package Tum::PackageManager::Apt;

use strict;
use warnings;

use constant RED   => "\e[31m";
use constant RESET => "\e[0m";

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

    system(@execution_target) == 0 or do { print RED, "[!] Error: Failed to execute: '@execution_target'.", RESET, "\n"; return 1; };
    return 0;
}

1;

