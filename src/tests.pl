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
require sysvinit_management; require openrc_management; require s6_management; require dinit_management; require runit_management; require systemd_management; require launchd_management;
require unix_distributions;
require misc;

no warnings 'once';

sub test_module_systemd_management
{
    exit;
}

sub test_module_launchd_management
{
    exit;
}

sub test_module_openrc_management
{
    exit;
}

sub test_module_s6_management
{
    exit;
}

sub test_module_runit_management
{
    exit;
}

sub test_module_dinit_management
{
    exit;
}

sub test_module_sysvinit_management
{
    print GREEN, "[*] Starting test for Perl module: 'sysvinit_management.pm':\n\n", RESET;

    my $service_start_ssh = SysVInitManagement->new('start', 'ssh');
    $service_start_ssh->execute();

    my $service_stop_ssh = SysVInitManagement->new('stop', 'ssh');
    $service_stop_ssh->execute();

    my $service_reload_ssh = SysVInitManagement->new('reload', 'ssh');
    $service_reload_ssh->execute();

    my $service_force_reload_ssh = SysVInitManagement->new('force_reload', 'ssh');
    $service_force_reload_ssh->execute();

    my $service_restart_ssh = SysVInitManagement->new('restart', 'ssh');
    $service_restart_ssh->execute();

    my $service_status_ssh = SysVInitManagement->new('status', 'ssh');
    $service_status_ssh->execute();
        
    my $service_status_all = SysVInitManagement->new('--status-all', '');
    $service_status_all->execute();

    my $service_full_restart = SysVInitManagement->new('--full-restart', 'ssh');
    $service_full_restart->execute();

    print GREEN, "\n[*] End of tests.\n\n", RESET;
}

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
    print GREEN, "[*] Current tum-perl version: ", "$version", "\n", RESET;

    map { print YELLOW, "[Supported Package Managers]: $_", RESET, "\n" } @Miscellaneous::SUPPORTED_PMS;
    map { print DARK_RED, "[Supported Initialization Systems]: $_", RESET, "\n"} @Miscellaneous::SUPPORTED_INITS;

    print GREEN, "\n[*] End of tests.\n\n", RESET;

}

sub main
{
    test_module_sysvinit_management();
    # test_module_systemd_management();
    # test_module_launchd_management();
    # test_module_openrc_management();
    # test_module_s6_management();
    # test_module_runit_management();
    # test_module_dinit_management();
    test_module_unix_distributions();
    test_module_misc();

    exit;
}

main();

