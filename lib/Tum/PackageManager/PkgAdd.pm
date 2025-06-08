#!perl

package Tum::PackageManager::PkgAdd;

use strict;
use warnings;

use constant RED   => "\e[31m";
use constant GREEN => "\e[0;32m";
use constant RESET => "\e[0m";

sub pkg_add
{
    my @args = @_;
    my @cmd = ("pkg_add", @args);
    execute(@cmd);
}

sub pkg_add_help
{
    my @args = @_;
    my @cmd = ("pkg_add", "-h", @args);
    execute(@cmd);
}

sub pkg_add_version
{
    my @args = @_;
    my @cmd = ("pkg_add", "-V", @args);
    execute(@cmd);
}

sub pkg_info
{
    my @args = @_;
    my @cmd = ("pkg_info", @args);
    execute(@cmd);
}

sub pkg_delete
{
    my @args = @_;
    my @cmd = ("pkg_delete", @args);
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
