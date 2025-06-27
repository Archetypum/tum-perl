#!/usr/bin/perl

package Tum::PackageManager::AptListChanges;

use strict;
use warnings;

use constant RED   => "\e[31m";
use constant GREEN => "\e[0;32m";
use constant RESET => "\e[0m";

=pod

=head1 NAME

Tum::PackageManager::AptListChanges - A simple wrapper for the `apt-listchanges` utility.

=head1 SYNOPSIS

    use Tum::PackageManager::AptListChanges;

    Tum::PackageManager::AptListChanges::apt_listchanges();

=head1 DESCRIPTION

This module provides a simple interface to interact with the `apt-listchanges` utility,
providing Perl functions for common operations. It relies on the `apt-listchanges` tool
being available in the system's PATH.

=head1 FUNCTIONS

=head2 apt_list_changes

    apt_listchanges(@args);

Executes `apt-listchanges` with the provided arguments.

Default command for custom tinkering.

=over 4

=back

=head1 DIAGNOSTICS

The module will print error messages to STDERR if any of the apk
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

sub apt_listchanges
{
    my @args = @_;
    my @cmd = ("apt-listchanges", @args);
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
