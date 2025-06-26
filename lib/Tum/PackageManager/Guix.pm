#!/usr/bin/perl

package Tum::PackageManager::Guix;

use strict;
use warnings;

use constant RED   => "\e[31m";
use constant GREEN => "\e[0;32m";
use constant RESET => "\e[0m";

=pod

=cut

sub guix
{
    my @args = @_;
    my @cmd = ("guix", @args);
    execute(@cmd);
}

sub guix_archive
{
    my @args = @_;
    my @cmd = ("guix", "archive", @args);
    execute(@cmd);
}

sub guix_build
{
    my @args = @_;
    my @cmd = ("guix", "build", @args);
    execute(@cmd);
}

sub guix_challenge
{
    my @args = @_;
    my @cmd = ("guix", "challenge", @args);
    execute(@cmd);
}

sub guix_container
{
    my @args = @_;
    my @cmd = ("guix", "container", @args);
    execute(@cmd);
}

sub guix_copy
{
    my @args = @_;
    my @cmd = ("guix", "copy", @args);
    execute(@cmd);
}

sub guix_deploy
{
    my @args = @_;
    my @cmd = ("guix", "deploy", @args);
    execute(@cmd);
}

sub guix_describe
{
    my @args = @_;
    my @cmd = ("guix", "describe", @args);
    execute(@cmd);
}

sub guix_download
{
    my @args = @_;
    my @cmd = ("guix", "download", @args);
    execute(@cmd);
}

sub guix_edit
{
    my @args = @_;
    my @cmd = ("guix", "edit", @args);
    execute(@cmd);
}

sub guix_environment
{
    my @args = @_;
    my @cmd = ("guix", "environment", @args);
    execute(@cmd);
}

sub guix_gc
{
    my @args = @_;
    my @cmd = ("guix", "gc", @args);
    execute(@cmd);
}

sub guix_git
{
    my @args = @_;
    my @cmd = ("guix", "git", @args);
    execute(@cmd);
}

sub guix_graph
{
    my @args = @_;
    my @cmd = ("guix", "graph", @args);
    execute(@cmd);
}

sub guix_hash
{
    my @args = @_;
    my @cmd = ("guix", "hash", @args);
    execute(@cmd);
}

sub guix_help
{
    my @args = @_;
    my @cmd = ("guix", "--help", @args);
    execute(@cmd);
}

sub guix_home
{
    my @args = @_;
    my @cmd = ("guix", "home", @args);
    execute(@cmd);
}

sub guix_import
{
    my @args = @_;
    my @cmd = ("guix", "import", @args);
    execute(@cmd);
}

sub guix_install
{
    my @args = @_;
    my @cmd = ("guix", "install", @args);
    execute(@cmd);
}

sub guix_lint
{
    my @args = @_;
    my @cmd = ("guix", "lint", @args);
    execute(@cmd);
}

sub guix_offload
{
    my @args = @_;
    my @cmd = ("guix", "offload", @args);
    execute(@cmd);
}

sub guix_pack
{
    my @args = @_;
    my @cmd = ("guix", "pack", @args);
    execute(@cmd);
}

sub guix_package
{
    my @args = @_;
    my @cmd = ("guix", "package", @args);
    execute(@cmd);
}

sub guix_processes
{
    my @args = @_;
    my @cmd = ("guix", "processes", @args);
    execute(@cmd);
}

sub guix_publish
{
    my @args = @_;
    my @cmd = ("guix", "publish", @args);
    execute(@cmd);
}

sub guix_pull
{
    my @args = @_;
    my @cmd = ("guix", "pull", @args);
    execute(@cmd);
}

sub guix_refresh
{
    my @args = @_;
    my @cmd = ("guix", "refresh", @args);
    execute(@cmd);
}

sub guix_remove
{
    my @args = @_;
    my @cmd = ("guix", "remove", @args);
    execute(@cmd);
}

sub guix_repl
{
    my @args = @_;
    my @cmd = ("guix", "repl", @args);
    execute(@cmd);
}

sub guix_search
{
    my @args = @_;
    my @cmd = ("guix", "search", @args);
    execute(@cmd);
}

sub guix_shell
{
    my @args = @_;
    my @cmd = ("guix", "shell", @args);
    execute(@cmd);
}

sub guix_show
{
    my @args = @_;
    my @cmd = ("guix", "show", @args);
    execute(@cmd);
}

sub guix_size
{
    my @args = @_;
    my @cmd = ("guix", "size", @args);
    execute(@cmd);
}

sub guix_style
{
    my @args = @_;
    my @cmd = ("guix", "style", @args);
    execute(@cmd);
}

sub guix_system
{
    my @args = @_;
    my @cmd = ("guix", "system", @args);
    execute(@cmd);
}

sub guix_time_machine
{
    my @args = @_;
    my @cmd = ("guix", "time-machine", @args);
    execute(@cmd);
}

sub guix_upgrade
{
    my @args = @_;
    my @cmd = ("guix", "upgrade", @args);
    execute(@cmd);
}

sub guix_weather
{
    my @args = @_;
    my @cmd = ("guix", "weather", @args);
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
