#!/usr/bin/perl
#
# This file is part of tum-perl.
# tum-perl is free software: you can redistribute it and/or modify it under the terms of
# the GNU General Public License as published by the Free Software Foundation,
# either version 3 of the License, or (at your option) any later version.
#
# tum-perl is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY;
# without even the implied warranty of MERCHANTABILITY or
# FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for
# more details.
#
# You should have received a copy of the GNU General Public License along with
# tum-perl. If not, see <https://www.gnu.org/licenses/>. 

use strict;
use warnings;

use constant RED          => "\033[31m";
use constant GREEN        => "\033[32m";
use constant RESET        => "\033[0m";
use constant CYAN         => "\033[36m";
use constant BLUE         => "\033[34m";
use constant GRAY         => "\033[90m";
use constant BROWN        => "\033[33m";
use constant BLACK        => "\033[30m";
use constant DARK_RED     => "\033[91m";
use constant YELLOW       => "\033[33m";
use constant ORANGE       => "\033[38;5;214m";
use constant LIGHT_ORANGE => "\033[38;5;220m";

use lib '.'; 
require unix_distributions;
require misc;

no warnings 'once';

sub test_module_unix_distributions
{
    print GREEN, "[*] Starting tests for Perl module: 'unix_distributions.pm':\n\n", RESET;

    map { print RED, "[Debian]: $_", RESET, "\n" } @UnixDistributions::DEBIAN_BASED;
    map { print CYAN, "[Arch]: $_", RESET, "\n" } @UnixDistributions::ARCH_BASED;
    map { print BLUE, "[Alpine]: $_", RESET, "\n" } @UnixDistributions::ALPINE_BASED;
    map { print GRAY, "[Gentoo]: $_", RESET, "\n" } @UnixDistributions::GENTOO_BASED;
    map { print GREEN, "[Void]: $_", RESET, "\n" } @UnixDistributions::VOID_BASED;
    map { print BROWN, "[Dragora]: $_", RESET, "\n" } @UnixDistributions::DRAGORA_BASED;
    map { print BLACK, "[Slackware]: $_", RESET, "\n" } @UnixDistributions::SLACKWARE_BASED;
    map { print DARK_RED, "[RHEL]: $_", RESET, "\n" } @UnixDistributions::REDHAT_BASED;
    map { print GREEN, "[openSUSE]: $_", RESET, "\n" } @UnixDistributions::OPENSUSE_BASED;
    map { print YELLOW, "[Guix]: $_", RESET, "\n" } @UnixDistributions::GUIX_BASED;
    map { print DARK_RED, "[FreeBSD]: $_", RESET, "\n" } @UnixDistributions::FREEBSD_BASED;
    map { print ORANGE, "[OpenBSD]: $_", RESET, "\n" } @UnixDistributions::OPENBSD_BASED;
    map { print LIGHT_ORANGE, "[NetBSD]: $_", RESET, "\n" } @UnixDistributions::NETBSD_BASED;
    map { print RED, "[Solaris/illumos]: $_", RESET, "\n" } @UnixDistributions::SOLARIS_ILLUMOS_BASED;
    
    print GREEN, "\n[*] End of test.\n\n", RESET;
}

sub test_module_misc
{
    print GREEN, "[*] Starting tests for Perl module: 'misc.pm':\n\n", RESET;

    Miscellaneous::check_privileges();
    my $version = Miscellaneous::tum_version();
    print GREEN, "[tum-perl] Current tum-perl version: ", "$version", "\n", RESET;

    map { print YELLOW, "[Supported Package Managers]: $_", RESET, "\n" } @Miscellaneous::SUPPORTED_PMS;
    map { print DARK_RED, "[Supported Initialization Systems]: $_", RESET, "\n"} @Miscellaneous::SUPPORTED_INITS;

    print GREEN, "\n[*] End of tests.\n\n", RESET;

}

sub main
{
    test_module_unix_distributions();
    test_module_misc();

    exit;
}

main();

