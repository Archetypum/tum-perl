#!/usr/bin/perl

package Tum::PackageManager::Slackpkg;

use strict;
use warnings;

use constant RED   => "\e[31m";
use constant GREEN => "\e[0;32m";
use constant RESET => "\e[0m";

=pod

=head1 NAME

...
    
=head1 DESCRIPTION

...

=head1 FUNCTIONS

...

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

sub slackpkg
{
    my @args = @_;
    my @cmd = ("slackpkg", @args);
    execute(@cmd);
}

sub slackpkg_search
{
    my @args = @_;
    my @cmd = ("slackpkg", "search", @args);
    execute(@cmd);
}

sub slackpkg_install
{
    my @args = @_;
    my @cmd = ("slackpkg", "install", @args);
    execute(@cmd);
}

sub slackpkg_upgrade
{
    my @args = @_;
    my @cmd = ("slackpkg", "upgrade", @args);
    execute(@cmd);
}

sub slackpkg_reinstall
{
    my @args = @_;
    my @cmd = ("slackpkg", "reinstall", @args);
    execute(@cmd);
}

sub slackpkg_remove
{
    my @args = @_;
    my @cmd = ("slackpkg", "remove", @args);
    execute(@cmd);
}

sub slackpkg_blacklist
{
    my @args = @_;
    my @cmd = ("slackpkg", "blacklist", @args);
    execute(@cmd);
}

sub slackpkg_download
{
    my @args = @_;
    my @cmd = ("slackpkg", "download", @args);
    execute(@cmd);
}

sub slackpkg_info
{
    my @args = @_;
    my @cmd = ("slackpkg", "info", @args);
    execute(@cmd);
}

sub slackpkg_clean_system
{
    my @args = @_;
    my @cmd = ("slackpkg", "clean-system", @args);
    execute(@cmd);
}

sub slackpkg_upgrade_all
{
    my @args = @_;
    my @cmd = ("slackpkg", "upgrade-all", @args);
    execute(@cmd);
}

sub slackpkg_install_new
{
    my @args = @_;
    my @cmd = ("slackpkg", "install-new", @args);
    execute(@cmd);
}

sub slackpkg_check_updates
{
    my @args = @_;
    my @cmd = ("slackpkg", "check-updates", @args);
    execute(@cmd);
}

sub slackpkg_update
{
    my @args = @_;
    my @cmd = ("slackpkg", "update", @args);
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
