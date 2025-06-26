#!/usr/bin/perl

package Tum::PackageManager::AptCache;

use strict;
use warnings;

use constant RED   => "\e[31m";
use constant GREEN => "\e[0;32m";
use constant RESET => "\e[0m";

=pod

=head1 NAME

Tum::PackageManager::PkgInfo - A simple wrapper for the `apt-cache` package manager.

=head1 SYNOPSIS
    
    use Tum::PackageManager::AptCache;

    Tum::PackageManager::AptCache::apt_cache_gencaches("--quiet");
    Tum::PackageManager::AptCache::apt_cache_search("perl");

=head1 DESCRIPTION

This module provides a simple interface to interact with `apt-cache`,
providing Perl functions for common operations. It relies on the `apt-cache`
tool being available in the system's PATH.

`apt-cache` performs a variety of operations on APT's package cache. `apt-cache`
does not manipulate the state of the system but does provide operations to search
and generate interesting output from the package metadata. The metadata is acquired
and updated via the `update` command of e.g. `apt-get`, so that it can be outdated if
the last update is too long ago, but in exchange `apt-cache` works independently of the
availability of the configured sources (e.g. offline).

=head1 FUNCTIONS

=head2 apt_cache_add

    apt_cache_add(@args);

Executes `apt-cache add` with the provided arguments.

Adds the named package index file(s) to the package cache. This is for debugging only.

=over 4

=back

=head2 apt_cache_depends

    apt_cache_depends(@args);

Executes `apt-cache depends` with the provided arguments.

Shows a listing of each dependency a package has and all the possible other packages that can fulfill that dependency. 

=over 4

=back

=head2 apt_cache_dotty

    apt_cache_dotty(@args);

Executes `apt-cache dotty` with the provided arguments.

dotty takes a list of packages on the command line and generates output suitable for use by dotty from the GraphViz
package. The result will be a set of nodes and edges representing the relationships between the packages. By default
the given packages will trace out all dependent packages; this can produce a very large graph. To limit the output to
only the packages listed on the command line, set the APT::Cache::GivenOnly option.

=over 4

=back

=head2 apt_cache_dump

    apt_cache_dump(@args);

Executes `apt-cache dump` with the provided arguments.

dump shows a short listing of every package in the cache. It is primarily for debugging.

=over 4

=back

=head2 apt_cache_dumpvail

    apt_cache_dumpvail(@args);

Executes `apt-cache dumpavail` with the provided arguments.

Prints out an available list to stdout. 

=over 4

=back

=head2 apt_cache_gencaches

    apt_cache_gencaches(@args);

Executes `apt-cache gencaches` with the provided arguments.

Performs the same operation as apt-get check. It builds the source and package caches from the
sources in sources.list(5) and from /var/lib/rpm/.

=over 4

=back

=head2 apt_cache_madison

    apt_cache_madison(@args);

Executes `apt-cache madison` with the provided arguments.

apt-cache's madison command attempts to mimic the output format and a subset of the functionality
of the Debian archive management tool, madison. It displays available versions of a package in a
tabular format. Unlike the original madison, it can only display information for the architecture
for which APT has retrieved package lists (APT::Architecture).

=over 4

=back

=head2 apt_cache_pkgnames

    apt_cache_pkgnames(@args);

Executes `apt-cache pkgnames` with the provided arguments.

This command prints the name of each package APT knows. The optional argument is a prefix match to
filter the name list. The output is suitable for use in a shell tab complete function and the output
is generated extremely quickly. This command is best used with the `--generate` option.

=over 4

=back

=head2 apt_cache_policy

    apt_cache_policy(@args);

Executes `apt-cache policy` with the provided arguments.

policy is meant to help debug issues relating to the preferences file.
With no arguments it will print out the priorities of each source. Otherwise
it prints out detailed information about the priority selection of the named package.

=over 4

=back

=head2 apt_cache_rdepends

    apt_cache_rdepends(@args);

Executes `apt-cache rdepends` with the provided arguments.

rdepends shows a listing of each reverse dependency a package has.

=over 4

=back 

=head2 apt_cache_search

    apt_cache_search(@args);

Executes `apt-cache search` with the provided arguments.

