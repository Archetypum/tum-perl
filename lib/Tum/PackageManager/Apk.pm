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

package Tum::PackageManager::Apk;

use strict;
use warnings;

use constant RED   => "\e[31m";
use constant RESET => "\e[0m";

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

    system(@execution_target) == 0 or do { print RED, "[!] Error: Failed to execute: '@execution_target'.", RESET, "\n"; return 1; };
    return 0;
}

1;
