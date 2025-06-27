#!/usr/bin/perl

package Tum::PackageManager::AptitudeCreateStateBundle;

use strict;
use warnings;

use constant RED   => "\e[31m";
use constant GREEN => "\e[0;32m";
use constant RESET => "\e[0m";

=pod

=head1 NAME

Tum::PackageManager::AptitudeCreateStateBundle - A simple wrapper for the `aptitude-create-state-bundle` utility.

=head1 SYNOPSIS

    use Tum::PackageManager::AptitudeCreateStateBundle;

    Tum::PackageManager::AptitudeCreateStateBundle::aptitude_create_state_bundle_help();

=head1 DESCRIPTION

This module provides a simple interface to interact with the `aptitude-create-state-bundle` utility,
providing Perl functions for common operations. It relies on the `aptitude-create-state-bundle` tool
being available in the system's PATH.

=head1 FUNCTIONS

=head2 aptitude_create_state_bundle

    aptitude_create_state_bundle(@args);

Executes `aptitude-create-state-bundle` with the provided arguments.

Default command for custom tinkering.

=over 4

=back

=head2 aptitude_create_state_bundle_help

    aptitude_create_state_bundle_help(@args);

Executes `aptitude-create-state-bundle --help` with the provided arguments.

Displays help information.

=over 4

=back

=head2 aptitude_create_state_bundle_print_inputs

    aptitude_create_state_bundle_print_inputs(@args);

Executes `aptitude-create-state-bundle --print-inputs` with the provided arguments.

=over 4

=back

=head2 aptitude_create_state_bundle_force_bzip2
    
    aptitude_create_state_bundle_print_force_bzip2(@args);

Executes `aptitude-create-state-bundle --force-bzip2` with the provided arguments.

=over 4

=back

=head2 aptitude_create_state_bundle_force_gzip

    aptitude_create_state_bundle_force_gzip(@args);

Executes `aptitude-create-state-bundle --force-gzip` with the provided arguments.

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

sub aptitude_create_state_bundle
{
    my @args = @_;
    my @cmd = ("aptitude-create-state-bundle", @args);
    execute(@cmd);
}

sub aptitude_create_state_bundle_help
{
    my @args = @_;
    my @cmd = ("aptitude-create-state-bundle", "--help", @args);
    execute(@cmd);
}

sub aptitude_create_state_bundle_print_inputs
{
    my @args = @_;
    my @cmd = ("aptitude-create-state-bundle", "--print-inputs", @args);
    execute(@cmd);
}

sub aptitude_create_state_bundle_force_bzip2
{
    my @args = @_;
    my @cmd = ("aptitude-create-state-bundle", "--force-bzip2", @args);
    execute(@cmd);
}

sub aptitude_create_state_bundle_force_gzip
{
    my @args = @_;
    my @cmd = ("aptitude-create-state-bundle", "--force-gzip", @args);
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
