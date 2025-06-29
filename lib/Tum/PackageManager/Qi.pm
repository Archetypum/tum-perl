#!/usr/bin/perl

package Tum::PackageManager::Qi;

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

sub qi
{
    my @args = @_;
    my @cmd = ("qi", @args);
    execute(@cmd);
}

sub qi_warn
{
    my @args = @_;
    my @cmd = ("qi", "warn", @args);
    execute(@cmd);
}

sub qi_install
{
    my @args = @_;
    my @cmd = ("qi", "install", @args);
    execute(@cmd);
}

sub qi_remove
{
    my @args = @_;
    my @cmd = ("qi", "remove", @args);
    execute(@cmd);
}

sub qi_upgrade
{
    my @args = @_;
    my @cmd = ("qi", "upgrade", @args);
    execute(@cmd);
}

sub qi_extract
{
    my @args = @_;
    my @cmd = ("qi", "extract", @args);
    execute(@cmd);
}

sub qi_create
{
    my @args = @_;
    my @cmd = ("qi", "create", @args);
    execute(@cmd);
}

sub qi_build
{
    my @args = @_;
    my @cmd = ("qi", "build", @args);
    execute(@cmd);
}

sub qi_order
{
    my @args = @_;
    my @cmd = ("qi", "order", @args);
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
