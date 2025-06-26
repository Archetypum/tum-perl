#!/usr/bin/perl

package Tum::PackageManager::AptCDROM;

use strict;
use warnings;

use constant RED   => "\e[31m";
use constant GREEN => "\e[0;32m";
use constant RESET => "\e[0m";

=pod

=head1 NAME

Tum::PackageManager::AptCDROM - A simple wrapper for the `apt-cdrom` utility.

=head1 SYNOPSIS
    
    use Tum::PackageManager::AptCDROM;

    Tum::PackageManager::AptCDROM::apt_cdrom_add();
    Tum::PackageManager::AptCDROM::apt_cdrom_ident();

=head1 DESCRIPTION

`apt-cdrom` is used to add a new CD-ROM to APT's list of available sources.
`apt-cdrom` takes care of determining the structure of the disc as well as
correcting for several possible mis-burns and verifying the index files. 

=head1 FUNCTIONS

=head2 apt_cdrom_add

    apt_cdrom_add(@args);

Executes `apt-cdrom add` with the provided arguments.

add is used to add a new disc to the source list. It will unmount the CD-ROM device,
prompt for a disc to be inserted and then proceed to scan it and copy the index files.
If the disc does not have a proper .disk directory you will be prompted for a descriptive title.

APT uses a CD-ROM ID to track which disc is currently in the drive and maintains a database
of these IDs in /var/lib/apt/cdroms.list.

=over 4

=back

=head2 apt_cdrom_ident

    apt_cdrom_ident(@args);

Executes `apt-cdrom ident` with the provided arguments.

A debugging tool to report the identity of the current disc as well as the stored file name.

=over 4

=back

=head1 DIAGNOSTICS

The module will print error messages to STDERR if any of the `apt-cdrom`
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

sub apt_cdrom_add
{
    my @args = @_;
    my @cmd = ("apt-cdrom", "add", @args);
    execute(@cmd);
}

sub apt_cdrom_ident
{
    my @args = @_;
    my @cmd = ("apt-cdrom", "ident", @args);
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
