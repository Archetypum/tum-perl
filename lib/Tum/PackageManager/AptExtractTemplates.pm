#!/usr/bin/perl

package Tum::PackageManager::AptExtractTemplates;

use strict;
use warnings;

use constant RED   => "\e[31m";
use constant GREEN => "\e[0;32m";
use constant RESET => "\e[0m";

=pod

Tum::PackageManager::AptExtractTemplates - A simple wrapper for the `apt-extracttemplates` utility.

=head1 SYNOPSIS
    
    use Tum::PackageManager::AptExtractTemplates;

    Tum::PackageManager::AptExtractTemplate::apt_extracttemplate("-h");
    Tum::PackageManager::AptExtractTemplate::apt_extracttemplate("-v");

=head1 DESCRIPTION

This module provides a simple interface to interact with `apt-extracttemplates`,
providing Perl functions for common operations. It relies on the `apt-extracttemplates`
tool being available in the system's PATH.

`apt-extracttemplates` will take one or more Debian package files as input and write out
(to a temporary directory) all associated config scripts and template files.

=head1 FUNCTIONS

=head2 apt_extracttemplates

    apt_extracttemplates(@args);

Executes `apt-extracttemplates` with the provided arguments.



=over 4

=item -t, -tempdir

Temporary directory in which to write extracted debconf template files and config
scripts. Configuration Item: APT::ExtractTemplates::TempDir.

=item -h, --help

Show a short usage summary.

=item -v, --version

Show the program version.

=item -c, --config-file

Configuration File; Specify a configuration file to use. The program will read
the default configuration file and then this configuration file. If configuration
settings need to be set before the default configuration files are parsed specify a
file with the APT_CONFIG environment variable. See apt.conf(5) for syntax information.

=item -o, --option

Set a Configuration Option; This will set an arbitrary configuration option. The syntax
is -o Foo::Bar=bar. -o and --option can be used multiple times to set different options.

=back

=head1 DIAGNOSTICS

The module will print error messages to STDERR if any of the `apt-extracttemplates`
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

sub apt_extracttemplates
{
    my @args = @_;
    my @cmd = ("apt-extracttemplates", @args);
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
