#!/usr/bin/perl

package Tum::PackageManager::HomeBrew;

use strict;
use warnings;

use constant RED   => "\e[31m";
use constant GREEN => "\e[0;32m";
use constant RESET => "\e[0m";

=pod

=cut

sub brew
{
    my @args = @_;
    my @cmd = ("brew", @args);
    execute(@cmd);
}

sub brew_alias
{
    my @args = @_;
    my @cmd = ("brew", "alias", @args);
    execute(@cmd);
}

sub brew_analytics
{
    my @args = @_;
    my @cmd = ("brew", "analytics", @args);
    execute(@cmd);
}

sub brew_autoremove
{
    my @args = @_;
    my @cmd = ("brew", "autoremove", @args);
    execute(@cmd);
}

sub brew_bundle
{
    my @args = @_;
    my @cmd = ("brew", "bundle", @args);
    execute(@cmd);
}

sub brew_casks
{
    my @args = @_;
    my @cmd = ("brew", "casks", @args);
    execute(@cmd);
}

sub brew_cleanup
{
    my @args = @_;
    my @cmd = ("brew", "cleanup", @args);
    execute(@cmd);
}

sub brew_command
{
    my @args = @_;
    my @cmd = ("brew", "command", @args);
    execute(@cmd);
}

sub brew_commands
{
    my @args = @_;
    my @cmd = ("brew", "commands", @args);
    execute(@cmd);
}

sub brew_completions
{
    my @args = @_;
    my @cmd = ("brew", "completions", @args);
    execute(@cmd);
}

sub brew_config
{
    my @args = @_;
    my @cmd = ("brew", "config", @args);
    execute(@cmd);
}

sub brew_deps
{
    my @args = @_;
    my @cmd = ("brew", "deps", @args);
    execute(@cmd);
}

sub brew_desc
{
    my @args = @_;
    my @cmd = ("brew", "desc", @args);
    execute(@cmd);
}

sub brew_developer
{
    my @args = @_;
    my @cmd = ("brew", "developer", @args);
    execute(@cmd);
}

sub brew_docs
{
    my @args = @_;
    my @cmd = ("brew", "docs", @args);
    execute(@cmd);
}

sub brew_fetch
{
    my @args = @_;
    my @cmd = ("brew", "fetch", @args);
    execute(@cmd);
}

sub brew_formulae
{
    my @args = @_;
    my @cmd = ("brew", "formulae", @args);
    execute(@cmd);
}

sub brew_gist_logs
{
    my @args = @_;
    my @cmd = ("brew", "gist-logs", @args);
    execute(@cmd);
}

sub brew_help
{
    my @args = @_;
    my @cmd = ("brew", "help", @args);
    execute(@cmd);
}

sub brew_home
{
    my @args = @_;
    my @cmd = ("brew", "home", @args);
    execute(@cmd);
}

sub brew_install
{
    my @args = @_;
    my @cmd = ("brew", "install", @args);
    execute(@cmd);
}

sub brew_leaves
{
    my @args = @_;
    my @cmd = ("brew", "leaves", @args);
    execute(@cmd);
}

sub brew_link
{
    my @args = @_;
    my @cmd = ("brew", "link", @args);
    execute(@cmd);
}

sub brew_list
{
    my @args = @_;
    my @cmd = ("brew", "list", @args);
    execute(@cmd);
}

sub brew_log
{
    my @args = @_;
    my @cmd = ("brew", "log", @args);
    execute(@cmd);
}

sub brew_mcp_server
{
    my @args = @_;
    my @cmd = ("brew", "mcp-server", @args);
    execute(@cmd);
}

sub brew_migrate
{
    my @args = @_;
    my @cmd = ("brew", "migrate", @args);
    execute(@cmd);
}

sub brew_missing
{
    my @args = @_;
    my @cmd = ("brew", "missing", @args);
    execute(@cmd);
}

sub brew_nodenv_sync
{
    my @args = @_;
    my @cmd = ("brew", "nodenv-sync", @args);
    execute(@cmd);
}

sub brew_options
{
    my @args = @_;
    my @cmd = ("brew", "options", @args);
    execute(@cmd);
}

