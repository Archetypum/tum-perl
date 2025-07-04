#!/usr/bin/perl

package Tum::PackageManager::XbpsQuery;

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

sub xbps_query
{
    my @args = @_;
    my @cmd = ("xbps-query", @args);
    execute(@cmd);
}

sub xbps_query_list_pkgs
{
    my @args = @_;
    my @cmd = ("xbps-query", "--list-pkgs", @args);
    execute(@cmd);
}

sub xbps_query_list_hold_pkgs
{
    my @args = @_;
    my @cmd = ("xbps-query", "--list-hold-pkgs", @args);
    execute(@cmd);
}

sub xbps_query_list_repos
{
    my @args = @_;
    my @cmd = ("xbps-query", "--list-repos", @args);
    execute(@cmd);
}

sub xbps_query_list_manual_pkgs
{
    my @args = @_;
    my @cmd = ("xbps-query", "--list-manual-pkgs", @args);
    execute(@cmd);
}

sub xbps_query_list_orphans
{
    my @args = @_;
    my @cmd = ("xbps-query", "--list-orphans", @args);
    execute(@cmd);
}

sub xbps_query_ownedby
{
    my @args = @_;
    my @cmd = ("xbps-query", "--ownedby", @args);
    execute(@cmd);
}

sub xbps_query_show
{
    my @args = @_;
    my @cmd = ("xbps-query", "--show", @args);
    execute(@cmd);
}

sub xbps_query_search
{
    my @args = @_;
    my @cmd = ("xbps-query", "--search", @args);
    execute(@cmd);
}

sub xbps_query_files
{
    my @args = @_;
    my @cmd = ("xbps-query", "--files", @args);
    execute(@cmd);
}

sub xbps_query_deps
{
    my @args = @_;
    my @cmd = ("xbps-query", "--deps", @args);
    execute(@cmd);
}

sub xbps_query_revdeps
{
    my @args = @_;
    my @cmd = ("xbps-query", "--revdeps", @args);
    execute(@cmd);
}

sub xbps_query_cat
{
    my @args = @_;
    my @cmd = ("xbps-query", "cat", @args);
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
