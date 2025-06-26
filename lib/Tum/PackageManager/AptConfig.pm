#!/usr/bin/perl

package Tum::PackageManager::AptConfig;

use strict;
use warnings;

use constant RED   => "\e[31m";
use constant GREEN => "\e[0;32m";
use constant RESET => "\e[0m";

=pod

=head1 NAME

Tum::PackageManager::AptConfig - A simple wrapper for the `apt-config` utility.

=head1 SYNOPSIS
    
    use Tum::PackageManager::AptConfig;

    Tum::PackageManager::AptCDROM::apt_config_shell();
    Tum::PackageManager::AptCDROM::apt_cdrom_dump();

=head1 DESCRIPTION

`apt-config` is an internal program used by various portions of the APT suite
to provide consistent configurability. It accesses the main configuration file /etc/apt/apt.conf
in a manner that is easy to use for scripted applications.

=head1 FUNCTIONS

=head2 apt_config_shell

    apt_config_shell(@args);

Executes `apt-config shell` with the provided arguments.

shell is used to access the configuration information from a shell script. It is given pairs of arguments,
the first being a shell variable and the second the configuration value to query. As output it lists shell
assignment commands for each value present. 

=over 4

=back

=head2 apt_config_dump

    apt_config_dump(@args);

Executes `apt-config dump` with the provided arguments.

Just show the contents of the configuration space.

=over 4

=back

=head1 DIAGNOSTICS

The module will print error messages to STDERR if any of the `apt-config`
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

sub apt_config_shell
{
    my @args = @_;
    my @cmd = ("apt-config", "shell", @args);
    execute(@cmd);
}

sub apt_config_dump
{
    my @args = @_;
    my @cmd = ("apt-dump", "dump", @args);
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
