#!/usr/bin/perl

package Tum::PackageManager::Slackpkg;

use strict;
use warnings;

use constant RED   => "\e[31m";
use constant GREEN => "\e[0;32m";
use constant RESET => "\e[0m";

=pod

=cut

sub slackpkg
{
    my @args = @_;
    my @cmd = ("slackpkg", @args);
    execute(@cmd);
}

sub slackpkg_search
{
    my @args = @_;
    my @cmd = ("slackpkg", "search", @args);
    execute(@cmd);
}

sub slackpkg_install
{
    my @args = @_;
    my @cmd = ("slackpkg", "install", @args);
    execute(@cmd);
}

sub slackpkg_upgrade
{
    my @args = @_;
    my @cmd = ("slackpkg", "upgrade", @args);
    execute(@cmd);
}

sub slackpkg_reinstall
{
    my @args = @_;
    my @cmd = ("slackpkg", "reinstall", @args);
    execute(@cmd);
}

sub slackpkg_remove
{
    my @args = @_;
    my @cmd = ("slackpkg", "remove", @args);
    execute(@cmd);
}

sub slackpkg_blacklist
{
    my @args = @_;
    my @cmd = ("slackpkg", "blacklist", @args);
    execute(@cmd);
}

sub slackpkg_download
{
    my @args = @_;
    my @cmd = ("slackpkg", "download", @args);
    execute(@cmd);
}

sub slackpkg_info
{
    my @args = @_;
    my @cmd = ("slackpkg", "info", @args);
    execute(@cmd);
}

sub slackpkg_clean_system
{
    my @args = @_;
    my @cmd = ("slackpkg", "clean-system", @args);
    execute(@cmd);
}

sub slackpkg_upgrade_all
{
    my @args = @_;
    my @cmd = ("slackpkg", "upgrade-all", @args);
    execute(@cmd);
}

sub slackpkg_install_new
{
    my @args = @_;
    my @cmd = ("slackpkg", "install-new", @args);
    execute(@cmd);
}

sub slackpkg_check_updates
{
    my @args = @_;
    my @cmd = ("slackpkg", "check-updates", @args);
    execute(@cmd);
}

sub slackpkg_update
{
    my @args = @_;
    my @cmd = ("slackpkg", "update", @args);
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
