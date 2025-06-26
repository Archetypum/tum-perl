#!/usr/bin/perl

package Tum::PackageManager::Zypper;

use strict;
use warnings;

use constant RED   => "\e[31m";
use constant GREEN => "\e[0;32m";
use constant RESET => "\e[0m";

=pod

=cut

sub zypper
{
    my @args = @_;
    my @cmd = ("zypper", @args);
    execute(@cmd);
}

sub zypper_addlocale
{
    my @args = @_;
    my @cmd = ("zypper", "addlocale", @args);
    execute(@cmd);
}

sub zypper_addlock
{
    my @args = @_;
    my @cmd = ("zypper", "addlock", @args);
    execute(@cmd);
}

sub zypper_addrepo
{
    my @args = @_;
    my @cmd = ("zypper", "addrepo", @args);
    execute(@cmd);
}

sub zypper_addservice
{
    my @args = @_;
    my @cmd = ("zypper", "addservice", @args);
    execute(@cmd);
}

sub zypper_appsteam_cache
{
    my @args = @_;
    my @cmd = ("zypper", "appstream-cache", @args);
    execute(@cmd);
}

sub zypper_clean
{
    my @args = @_;
    my @cmd = ("zypper", "clean", @args);
    execute(@cmd);
}

sub zypper_cleanlocks
{
    my @args = @_;
    my @cmd = ("zypper", "cleanlocks", @args);
    execute(@cmd);
}

sub zypper_dist_upgrade
{
    my @args = @_;
    my @cmd = ("zypper", "dist-upgrade", @args);
    execute(@cmd);
}

sub zypper_download
{
    my @args = @_;
    my @cmd = ("zypper", "download", @args);
    execute(@cmd);
}

sub zypper_help
{
    my @args = @_;
    my @cmd = ("zypper", "help", @args);
    execute(@cmd);
}

sub zypper_info
{
    my @args = @_;
    my @cmd = ("zypper", "info", @args);
    execute(@cmd);
}

sub zypper_install
{
    my @args = @_;
    my @cmd = ("zypper", "install", @args);
    execute(@cmd);
}

sub zypper_install_new_recommends
{
    my @args = @_;
    my @cmd = ("zypper", "install-new-recomends", @args);
    execute(@cmd);
}

sub zypper_licenses
{
    my @args = @_;
    my @cmd = ("zypper", "licenses", @args);
    execute(@cmd);
}

sub zypper_list_patches
{
    my @args = @_;
    my @cmd = ("zypper", "list-patches". @args);
    execute(@cmd);
}

sub zypper_list_updates
{
    my @args = @_;
    my @cmd = ("zypper", "list-updates", @args);
    execute(@cmd);
}

sub zypper_locales
{
    my @args = @_;
    my @cmd = ("zypper", "locales", @args);
    execute(@cmd);
}

sub zypper_locks
{
    my @args = @_;
    my @cmd = ("zypper", "locks", @args);
    execute(@cmd);
}

sub zypper_modifyrepo
{
    my @args = @_;
    my @cmd = ("zypper", "modifyrepo", @args);
    execute(@cmd);
}

sub zypper_modifyservice
{
    my @args = @_;
    my @cmd = ("zypper", "modifyservice", @args);
    execute(@cmd);
}

sub zypper_needs_rebooting
{
    my @args = @_;
    my @cmd = ("zypper", "needs-rebooting", @args);
    execute(@cmd);
}

sub zypper_packages
{
    my @args = @_;
    my @cmd = ("zypper", "packages", @args);
    execute(@cmd);
}

sub zypper_patch
{
    my @args = @_;
    my @cmd = ("zypper", "patch", @args);
    execute(@cmd);
}

sub zypper_patch_check
{
    my @args = @_;
    my @cmd = ("zypper", "patch-check", @args);
    execute(@cmd);
}

sub zypper_patches
{
    my @args = @_;
    my @cmd = ("zypper", "patches", @args);
    execute(@cmd);
}

