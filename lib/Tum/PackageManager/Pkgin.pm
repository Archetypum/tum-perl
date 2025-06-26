#!/usr/bin/perl

package Tum::PackageManager::Pkgin;

use strict;
use warnings;

use constant RED   => "\e[31m";
use constant GREEN => "\e[0;32m";
use constant RESET => "\e[0m";

=pod

=cut

sub pkgin_list
{
    my @args = @_;
    my @cmd = ("pkgin", "list", @args);
    execute(@cmd);
}

sub pkgin_avail
{
    my @args = @_;
    my @cmd = ("pkgin", "avail", @args);
    execute(@cmd);
}

sub pkgin_search
{
    my @args = @_;
    my @cmd = ("pkgin", "search", @args);
    execute(@cmd);
}

sub pkgin_install
{
    my @args = @_;
    my @cmd = ("pkgin", "install", @args);
    execute(@cmd);
}

sub pkgin_update
{
    my @args = @_;
    my @cmd = ("pkgin", "update", @args);
    execute(@cmd);
}

sub pkgin_upgrade
{
    my @args = @_;
    my @cmd = ("pkgin", "upgrade", @args);
    execute(@cmd);
}

sub pkgin_full_upgrade
{
    my @args = @_;
    my @cmd = ("pkgin", "full-upgrade", @args);
    execute(@cmd);
}

sub pkgin_remove
{
    my @args = @_;
    my @cmd = ("pkgin", "remove", @args);
    execute(@cmd);
}

sub pkgin_keep
{
    my @args = @_;
    my @cmd = ("pkgin", "keep", @args);
    execute(@cmd);
}

sub pkgin_unkeep
{
    my @args = @_;
    my @cmd = ("pkgin", "unkeep", @args);
    execute(@cmd);
}

sub pkgin_export
{
    my @args = @_;
    my @cmd = ("pkgin", "export", @args);
    execute(@cmd);
}

sub pkgin_import
{
    my @args = @_;
    my @cmd = ("pkgin", "import", @args);
    execute(@cmd);
}

sub pkgin_show_keep
{
    my @args = @_;
    my @cmd = ("pkgin", "show-keep", @args);
    execute(@cmd);
}

sub pkgin_show_no_keep
{
    my @args = @_;
    my @cmd = ("pkgin", "show-no-keep", @args);
    execute(@cmd);
}

sub pkgin_autoremove
{
    my @args = @_;
    my @cmd = ("pkgin", "autoremove", @args);
    execute(@cmd);
}

sub pkgin_clean
{
    my @args = @_;
    my @cmd = ("pkgin", "clean", @args);
    execute(@cmd);
}

sub pkgin_show_deps
{
    my @args = @_;
    my @cmd = ("pkgin", "show-deps", @args);
    execute(@cmd);
}

sub pkgin_show_full_deps
{
    my @args = @_;
    my @cmd = ("pkgin", "show-full-deps", @args);
    execute(@cmd);
}

sub pkgin_show_rev_deps
{
    my @args = @_;
    my @cmd = ("pkgin", "show-rev-deps", @args);
    execute(@cmd);
}

sub pkgin_provides
{
    my @args = @_;
    my @cmd = ("pkgin", "provides", @args);
    execute(@cmd);
}

sub pkgin_requires
{
    my @args = @_;
    my @cmd = ("pkgin", "requires", @args);
    execute(@cmd);
}

sub pkgin_show_category
{
    my @args = @_;
    my @cmd = ("pkgin", "show-category", @args);
    execute(@cmd);
}

sub pkgin_show_pkg_category
{
    my @args = @_;
    my @cmd = ("pkgin", "show-pkg-category", @args);
    execute(@cmd);
}

sub pkgin_show_all_categories
{
    my @args = @_;
    my @cmd = ("pkgin", "show-all-categories", @args);
    execute(@cmd);
}

sub pkgin_pkg_content
{
    my @args = @_;
    my @cmd = ("pkgin", "pkg-content", @args);
    execute(@cmd);
}

sub pkgin_pkg_descr
{
    my @args = @_;
    my @cmd = ("pkgin", "pkg-descr", @args);
    execute(@cmd);
}

sub pkgin_pkg_build_defs
{
    my @args = @_;
    my @cmd = ("pkgin", "pkg-build-defs", @args);
    execute(@cmd);
}

sub pkgin_stats
{
    my @args = @_;
    my @cmd = ("pkgin", "stats", @args);
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
