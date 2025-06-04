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
require apk_management;
require apt_management;
require dpkg_management;
require pacman_management;
require pkgin_management;
require qi_management;
require slackpkg_management;
require yum_management;
require aptitude_management;
require dnf_management;
require guix_management;
require pkg_add_management;
require pkg_management;
require portage_management;
require xbps_management;
require zypper_management;

no warnings 'once';

sub test_module_apk_management
{
    print GREEN, "[*] Starting tests for Perl module: 'apk_management.pm':\n\n", RESET;

    apkManagement::apk_help("");
    apkManagement::apk_add("perl", "-s");
    apkManagement::apk_del("perl", "-s");
    apkManagement::apk_fix("perl", "-s");
    apkManagement::apk_update("-U");
    apkManagement::apk_upgrade("-U");
    apkManagement::apk_cache("");
    apkManagement::apk_info("");
    apkManagement::apk_list("--installed");
    apkManagement::apk_dot("perl");
    apkManagement::apk_policy("perl");
    apkManagement::apk_search("perl");
    apkManagement::apk_index("--help");
    apkManagement::apk_fetch("perl", "--simulate");
    apkManagement::apk_manifest("perl");
    apkManagement::apk_verify("");
    apkManagement::apk_audit("--full");
    apkManagement::apk_stats("");
    apkManagement::apk_version("perl", "-I");

    print GREEN, "\n[*] End of tests.\n\n", RESET;
}

sub test_module_apt_management
{
    print GREEN, "[*] Starting tests for Perl module: 'apt_management.pm':\n\n", RESET;
    
    aptManagement::apt_autoclean("--dry-run");
    aptManagement::apt_autoremove("--dry-run");
    aptManagement::apt_changelog("perl");
    aptManagement::apt_depends("perl", "--conflicts");
    aptManagement::apt_download("perl");
    aptManagement::apt_full_upgrade("--simulate");
    aptManagement::apt_install("perl", "--simulate");
    aptManagement::apt_moo("moo");
    aptManagement::apt_purge("perl", "--simulate");
    aptManagement::apt_reinstall("perl", "--simulate");
    aptManagement::apt_search("perl", "--names-only");
    aptManagement::apt_showsrc("perl", "--only-source");
    aptManagement::apt_update("--print-uris");
    aptManagement::apt_autopurge("--simulate");
    aptManagement::apt_build_dep("perl", "--simulate");
    aptManagement::apt_clean("--dry-run");
    aptManagement::apt_dist_upgrade("--simulate");
    aptManagement::apt_edit_sources("");
    aptManagement::apt_help("");
    aptManagement::apt_list("--installed");
    aptManagement::apt_policy("perl");
    aptManagement::apt_rdepends("perl", "--depends");
    aptManagement::apt_remove("perl", "--simulate");
    aptManagement::apt_show("perl", "--all-versions");
    aptManagement::apt_source("perl", "--simulate");
    aptManagement::apt_upgrade("--simulate");

    print GREEN, "\n[*] End of tests.\n\n", RESET;
}

sub test_module_dpkg_management
{
    print GREEN, "[*] Starting tests for Perl module: 'dpkg_management.pm':\n\n", RESET;

    print GREEN, "\n[*] End of tests.\n\n", RESET;
}

sub test_module_pacman_management
{
    print GREEN, "[*] Starting tests for Perl module: 'pacman_management.pm':\n\n", RESET;

    print GREEN, "\n[*] End of tests.\n\n", RESET;
}

sub test_module_pkgin_management
{
    print GREEN, "[*] Starting tests for Perl module: 'pkgin_management.pm':\n\n", RESET;

    print GREEN, "\n[*] End of tests.\n\n", RESET;
}

sub test_module_qi_management
{
    print GREEN, "[*] Starting tests for Perl module: 'qi_management.pm':\n\n", RESET;

    print GREEN, "\n[*] End of tests.\n\n", RESET;
}

sub test_module_slackpkg_management
{
    print GREEN, "[*] Starting tests for Perl module: 'slackpkg_management.pm':\n\n", RESET;

    print GREEN, "\n[*] End of tests.\n\n", RESET;
}

sub test_module_yum_management
{
    print GREEN, "[*] Starting tests for Perl module: 'yum_management.pm':\n\n", RESET;

    print GREEN, "\n[*] End of tests.\n\n", RESET;
}

sub test_module_aptitude_management
{
    print GREEN, "[*] Starting tests for Perl module: 'aptitude_management.pm':\n\n", RESET;

    print GREEN, "\n[*] End of tests.\n\n", RESET;
}

sub test_module_dnf_management
{
    print GREEN, "[*] Starting tests for Perl module: 'dnf_management.pm':\n\n", RESET;

    print GREEN, "\n[*] End of tests.\n\n", RESET;
}

sub test_module_guix_management
{
    print GREEN, "[*] Starting tests for Perl module: 'guix_management.pm':\n\n", RESET;

    print GREEN, "\n[*] End of tests.\n\n", RESET;
}

sub test_module_pkg_add_management
{
    print GREEN, "[*] Starting tests for Perl module: 'pkg_add_management.pm':\n\n", RESET;

    print GREEN, "\n[*] End of tests.\n\n", RESET;
}

sub test_module_pkg_management
{
    print GREEN, "[*] Starting tests for Perl module: 'pkg_management.pm':\n\n", RESET;

    print GREEN, "\n[*] End of tests.\n\n", RESET;
}

sub test_module_portage_management
{
    print GREEN, "[*] Starting tests for Perl module: 'portage_management.pm':\n\n", RESET;

    print GREEN, "\n[*] End of tests.\n\n", RESET;
}

sub test_module_xbps_management
{
    print GREEN, "[*] Starting tests for Perl module: 'xbps_management.pm':\n\n", RESET;

    print GREEN, "\n[*] End of tests.\n\n", RESET;
}

sub test_module_zypper_management
{
    print GREEN, "[*] Starting tests for Perl module: 'zypper_management.pm':\n\n", RESET;

    print GREEN, "\n[*] End of tests.\n\n", RESET;
}

sub main
{
    test_module_apt_management();
    # test_module_apk_management();
    # test_module_dpkg_management();
    # test_module_pacman_management();
    # test_module_pkgin_management();
    # test_module_qi_management();
    # test_module_slackpkg_management();
    # test_module_yum_management();
    # test_module_aptitude_management();
    # test_module_dnf_management();
    # test_module_guix_management();
    # test_module_pkg_add_management();
    # test_module_pkg_management();
    # test_module_portage_management();
    # test_module_xbps_management();
    # test_module_zypper_management();

    exit;
}

main();

