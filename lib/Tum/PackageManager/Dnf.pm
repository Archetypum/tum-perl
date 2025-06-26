#!/usr/bin/perl

package Tum::PackageManager::Dnf;

use strict;
use warnings;

use constant RED   => "\e[31m";
use constant GREEN => "\e[0;32m";
use constant RESET => "\e[0m";

=pod

=cut

sub dnf
{
    my @args = @_;
    my @cmd = ("dnf", @args);
    execute(@cmd);
}

sub dnf_advisory
{
    my @args = @_;
    my @cmd = ("dnf", "advisory", @args);
    execute(@cmd);
}

sub dnf_autoremove
{
    my @args = @_;
    my @cmd = ("dnf", "autoremove", @args);
    execute(@cmd);
}

sub dnf_check
{
    my @args = @_;
    my @cmd = ("dnf", "check", @args);
    execute(@cmd);
}

sub dnf_check_upgrade
{
    my @args = @_;
    my @cmd = ("dnf", "check-upgrade", @args);
    execute(@cmd);
}

sub dnf_clean
{
    my @args = @_;
    my @cmd = ("dnf", "clean", @args);
    execute(@cmd);
}

sub dnf_distro_sync
{
    my @args = @_;
    my @cmd = ("dnf", "distro-sync", @args);
    execute(@cmd);
}

sub dnf_downgrade
{
    my @args = @_;
    my @cmd = ("dnf", "downgrade", @args);
    execute(@cmd);
}

sub dnf_download
{
    my @args = @_;
    my @cmd = ("dnf", "download", @args);
    execute(@cmd);
}

sub dnf_environment
{
    my @args = @_;
    my @cmd = ("dnf", "environment", @args);
    execute(@cmd);
}

sub dnf_group
{
    my @args = @_;
    my @cmd = ("dnf", "group", @args);
    execute(@cmd);
}

sub dnf_history
{
    my @args = @_;
    my @cmd = ("dnf", "history", @args);
    execute(@cmd);
}

sub dnf_info
{
    my @args = @_;
    my @cmd = ("dnf", "info", @args);
    execute(@cmd);
}

sub dnf_install
{
    my @args = @_;
    my @cmd = ("dnf", "install", @args);
    execute(@cmd);
}

sub dnf_leaves
{
    my @args = @_;
    my @cmd = ("dnf", "leaves", @args);
    execute(@cmd);
}

sub dnf_list
{
    my @args = @_;
    my @cmd = ("dnf", "list", @args);
    execute(@cmd);
}

sub dnf_makecache
{
    my @args = @_;
    my @cmd = ("dnf", "makecache", @args);
    execute(@cmd);
}

sub dnf_mark
{
    my @args = @_;
    my @cmd = ("dnf", "mark", @args);
    execute(@cmd);
}

sub dnf_module
{
    my @args = @_;
    my @cmd = ("dnf", "module", @args);
    execute(@cmd);
}

sub dnf_offline
{
    my @args = @_;
    my @cmd = ("dnf", "offline", @args);
    execute(@cmd);
}

sub dnf_provides
{
    my @args = @_;
    my @cmd = ("dnf", "provides", @args);
    execute(@cmd);
}

sub dnf_reinstall
{
    my @args = @_;
    my @cmd = ("dnf", "reinstall", @args);
    execute(@cmd);
}

sub dnf_remove
{
    my @args = @_;
    my @cmd = ("dnf", "remove", @args);
    execute(@cmd);
}

sub dnf_replay
{
    my @args = @_;
    my @cmd = ("dnf", "replay", @args);
    execute(@cmd);
}

sub dnf_repo
{
    my @args = @_;
    my @cmd = ("dnf", "repo", @args);
    execute(@cmd);
}

sub dnf_repoquery
{
    my @args = @_;
    my @cmd = ("dnf", "repoquery", @args);
    execute(@cmd);
}

sub dnf_search
{
    my @args = @_;
    my @cmd = ("dnf", "search", @args);
    execute(@cmd);
}

sub dnf_swap
{
    my @args = @_;
    my @cmd = ("dnf", "swap", @args);
    execute(@cmd);
}

sub dnf_system_upgrade
{
    my @args = @_;
    my @cmd = ("dnf", "system-upgrade", @args);
    execute(@cmd);
}

sub dnf_upgrade
{
    my @args = @_;
    my @cmd = ("dnf", "upgrade", @args);
    execute(@cmd);
}

sub dnf_versionlock
{
    my @args = @_;
    my @cmd = ("dnf", "versionlock", @args);
    execute(@cmd);
}

sub dnf_debuginfo_install
{
    my @args = @_;
    my @cmd = ("dnf", "debuginfo-install", @args);
    execute(@cmd);
}

sub dnf_offline_distrosync
{
    my @args = @_;
    my @cmd = ("dnf", "offline-distrosync", @args);
    execute(@cmd);
}

sub dnf_offline_upgrade
{
    my @args = @_;
    my @cmd = ("dnf", "offline-upgrade", @args);
    execute(@cmd);
}

sub dnf_config_manager 
{
    my @args = @_;
    my @cmd = ("dnf", "config-manager", @args);
    execute(@cmd);
}

sub dnf_builddep
{
    my @args = @_;
    my @cmd = ("dnf", "builddep", @args);
    execute(@cmd);
}

sub dnf_changelog
{
    my @args = @_;
    my @cmd = ("dnf", "changelog", @args);
    execute(@cmd);
}

sub dnf_copr
{    
    my @args = @_;                   
    my @cmd = ("dnf", "copr", @args);
    execute(@cmd);
}

sub dnf_needs_restarting
{
    my @args = @_;
    my @cmd = ("dnf", "needs-restarting", @args);
    execute(@cmd);
}

sub dnf_repoclosure
{
    my @args = @_;
    my @cmd = ("dnf", "repoclosure", @args);
    execute(@cmd);
}

sub dnf_reposync
{
    my @args = @_;
    my @cmd = ("dnf", "reposync", @args);
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
