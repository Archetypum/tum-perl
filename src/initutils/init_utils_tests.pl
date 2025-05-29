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

use constant GREEN => "\033[32m";
use constant RESET => "\033[0m";

use lib '.'; 
require sysvinit_management;
require openrc_management;
require s6_management;
require dinit_management;
require runit_management;
require systemd_management;
require launchd_management;

no warnings 'once';

sub test_module_systemd_management
{
    print GREEN, "[*] Starting tests for Perl module: 'systemd_management.pm':\n\n", RESET;

    print GREEN, "\n[*] End of tests.\n\n", RESET;
}

sub test_module_launchd_management
{
    print GREEN, "[*] Starting tests or Perl module: 'launchd_management.pm':\n\n", RESET;
    
    print GREEN, "\n[*] End of tests.\n\n", RESET;
}

sub test_module_openrc_management
{
    print GREEN, "[*] Starting tests for Perl module: 'openrc_management.pm':\n\n", RESET;

    print GREEN, "\n[*] End of tests.\n\n", RESET;
}

sub test_module_s6_management
{
    print GREEN, "[*] Starting tests for Perl module: 's6_management.pm':\n\n", RESET;

    print GREEN, "\n[*] End of tests.\n\n", RESET;
}

sub test_module_runit_management
{
    print GREEN, "[*] Starting tests for Perl module: 'runit_management.pm':\n\n", RESET;

    print GREEN, "\n[*] End of tests.\n\n", RESET;
}

sub test_module_dinit_management
{
    print GREEN, "[*] Starting tests for Perl module: 'dinit_management.pm':\n\n", RESET;

    print GREEN, "\n[*] End of tests.\n\n", RESET;
}

sub test_module_sysvinit_management
{
    print GREEN, "[*] Starting tests for Perl module: 'sysvinit_management.pm':\n\n", RESET;

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

sub main
{
    test_module_sysvinit_management();
    # test_module_systemd_management();
    # test_module_launchd_management();
    # test_module_openrc_management();
    # test_module_s6_management();
    # test_module_runit_management();
    # test_module_dinit_management();

    exit;
}

main();

