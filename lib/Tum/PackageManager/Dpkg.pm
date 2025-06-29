#!/usr/bin/perl

package Tum::PackageManager::Dpkg;

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

sub dpkg
{
    my @args = @_;
    my @cmd = ("dpkg", @args);
    execute(@cmd);
}

sub dpkg_abort_after
{
    my @args = @_;
    my @cmd = ("dpkg", "--abort-after", @args);
    execute(@cmd);
}

sub dpkg_add_architecture
{
    my @args = @_;
    my @cmd = ("dpkg", "--add-architecture", @args);
    execute(@cmd);
}

sub dpkg_audit
{
    my @args = @_;
    my @cmd = ("dpkg", "--audit", @args);
    execute(@cmd);
}

sub dpkg_auto_deconfigure
{
    my @args = @_;
    my @cmd = ("dpkg", "--auto-deconfigure", @args);
    execute(@cmd);
}

sub dpkg_clear_avail
{
    my @args = @_;
    my @cmd = ("dpkg", "--clear-avail", @args);
    execute(@cmd);
}

sub dpkg_clear_selection
{
    my @args = @_;
    my @cmd = ("dpkg", "--clear-selections", @args);
    execute(@cmd);
}

sub dpkg_compare_versions
{
    my @args = @_;
    my @cmd = ("dpkg", "--compare-versions", @args);
    execute(@cmd);
}

sub dpkg_configure
{
    my @args = @_;
    my @cmd = ("dpkg", "--configure", @args);
    execute(@cmd);
}

sub dpkg_field
{
    my @args = @_;
    my @cmd = ("dpkg", "--field", @args);
    execute(@cmd);
}

sub dpkg_forget_old_unavail
{
    my @args = @_;
    my @cmd = ("dpkg", "--forget-old-unavail", @args);
    execute(@cmd);
}

sub dpkg_get_selections
{
    my @args = @_;
    my @cmd = ("dpkg", "--get-selections", @args);
    execute(@cmd);
}

sub dpkg_help
{
    my @args = @_;
    my @cmd = ("dpkg", "--help", @args);
    execute(@cmd);
}

sub dpkg_install
{
    my @args = @_;
    my @cmd = ("dpkg", "--install", @args);
    execute(@cmd);
}

sub dpkg_list
{
    my @args = @_;
    my @cmd = ("dpkg", "--list", @args);
    execute(@cmd);
}

sub dpkg_listfiles
{
    my @args = @_;
    my @cmd = ("dpkg", "--listfiles", @args);
    execute(@cmd);
}

sub dpkg_merge_avail
{
    my @args = @_;
    my @cmd = ("dpkg", "--merge-avail", @args);
    execute(@cmd);
}

sub dpkg_predep_package
{
    my @args = @_;
    my @cmd = ("dpkg", "--predep-package", @args);
    execute(@cmd);
}

sub dpkg_print_architecture
{
    my @args = @_;
    my @cmd = ("dpkg", "--print-architecture", @args);
    execute(@cmd);
}

sub dpkg_print_avail
{
    my @args = @_;
    my @cmd = ("dpkg", "--print-avail", @args);
    execute(@cmd);
}

sub dpkg_print_foreign_architectures
{
    my @args = @_;
    my @cmd = ("dpkg", "--print-foreign-architectures", @args);
    execute(@cmd);
}

sub dpkg_purge
{
    my @args = @_;
    my @cmd = ("dpkg", "--purge", @args);
    execute(@cmd);
}

sub dpkg_record_avail
{
    my @args = @_;
    my @cmd = ("dpkg", "--record-avail", @args);
    execute(@cmd);
}

sub dpkg_remove
{
    my @args = @_;
    my @cmd = ("dpkg", "--remove", @args);
    execute(@cmd);
}

sub dpkg_remove_architecture
{
    my @args = @_;
    my @cmd = ("dpkg", "--remove-architecture", @args);
    execute(@cmd);
}

sub dpkg_search
{
    my @args = @_;
    my @cmd = ("dpkg", "--search", @args);
    execute(@cmd);
}

sub dpkg_set_selections
{
    my @args = @_;
    my @cmd = ("dpkg", "--set-selections", @args);
    execute(@cmd);
}

sub dpkg_status
{
    my @args = @_;
    my @cmd = ("dpkg", "--status", @args);
    execute(@cmd);
}

sub dpkg_unpack
{
    my @args = @_;
    my @cmd = ("dpkg", "--unpack", @args);
    execute(@cmd);
}

sub dpkg_update_avail
{
    my @args = @_;
    my @cmd = ("dpkg", "--update-avail", @args);
    execute(@cmd);
}

sub dpkg_verify
{
    my @args = @_;
    my @cmd = ("dpkg", "--verify", @args);
    execute(@cmd);
}

sub dpkg_version
{
    my @args = @_;
    my @cmd = ("dpkg", "--version", @args);
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
