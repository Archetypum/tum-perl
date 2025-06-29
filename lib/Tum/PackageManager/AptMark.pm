#!/usr/bin/perl

package Tum::PackageManager::AptMark;

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

sub apt_mark
{
    my @args = @_;
    my @cmd = ("apt-mark", @args);
    execute(@cmd);
}

sub apt_mark_auto
{
    my @args = @_;
    my @cmd = ("apt-mark", "auto", @args);
    execute(@cmd);
}

sub apt_mark_manual
{
    my @args = @_;
    my @cmd = ("apt-mark", "manual", @args);
    execute(@cmd);
}

sub apt_mark_minimize_manual
{
    my @args = @_;
    my @cmd = ("apt-mark", "minimize-manual", @args);
    execute(@cmd);
}

sub apt_mark_showauto
{
    my @args = @_;
    my @cmd = ("apt-mark", "showauto", @args);
    execute(@cmd);
}

sub apt_mark_showmanual
{
    my @args = @_;
    my @cmd = ("apt-mark", "showmanual", @args);
    execute(@cmd);
}

sub apt_mark_hold
{
    my @args = @_;
    my @cmd = ("apt-mark", "hold", @args);
    execute(@cmd);
}

sub apt_mark_unhold
{
    my @args = @_;
    my @cmd = ("apt-mark", "unhold", @args);
    execute(@cmd);
}

sub apt_mark_showhold
{
    my @args = @_;
    my @cmd = ("apt-mark", "showhold", @args);
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
