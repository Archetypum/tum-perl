#!/usr/bin/perl

package Tum::PackageManager::Qi;

use strict;
use warnings;

use constant RED   => "\e[31m";
use constant GREEN => "\e[0;32m";
use constant RESET => "\e[0m";

=pod

=cut

sub qi
{
    my @args = @_;
    my @cmd = ("qi", @args);
    execute(@cmd);
}

sub qi_warn
{
    my @args = @_;
    my @cmd = ("qi", "warn", @args);
    execute(@cmd);
}

sub qi_install
{
    my @args = @_;
    my @cmd = ("qi", "install", @args);
    execute(@cmd);
}

sub qi_remove
{
    my @args = @_;
    my @cmd = ("qi", "remove", @args);
    execute(@cmd);
}

sub qi_upgrade
{
    my @args = @_;
    my @cmd = ("qi", "upgrade", @args);
    execute(@cmd);
}

sub qi_extract
{
    my @args = @_;
    my @cmd = ("qi", "extract", @args);
    execute(@cmd);
}

sub qi_create
{
    my @args = @_;
    my @cmd = ("qi", "create", @args);
    execute(@cmd);
}

sub qi_build
{
    my @args = @_;
    my @cmd = ("qi", "build", @args);
    execute(@cmd);
}

sub qi_order
{
    my @args = @_;
    my @cmd = ("qi", "order", @args);
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