sub zypper_patch_info
{
    my @args = @_;
    my @cmd = ("zypper", "patch-info", @args);
    execute(@cmd);
}

sub zypper_pattern_info
{
    my @args = @_;
    my @cmd = ("zypper", @args);
    execute(@cmd);
}

sub zypper_patterns
{
    my @args = @_;
    my @cmd = ("zypper", "patterns", @args);
    execute(@cmd);
}

sub zypper_product_info
{
    my @args = @_;
    my @cmd = ("zypper", "product-info", @args);
    execute(@cmd);
}

sub zypper_products
{
    my @args = @_;
    my @cmd = ("zypper", "products", @args);
    execute(@cmd);
}

sub zypper_purge_kernels
{
    my @args = @_;
    my @cmd = ("zypper", "purge-kernels", @args);
    execute(@cmd);
}

sub zypper_ps
{
    my @args = @_;
    my @cmd = ("zypper", "ps", @args);
    execute(@cmd);
}

sub zypper_refresh
{
    my @args = @_;
    my @cmd = ("zypper", "refresh", @args);
    execute(@cmd);
}

sub zypper_refresh_services
{
    my @args = @_;
    my @cmd = ("zypper", "refresh-services", @args);
    execute(@cmd);
}

sub zypper_remove
{
    my @args = @_;
    my @cmd = ("zypper", "remove", @args);
    execute(@cmd);
}

sub zypper_removelocale
{
    my @args = @_;
    my @cmd = ("zypper", "removelocale", @args);
    execute(@cmd);
}

sub zypper_removelock
{
    my @args = @_;
    my @cmd = ("zypper", "removelock", @args);
    execute(@cmd);
}

sub zypper_removeptf
{
    my @args = @_;
    my @cmd = ("zypper", "removeptf", @args);
    execute(@cmd);
}

sub zypper_removerepo
{
    my @args = @_;
    my @cmd = ("zypper", "removerepo", @args);
    execute(@cmd);
}

sub zypper_removeservice
{
    my @args = @_;
    my @cmd = ("zypper", "removeservice", @args);
    execute(@cmd);
}

sub zypper_renamerepo
{
    my @args = @_;
    my @cmd = ("zypper", "renamerepo", @args);
    execute(@cmd);
}

sub zypper_repos
{
    my @args = @_;
    my @cmd = ("zypper", "repos", @args);
    execute(@cmd);
}

sub zypper_search
{
    my @args = @_;
    my @cmd = ("zypper", "search", @args);
    execute(@cmd);
}

sub zypper_services
{
    my @args = @_;
    my @cmd = ("zypper", "services", @args);
    execute(@cmd);
}

sub zypper_shell
{
    my @args = @_;
    my @cmd = ("zypper", "shell", @args);
    execute(@cmd);
}

sub zypper_source_download
{
    my @args = @_;
    my @cmd = ("zypper", "source-download", @args);
    execute(@cmd);
}

sub zypper_source_install
{
    my @args = @_;
    my @cmd = ("zypper", "source-install", @args);
    execute(@cmd);
}

sub zypper_subcommand
{
    my @args = @_;
    my @cmd = ("zypper", "subcommand", @args);
    execute(@cmd);
}

sub zypper_system_architecture
{
    my @args = @_;
    my @cmd = ("zypper", "system-architecture", @args);
    execute(@cmd);
}

sub zypper_targetos
{
    my @args = @_;
    my @cmd = ("zypper", "targetos", @args);
    execute(@cmd);
}

sub zypper_update
{
    my @args = @_;
    my @cmd = ("zypper", "update", @args);
    execute(@cmd);
}

sub zypper_versioncmp
{
    my @args = @_;
    my @cmd = ("zypper", "versioncmp", @args);
    execute(@cmd);
}

sub zypper_verify
{
    my @args = @_;
    my @cmd = ("zypper", "verify", @args);
    execute(@cmd);
}

sub zypper_what_provides
{
    my @args = @_;
    my @cmd = ("zypper", "what-provides", @args);
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
