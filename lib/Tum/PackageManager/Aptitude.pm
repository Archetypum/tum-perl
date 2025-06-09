#!perl

package Tum::PackageManager::Aptitude;

use strict;
use warnings;

use constant RED   => "\e[31m";
use constant GREEN => "\e[0;32m";
use constant RESET => "\e[0m";

=pod

=cut

sub aptitude
{
    my @args = @_;
    my @cmd = ("aptitude", @args);
    execute(@cmd);
}

sub aptitude_add_user_tag
{
    my @args = @_;
    my @cmd = ("aptitude", "add-user-tag", @args);
    execute(@cmd);
}

sub aptitude_clean
{
    my @args = @_;
    my @cmd = ("aptitude", "clean", @args);
    execute(@cmd);
}

sub aptitude_forget_new
{
    my @args = @_;
    my @cmd = ("aptitude", "forget-new", @args);
    execute(@cmd);
}

sub aptitude_keep
{
    my @args = @_;
    my @cmd = ("aptitude", "keep", @args);
    execute(@cmd);
}

sub aptitude_reinstall
{
    my @args = @_;
    my @cmd = ("aptitude", "reinstall", @args);
    execute(@cmd);
}

sub aptitude_search
{
    my @args = @_;
    my @cmd = ("aptitude", "search", @args);
    execute(@cmd);
}

sub aptitude_update
{
    my @args = @_;
    my @cmd = ("aptitude", "update", @args);
    execute(@cmd);
}

sub aptitude_why_not
{
    my @args = @_;
    my @cmd = ("aptitude", "why-not", @args);
    execute(@cmd);
}

sub aptitude_autoclean
{
    my @args = @_;
    my @cmd = ("aptitude", "autoclean", @args);
    execute(@cmd);
}

sub aptitude_dist_upgrade
{
    my @args = @_;
    my @cmd = ("aptitude", "dist-upgrade", @args);
    execute(@cmd);
}

sub aptitude_full_upgrade
{
    my @args = @_;
    my @cmd = ("aptitude", "full-upgrade", @args);
    execute(@cmd);
}

sub aptitude_keep_all
{
    my @args = @_;
    my @cmd = ("aptitude", "keep-all", @args);
    execute(@cmd);
}

sub aptitude_remove
{
    my @args = @_;
    my @cmd = ("aptitude", "remove", @args);
    execute(@cmd);
}

sub aptitude_show
{
    my @args = @_;
    my @cmd = ("aptitude", "show", @args);
    execute(@cmd);
}

sub aptitude_upgrade
{
    my @args = @_;
    my @cmd = ("aptitude", "upgrade", @args);
    execute(@cmd);
}

sub aptitude_build_dep
{
    my @args = @_;
    my @cmd = ("aptitude", "build-dep", @args);
    execute(@cmd);
}

sub aptitude_download
{
    my @args = @_;
    my @cmd = ("aptitude", "download", @args);
    execute(@cmd);
}

sub aptitude_hold
{
    my @args = @_;
    my @cmd = ("aptitude", "hold", @args);
    execute(@cmd);
}

sub aptitude_markauto
{
    my @args = @_;
    my @cmd = ("aptitude", "markauto", @args);
    execute(@cmd);
}

sub aptitude_remove_user_tag
{
    my @args = @_;
    my @cmd = ("aptitude", "remove-user-tag", @args);
    execute(@cmd);
}

sub aptitude_unhold
{
    my @args = @_;
    my @cmd = ("aptitude", "unhold", @args);
    execute(@cmd);
}

sub aptitude_versions
{
    my @args = @_;
    my @cmd = ("aptitude", "versions", @args);
    execute(@cmd);
}

sub aptitude_changelog
{
    my @args = @_;
    my @cmd = ("aptitude", "changelog", @args);
    execute(@cmd);
}

sub aptitude_forbid_version
{
    my @args = @_;
    my @cmd = ("aptitude", "forbid-version", @args);
    execute(@cmd);
}

sub aptitude_install
{
    my @args = @_;
    my @cmd = ("aptitude", "install", @args);
    execute(@cmd);
}

sub aptitude_purge
{
    my @args = @_;
    my @cmd = ("aptitude", "purge", @args);
    execute(@cmd);
}

sub aptitude_safe_upgrade
{
    my @args = @_;
    my @cmd = ("aptitude", "safe-upgrade", @args);
    execute(@cmd);
}

sub aptitude_unmarkauto
{
    my @args = @_;
    my @cmd = ("aptitude", "unmarkauto", @args);
    execute(@cmd);
}

sub aptitude_why
{
    my @args = @_;
    my @cmd = ("aptitude", "why", @args);
    execute(@cmd);
}

sub execute
{
    my @execution_target = @_;

    print GREEN, "[<==] Executing '@execution_target'...\n", RESET;
    system(@execution_target) == 0 or do { print RED, "[!] Error: Failed to execute: '@execution_target'.", RESET, "\n"; return 1; };
    print GREEN, "[*] Success!\n", RESET;
    return 0;
}

1;
