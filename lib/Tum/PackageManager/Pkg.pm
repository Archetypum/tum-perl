#!/usr/bin/perl

package Tum::PackageManager::Pkg;

use strict;
use warnings;

use constant RED   => "\e[31m";
use constant GREEN => "\e[0;32m";
use constant RESET => "\e[0m";

=pod

=cut

sub pkg_add
{
    my @args = @_;
    my @cmd = ("pkg", "add", @args);
    execute(@cmd);
}

sub pkg_alias
{
    my @args = @_;
    my @cmd = ("pkg", "alias", @args);
    execute(@cmd);
}

sub pkg_all_depends
{
    my @args = @_;
    my @cmd = ("pkg", "all-depends", @args);
    execute(@cmd);
}

sub pkg_annotate
{
    my @args = @_;
    my @cmd = ("pkg", "annotate", @args);
    execute(@cmd);
}

sub pkg_annotations
{
    my @args = @_;
    my @cmd = ("pkg", "annotations", @args);
    execute(@cmd);
}

sub pkg_audit
{
    my @args = @_;
    my @cmd = ("pkg", "audit", @args);
    execute(@cmd);
}

sub pkg_autoremove
{
    my @args = @_;
    my @cmd = ("pkg", "autoremove", @args);
    execute(@cmd);
}

sub pkg_backup
{
    my @args = @_;
    my @cmd = ("pkg", "backup", @args);
    execute(@cmd);
}

sub pkg_bootstrap
{
    my @args = @_;
    my @cmd = ("pkg", "bootstrap", @args);
    execute(@cmd);
}

sub pkg_build_depends
{
    my @args = @_;
    my @cmd = ("pkg", "build-depends", @args);
    execute(@cmd);
}

sub pkg_check
{
    my @args = @_;
    my @cmd = ("pkg", "check", @args);
    execute(@cmd);
}

sub pkg_cinfo
{
    my @args = @_;
    my @cmd = ("pkg", "cinfo", @args);
    execute(@cmd);
}

sub pkg_clean
{
    my @args = @_;
    my @cmd = ("pkg", "clean", @args);
    execute(@cmd);
}

sub pkg_comment
{
    my @args = @_;
    my @cmd = ("pkg", "comment", @args);
    execute(@cmd);
}

sub pkg_convert
{
    my @args = @_;
    my @cmd = ("pkg", "convert", @args);
    execute(@cmd);
}

sub pkg_create
{
    my @args = @_;
    my @cmd = ("pkg", "create", @args);
    execute(@cmd);
}

sub pkg_csearch
{
    my @args = @_;
    my @cmd = ("pkg", "csearch", @args);
    execute(@cmd);
}

sub pkg_delete
{
    my @args = @_;
    my @cmd = ("pkg", "delete", @args);
    execute(@cmd);
}

sub pkg_desc
{
    my @args = @_;
    my @cmd = ("pkg", "desc", @args);
    execute(@cmd);
}

sub pkg_download
{
    my @args = @_;
    my @cmd = ("pkg", "download", @args);
    execute(@cmd);
}

sub pkg_fetch
{
    my @args = @_;
    my @cmd = ("pkg", "fetch", @args);
    execute(@cmd);
}

sub pkg_help
{
    my @args = @_;
    my @cmd = ("pkg", "help", @args);
    execute(@cmd);
}

sub pkg_iinfo
{
    my @args = @_;
    my @cmd = ("pkg", "iinfo", @args);
    execute(@cmd);
}

sub pkg_info
{
    my @args = @_;
    my @cmd = ("pkg", "info", @args);
    execute(@cmd);
}

sub pkg_install
{
    my @args = @_;
    my @cmd = ("pkg", "install", @args);
    execute(@cmd);
}

sub pkg_isearch
{
    my @args = @_;
    my @cmd = ("pkg", "isearch", @args);
    execute(@cmd);
}

sub pkg_leaf
{
    my @args = @_;
    my @cmd = ("pkg", "leaf", @args);
    execute(@cmd);
}

sub pkg_list
{
    my @args = @_;
    my @cmd = ("pkg", "list", @args);
    execute(@cmd);
}

sub pkg_lock
{
    my @args = @_;
    my @cmd = ("pkg", "lock", @args);
    execute(@cmd);
}

sub pkg_noauto
{
    my @args = @_;
    my @cmd = ("pkg", "noauto", @args);
    execute(@cmd);
}

sub pkg_options
{
    my @args = @_;
    my @cmd = ("pkg", "options", @args);
    execute(@cmd);
}