sub brew_outdated
{
    my @args = @_;
    my @cmd = ("brew", "outdated", @args);
    execute(@cmd);
}

sub brew_pin
{
    my @args = @_;
    my @cmd = ("brew", "pin", @args);
    execute(@cmd);
}

sub brew_postinstall
{
    my @args = @_;
    my @cmd = ("brew", "postinstall", @args);
    execute(@cmd);
}

sub brew_pyenv_sync
{
    my @args = @_;
    my @cmd = ("brew", "pyenv-sync", @args);
    execute(@cmd);
}

sub brew_rbenv_sync
{
    my @args = @_;
    my @cmd = ("brew", "rbenv-sync", @args);
    execute(@cmd);
}

sub brew_readall
{
    my @args = @_;
    my @cmd = ("brew", "readall", @args);
    execute(@cmd);
}

sub brew_reinstall
{
    my @args = @_;
    my @cmd = ("brew", "reinstall", @args);
    execute(@cmd);
}

sub brew_search
{
    my @args = @_;
    my @cmd = ("brew", "search", @args);
    execute(@cmd);
}

sub brew_services
{
    my @args = @_;
    my @cmd = ("brew", "services", @args);
    execute(@cmd);
}

sub brew_setup_ruby
{
    my @args = @_;
    my @cmd = ("brew", "setup-ruby", @args);
    execute(@cmd);
}

sub brew_shellenv
{
    my @args = @_;
    my @cmd = ("brew", "shellenv", @args);
    execute(@cmd);
}

sub brew_tab
{
    my @args = @_;
    my @cmd = ("brew", "tab", @args);
    execute(@cmd);
}

sub brew_tap
{
    my @args = @_;
    my @cmd = ("brew", "tap", @args);
    execute(@cmd);
}

sub brew_tap_info
{
    my @args = @_;
    my @cmd = ("brew", "tap-info", @args);
    execute(@cmd);
}

sub brew_unalias
{
    my @args = @_;
    my @cmd = ("brew", "unalias", @args);
    execute(@cmd);
}

sub brew_uninstall
{
    my @args = @_;
    my @cmd = ("brew", "uninstall", @args);
    execute(@cmd);
}

sub brew_unlink
{
    my @args = @_;
    my @cmd = ("brew", "unlink", @args);
    execute(@cmd);
}

sub brew_unpin
{
    my @args = @_;
    my @cmd = ("brew", "unpin", @args);
    execute(@cmd);
}

sub brew_untap
{
    my @args = @_;
    my @cmd = ("brew", "untap", @args);
    execute(@cmd);
}

sub brew_update
{
    my @args = @_;
    my @cmd = ("brew", "update", @args);
    execute(@cmd);
}

sub brew_update_if_needed
{
    my @args = @_;
    my @cmd = ("brew", "update-if-needed", @args);
    execute(@cmd);
}

sub brew_update_reset
{
    my @args = @_;
    my @cmd = ("brew", "update-reset", @args);
    execute(@cmd);
}

sub brew_upgrade
{
    my @args = @_;
    my @cmd = ("brew", "upgrade", @args);
    execute(@cmd);
}

sub brew_uses
{
    my @args = @_;
    my @cmd = ("brew", "uses", @args);
    execute(@cmd);
}

sub brew_cache
{
    my @args = @_;
    my @cmd = ("brew", "--cache", @args);
    execute(@cmd);
}

sub brew_caskroom
{
    my @args = @_;
    my @cmd = ("brew", "--caskroom", @args);
    execute(@cmd);
}

sub brew_cellar
{
    my @args = @_;
    my @cmd = ("brew", "--cellar", @args);
    execute(@cmd);
}

sub brew_env
{
    my @args = @_;
    my @cmd = ("brew", "--env", @args);
    execute(@cmd);
}

sub brew_prefix
{
    my @args = @_;
    my @cmd = ("brew", "--prefix", @args);
    execute(@cmd);
}

sub brew_repository
{
    my @args = @_;
    my @cmd = ("brew", "--repository", @args);
    execute(@cmd);
}

sub brew_version
{
    my @args = @_;
    my @cmd = ("brew", "--version", @args);
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
