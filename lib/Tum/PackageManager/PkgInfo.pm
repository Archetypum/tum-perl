#!/usr/bin/perl

package Tum::PackageManager::PkgInfo;

use strict;
use warnings;

use constant RED   => "\e[31m";
use constant GREEN => "\e[0;32m";
use constant RESET => "\e[0m";

=pod

=head1 NAME

Tum::PackageManager::PkgInfo - A simple wrapper for the `pkg_info`.

=head1 SYNOPSIS
    
    use Tum::PackageManager::PkgInfo;

    Tum::PackageManager::PkgInfo::pkg_info("-u", "-v");
    Tum::PackageManager::PkgInfo::pkg_info("-E", "perl");

=head1 DESCRIPTION

This module provides a simple interface to interact with `pkg_info`,
providing Perl functions for common operations. It relies on the `pkg_info`
tool being available in the system's PATH.

The `pkg_info` command is used to dump out information for packages, which
may be either packed up in files or already installed on the system with
the pkg_create(1) command.

=head1 FUNCTIONS

=head2 pkg_info

    pkg_info(@args);

Executes `pkg_info` with the provided arguments:

=over 4

=item -a

Show information for all currently installed packages. See also
-u. When neither -a nor -u is given, the former is assumed.

=item -B

Show some of the important definitions used when building the
binary package (the `Build information`) for each package.
Additionally, any installation information variables (lowercase)
can be queried, too. In particular, automatic tells if a package
was installed automatically as a dependency of another package.

=item -b

Show the NetBSD RCS Id strings from the files used in the con-
struction of the binary package (the `Build version`) for each
package. These files are the package Makefile, any patch files,
any checksum files, and the packing list file.

=item -c

Show the one-line comment field for each package.

=item -D

Show the install-message file (if any) for each package.

=item -d

Show the long-description field for each package.

=item -E pkg-name

This option allows you to test for the existence of a given package.
If a package identified by pkg-name is currently installed,
return code is 0, otherwise 1. The name of the best matching
package found installed is printed to stdout unless turned off using the -q option.

=item -e pkg-name

This option allows you to test for the existence of a given package.
If a package identified by pkg-name is currently installed,
return code is 0, otherwise 1. The names of any package found
installed are printed to stdout unless turned off using the -q option.

=item -F 

Interpret any pkg-name given as filename, and query information
on the package that file belongs to. This can be used to query
information on a per-file basis.

=item -f

Show the packing list instructions for each package.

=item -h

Print usage message and exit.

=item -I

Show the index entry for each package. This option is assumed
when no arguments or relevant flags are specified.

=item -i

Show the install script (if any) for each package.

=item -K pkg_dbdir

Override the value of the PKG_DBDIR configuration option with the
value pkg_dbdir.

=item -k

Show the de-install script (if any) for each package.

=item -L

Show the files within each package. This is different from just
viewing the packing list, since full pathnames for everything are
generated. Files that were created dynamically during installation
of the package are not listed.

=item -l prefix

Prefix each information category header (see -q) shown with
prefix. This is primarily of use to front-end programs that want
to request a lot of different information fields at once for a
package, but don't necessary want the output intermingled in such
a way that they can't organize it. This lets you add a special
token to the start of each field.

=item -m

Show the mtree file (if any) for each package.

=item -N

Show which packages each package was built with (exact dependencies), if any.

=item -n

Show which packages each package needs (depends upon), if any.

=item -p

Show the installation prefix for each package.

=item -Q variable

Show the definition of variable from the build information for
each package. An empty string is returned if no such variable
definition is found for the package.

=item -q

Be `quiet` in emitting report headers and such, just dump the
raw info (basically, assume a non-human reading).

=item -R

For each package, show the packages that require it.

=item -r

For each package, show the packages that require it.
Continue recursively to show all dependents.

=item -S

Show the size of this package and all the packages it requires, in bytes.

=item -s

Show the size of this package in bytes. The size is calculated
by adding up the size of each file of the package.

=item -u

Show information for all user-installed packages: automatically
installed packages (as dependencies of other packages) are not
displayed. See also -a.

=item -V

Print version number and exit.

=item -v

Turn on verbose output.

=item -X

Print summary information for each package. The summary format
is described in pkg_summary(5). Its primary use is to contain
all information about the contents of a (remote) binary package
repository needed by package managing software.

=back

=head1 DIAGNOSTICS

The module will print error messages to STDERR if any of the `pkg_info`
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

sub pkg_info
{
    my @args = @_;
    my @cmd = ("pkg_info", @args);
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