sub pkg_origin
{
    my @args = @_;
    my @cmd = ("pkg", "options", @args);
    execute(@cmd);
}

sub pkg_orphans
{
    my @args = @_;
    my @cmd = ("pkg", "orphans", @args);
    execute(@cmd);
}

sub pkg_plugins
{
    my @args = @_;
    my @cmd = ("pkg", "plugins", @args);
    execute(@cmd);
}

sub pkg_prime_list
{
    my @args = @_;
    my @cmd = ("pkg", "prime-list", @args);
    execute(@cmd);
}

sub pkg_prime_origins
{
    my @args = @_;
    my @cmd = ("pkg", "prime-origins", @args);
    execute(@cmd);
}

sub pkg_provided_depends
{
    my @args = @_;
    my @cmd = ("pkg", "provided-depends", @args);
    execute(@cmd);
}

sub pkg_query
{
    my @args = @_;
    my @cmd = ("pkg", "query", @args);
    execute(@cmd);
}

sub pkg_rall_depends
{
    my @args = @_;
    my @cmd = ("pkg", "rall-depends", @args);
    execute(@cmd);
}

sub pkg_raw
{
    my @args = @_;
    my @cmd = ("pkg", "raw", @args);
    execute(@cmd);
}

sub pkg_rcomment
{
    my @args = @_;
    my @cmd = ("pkg", "rcomment", @args);
    execute(@cmd);
}

sub pkg_rdesc
{
    my @args = @_;
    my @cmd = ("pkg", "rdesc", @args);
    execute(@cmd);
}

sub pkg_register
{
    my @args = @_;
    my @cmd = ("pkg", "register", @args);
    execute(@cmd);
}

sub pkg_remove
{
    my @args = @_;
    my @cmd = ("pkg", "remove", @args);
    execute(@cmd);
}

sub pkg_repo
{
    my @args = @_;
    my @cmd = ("pkg", "repo", @args);
    execute(@cmd);
}

sub pkg_required_depends
{
    my @args = @_;
    my @cmd = ("pkg", "required-depends", @args);
    execute(@cmd);
}

sub pkg_roptions
{
    my @args = @_;
    my @cmd = ("pkg", "roptions", @args);
    execute(@cmd);
}

sub pkg_rquery
{
    my @args = @_;
    my @cmd = ("pkg", "rquery", @args);
    execute(@cmd);
}

sub pkg_runmaintained
{
    my @args = @_;
    my @cmd = ("pkg", "runmaintained", @args);
    execute(@cmd);
}

sub pkg_search
{
    my @args = @_;
    my @cmd = ("pkg", "search", @args);
    execute(@cmd);
}

sub pkg_set
{
    my @args = @_;
    my @cmd = ("pkg", "set", @args);
    execute(@cmd);
}

sub pkg_shared_depends
{
    my @args = @_;
    my @cmd = ("pkg", "shared-depends", @args);
    execute(@cmd);
}

sub pkg_shell
{
    my @args = @_;
    my @cmd = ("pkg", "shell", @args);
    execute(@cmd);
}

sub pkg_shlib
{
    my @args = @_;
    my @cmd = ("pkg", "shlib", @args);
    execute(@cmd);
}

sub pkg_show
{
    my @args = @_;
    my @cmd = ("pkg", "show", @args);
    execute(@cmd);
}

sub pkg_size
{
    my @args = @_;
    my @cmd = ("pkg", "size", @args);
    execute(@cmd);
}

sub pkg_stats
{
    my @args = @_;
    my @cmd = ("pkg", "stats", @args);
    execute(@cmd);
}

sub pkg_unlock
{
    my @args = @_;
    my @cmd = ("pkg", "unlock", @args);
    execute(@cmd);
}

sub pkg_unmaintained
{
    my @args = @_;
    my @cmd = ("pkg", "unmaintained", @args);
    execute(@cmd);
}

sub pkg_update
{
    my @args = @_;
    my @cmd = ("pkg", "update", @args);
    execute(@cmd);
}

sub pkg_updating
{
    my @args = @_;
    my @cmd = ("pkg", "updating", @args);
    execute(@cmd);
}

sub pkg_upgrade
{
    my @args = @_;
    my @cmd = ("pkg", "upgrade", @args);
    execute(@cmd);
}

sub pkg_version
{
    my @args = @_;
    my @cmd = ("pkg", "version", @args);
    execute(@cmd);
}

sub pkg_which
{
    my @args = @_;
    my @cmd = ("pkg", "which", @args);
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
