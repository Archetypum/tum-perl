#!/usr/bin/perl

package Tum::PackageManager::Trizen;

use strict;
use warnings;

use constant RED   => "\e[31m";
use constant GREEN => "\e[0;32m";
use constant RESET => "\e[0m";

=pod

=cut

sub trizen
{
    my @args = @_;
    my @cmd = ("trizen", @args);
    execute(@cmd);
}

sub trizen_sync
{
    my @args = @_;
    my @cmd = ("trizen", "--sync", @args);
    execute(@cmd);
}

sub trizen_comments
{
    my @args = @_;
    my @cmd = ("trizen", "--comments", @args);
    execute(@cmd);
}

sub trizen_get
{
    my @args = @_;
    my @cmd = ("trizen", "get", @args);
    execute(@cmd);
}

sub trizen_remove
{
    my @args = @_;
    my @cmd = ("trizen", "--remove", @args);
    execute(@cmd);
}

sub trizen_query
{
    my @args = @_;
    my @cmd = ("trizen", "--query", @args);
    execute(@cmd);
}

sub trizen_files
{
    my @args = @_;
    my @cmd = ("trizen", "--files", @args);
    execute(@cmd);
}

sub trizen_database
{
    my @args = @_;
    my @cmd = ("trizen", "--database", @args);
    execute(@cmd);
}

sub trizen_deptest
{
    my @args = @_;
    my @cmd = ("trizen", "--deptest", @args);
    execute(@cmd);
}

sub trizen_upgrade
{
    my @args = @_;
    my @cmd = ("trizen", "--upgrade", @args);
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

