#!/usr/bin/perl

package Tum::PackageManager::Pamac;

use strict;
use warnings;

use constant RED   => "\e[31m";
use constant GREEN => "\e[0;32m";
use constant RESET => "\e[0m";

=pod

=cut

sub pamac 
{
    my @args = @_;
    my @cmd = ("pamac", @args);
    execute(@cmd);
}

sub pamac_version 
{
    my @args = @_;
    my @cmd = ("pamac", "--version", @args);
    execute(@cmd);
}

sub pamac_help
{
    my @args = @_;
    my @cmd = ("pamac", "--help", @args);
    execute(@cmd);
}

sub pamac_search
{
    my @args = @_;
    my @cmd = ("pamac", "search", @args);
    execute(@cmd);
}

sub pamac_list 
{
    my @args = @_;
    my @cmd = ("pamac", "list", @args);
    execute(@cmd);
}

sub pamac_info
{
    my @args = @_;
    my @cmd = ("pamac", "info", @args);
    execute(@cmd);
}

sub pamac_install
{
    my @args = @_;
    my @cmd = ("pamac", "install", @args);
    execute(@cmd);
}

sub pamac_reinstall
{
    my @args = @_;
    my @cmd = ("pamac", "reinstall", @args);
    execute(@cmd);
}

sub pamac_remove
{
    my @args = @_;
    my @cmd = ("pamac", "remove", @args);
    execute(@cmd);
}

sub pamac_checkupdates
{
    my @args = @_;
    my @cmd = ("pamac", "checkupdates", @args);
    execute(@cmd);
}

sub pamac_upgrade
{
    my @args = @_;
    my @cmd = ("pamac", "upgrade", @args);
    execute(@cmd);
}

sub pamac_update
{
    my @args = @_;
    my @cmd = ("pamac", "update", @args);
    execute(@cmd);
}

sub pamac_clone 
{
    my @args = @_;
    my @cmd = ("pamac", "clone", @args);
    execute(@cmd);
}

sub pamac_build
{
    my @args = @_;
    my @cmd = ("pamac", "build", @args);
    execute(@cmd);
}

sub pamac_clean
{
    my @args = @_;
    my @cmd = ("pamac", "clean", @args);
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

