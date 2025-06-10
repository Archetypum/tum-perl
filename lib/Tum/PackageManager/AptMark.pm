#!/usr/bin/perl

package Tum::PackageManager::AptMark;

use strict;
use warnings;

use constant RED   => "\e[31m";
use constant GREEN => "\e[0;32m";
use constant RESET => "\e[0m";

=pod

=cut

sub apt_mark
{
    my @args = @_;
    my @cmd = ("apt-mark", @args);
    execute(@cmd);
}

sub apt_mark_auto
{
    my @args = @_;
    my @cmd = ("apt-mark", "auto", @args);
    execute(@cmd);
}

sub apt_mark_manual
{
    my @args = @_;
    my @cmd = ("apt-mark", "manual", @args);
    execute(@cmd);
}

sub apt_mark_minimize_manual
{
    my @args = @_;
    my @cmd = ("apt-mark", "minimize-manual", @args);
    execute(@cmd);
}

sub apt_mark_showauto
{
    my @args = @_;
    my @cmd = ("apt-mark", "showauto", @args);
    execute(@cmd);
}

sub apt_mark_showmanual
{
    my @args = @_;
    my @cmd = ("apt-mark", "showmanual", @args);
    execute(@cmd);
}

sub apt_mark_hold
{
    my @args = @_;
    my @cmd = ("apt-mark", "hold", @args);
    execute(@cmd);
}

sub apt_mark_unhold
{
    my @args = @_;
    my @cmd = ("apt-mark", "unhold", @args);
    execute(@cmd);
}

sub apt_mark_showhold
{
    my @args = @_;
    my @cmd = ("apt-mark", "showhold", @args);
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