Performs a full text search on all available package lists for the regex pattern given.
It searches the package names and the descriptions for an occurrence of the regular expression and prints out
the package name and the short description. If --full is given then output identical to show is produced for
each matched package, and if --names-only is given then the long description is not searched, only the package name is. 

=over 4

=back

=head2 apt_cache_show

    apt_cache_show(@args);

Executes `apt-cache show` with the provided arguments.

show performs a function similar to `dpkg --print-avail`; it displays the package records for the named packages.

=over 4

=back

=head2 apt_cache_showpkg

    apt_cache_showpkg(@args);

Executes `apt-cache showpkg` with the provided arguments.

showpkg displays information about the packages listed on the command line. Remaining arguments are
package names. The available versions and reverse dependencies of each package listed are listed,
as well as forward dependencies for each version. Forward (normal) dependencies are those packages
upon which the package in question depends; reverse dependencies are those packages that depend
upon the package in question.

=over 4

=back

=head2 apt_cache_showsrc

    apt_cache_showsrc(@args);

Executes `apt-cache showsrc` with the provided arguments.

showsrc displays all the source package records that match the given package names. All versions
are shown, as well as all records that declare the name to be a binary package. Use `--only-source`
to display only source package names.

=over 4

=back

=head2 apt_cache_stats

    apt_cache_stats(@args);

Executes `apt-cache stats` with the provided arguments.

stats displays some statistics about the cache.

=over 4

=back

=head2 apt_cache_unmet

    apt_cache_stats(@args);

Executes `apt-cache unmet` with the provided arguments.

Displays a summary of all unmet dependencies in the package cache.

=over 4

=back

=head2 apt_cache_xvcg

    apt_cache_xvcg(@args);

Executes `apt-cache xvcg` with the provided arguments.

The same as dotty, only for xvcg from the VCG tool.

=over 4

=back

=head1 DIAGNOSTICS

The module will print error messages to STDERR if any of the `apt-cache`
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

sub apt_cache_add
{
    my @args = @_;
    my @cmd = ("apt-cache", "add", @args);
    execute(@cmd);
}

sub apt_cache_depends
{
    my @args = @_;
    my @cmd = ("apt-cache", "depends", @args);
    execute(@cmd);
}

sub apt_cache_dotty
{
    my @args = @_;
    my @cmd = ("apt-cache", "dotty", @args);
    execute(@cmd);
}

sub apt_cache_dump
{
    my @args = @_;
    my @cmd = ("apt-cache", "dump", @args);
    execute(@cmd);
}

sub apt_cache_dumpavail
{
    my @args = @_;
    my @cmd = ("apt-cache", "dumpavail", @args);
    execute(@cmd);
}

sub apt_cache_gencaches
{
    my @args = @_;
    my @cmd = ("apt-cache", "gencaches", @args);
    execute(@cmd);
}

sub apt_cache_madison
{
    my @args = @_;
    my @cmd = ("apt-cache", "madison", @args);
    execute(@cmd);
}

sub apt_cache_pkgnames
{
    my @args = @_;
    my @cmd = ("apt-cache", "pkgnames", @args);
    execute(@cmd);
}

sub apt_cache_policy
{
    my @args = @_;
    my @cmd = ("apt-cache", "policy", @args);
    execute(@cmd);
}

sub apt_cache_rdepends
{
    my @args = @_;
    my @cmd = ("apt-cache", "rdepends", @args);
    execute(@cmd);
}

sub apt_cache_search
{
    my @args = @_;
    my @cmd = ("apt-cache", "search", @args);
    execute(@cmd);
}

sub apt_cache_show
{
    my @args = @_;
    my @cmd = ("apt-cache", "show", @args);
    execute(@cmd);
}

sub apt_cache_showpkg
{
    my @args = @_;
    my @cmd = ("apt-cache", "showpkg", @args);
    execute(@cmd);
}

sub apt_cache_showsrc
{
    my @args = @_;
    my @cmd = ("apt-cache", "showsrc", @args);
    execute(@cmd);
}

sub apt_cache_stats
{
    my @args = @_;
    my @cmd = ("apt-cache", "stats", @args);
    execute(@cmd);
}

sub apt_cache_unmet
{
    my @args = @_;
    my @cmd = ("apt-cache", "unmet", @args);
    execute(@cmd);
}

sub apt_cache_xvcg
{
    my @args = @_;
    my @cmd = ("apt-cache", "xvcg", @args);
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
