#!/usr/bin/perl

package Tum::PackageManager::Yum;

use strict;
use warnings;

use constant RED   => "\e[31m";
use constant GREEN => "\e[0;32m";
use constant RESET => "\e[0m";

=pod

=cut

sub yum
{
    my @args = @_;
    my @cmd = ("yum", @args);
    execute(@cmd);
}

sub yum_advisory
{
    my @args = @_;
    my @cmd = ("yum", "advisory", @args);
    execute(@cmd);
}

sub yum_autoremove
{
    my @args = @_;
    my @cmd = ("yum", "autoremove", @args);
    execute(@cmd);
}

sub yum_check
{
    my @args = @_;
    my @cmd = ("yum", "check", @args);
    execute(@cmd);
}

sub yum_check_upgrade
{
    my @args = @_;
    my @cmd = ("yum", "check-upgrade", @args);
    execute(@cmd);
}

sub yum_clean
{
    my @args = @_;
    my @cmd = ("yum", "clean", @args);
    execute(@cmd);
}

sub yum_distro_sync
{
    my @args = @_;
    my @cmd = ("yum", "distro-sync", @args);
    execute(@cmd);
}

sub yum_downgrade
{
    my @args = @_;
    my @cmd = ("yum", "downgrade", @args);
    execute(@cmd);
}

sub yum_download
{
    my @args = @_;
    my @cmd = ("yum", "download", @args);
    execute(@cmd);
}

sub yum_environment
{
    my @args = @_;
    my @cmd = ("yum", "environment", @args);
    execute(@cmd);
}

sub yum_group
{
    my @args = @_;
    my @cmd = ("yum", "group", @args);
    execute(@cmd);
}

sub yum_history
{
    my @args = @_;
    my @cmd = ("yum", "history", @args);
    execute(@cmd);
}

sub yum_info
{
    my @args = @_;
    my @cmd = ("yum", "info", @args);
    execute(@cmd);
}

sub yum_install
{
    my @args = @_;
    my @cmd = ("yum", "install", @args);
    execute(@cmd);
}

sub yum_leaves
{
    my @args = @_;
    my @cmd = ("yum", "leaves", @args);
    execute(@cmd);
}

sub yum_list
{
    my @args = @_;
    my @cmd = ("yum", "list", @args);
    execute(@cmd);
}

sub yum_makecache
{
    my @args = @_;
    my @cmd = ("yum", "makecache", @args);
    execute(@cmd);
}

sub yum_mark
{
    my @args = @_;
    my @cmd = ("yum", "mark", @args);
    execute(@cmd);
}

sub yum_module
{
    my @args = @_;
    my @cmd = ("yum", "module", @args);
    execute(@cmd);
}

sub yum_offline
{
    my @args = @_;
    my @cmd = ("yum", "offline", @args);
    execute(@cmd);
}

sub yum_provides
{
    my @args = @_;
    my @cmd = ("yum", "provides", @args);
    execute(@cmd);
}

sub yum_reinstall
{
    my @args = @_;
    my @cmd = ("yum", "reinstall", @args);
    execute(@cmd);
}

sub yum_remove
{
    my @args = @_;
    my @cmd = ("yum", "remove", @args);
    execute(@cmd);
}

sub yum_replay
{
    my @args = @_;
    my @cmd = ("yum", "replay", @args);
    execute(@cmd);
}

sub yum_repo
{
    my @args = @_;
    my @cmd = ("yum", "repo", @args);
    execute(@cmd);
}

sub yum_repoquery
{
    my @args = @_;
    my @cmd = ("yum", "repoquery", @args);
    execute(@cmd);
}

sub yum_search
{
    my @args = @_;
    my @cmd = ("yum", "search", @args);
    execute(@cmd);
}

sub yum_swap
{
    my @args = @_;
    my @cmd = ("yum", "swap", @args);
    execute(@cmd);
}

sub yum_system_upgrade
{
    my @args = @_;
    my @cmd = ("yum", "system-upgrade", @args);
    execute(@cmd);
}

sub yum_upgrade
{
    my @args = @_;
    my @cmd = ("yum", "upgrade", @args);
    execute(@cmd);
}

sub yum_versionlock
{
    my @args = @_;
    my @cmd = ("yum", "versionlock", @args);
    execute(@cmd);
}

sub yum_debuginfo_install
{
    my @args = @_;
    my @cmd = ("yum", "debuginfo-install", @args);
    execute(@cmd);
}

sub yum_offline_distrosync
{
    my @args = @_;
    my @cmd = ("yum", "offline-distrosync", @args);
    execute(@cmd);
}

sub yum_offline_upgrade
{
    my @args = @_;
    my @cmd = ("yum", "offline-upgrade", @args);
    execute(@cmd);
}

sub yum_config_manager 
{
    my @args = @_;
    my @cmd = ("yum", "config-manager", @args);
    execute(@cmd);
}

sub yum_builddep
{
    my @args = @_;
    my @cmd = ("yum", "builddep", @args);
    execute(@cmd);
}

sub yum_changelog
{
    my @args = @_;
    my @cmd = ("yum", "changelog", @args);
    execute(@cmd);
}

sub yum_copr
{    
    my @args = @_;                   
    my @cmd = ("yum", "copr", @args);
    execute(@cmd);
}

sub yum_needs_restarting
{
    my @args = @_;
    my @cmd = ("yum", "needs-restarting", @args);
    execute(@cmd);
}

sub yum_repoclosure
{
    my @args = @_;
    my @cmd = ("yum", "repoclosure", @args);
    execute(@cmd);
}

sub yum_reposync
{
    my @args = @_;
    my @cmd = ("yum", "reposync", @args);
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
