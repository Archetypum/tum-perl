#!/usr/bin/perl

package Tum::InitSystem::Systemd;

use strict;
use warnings;

use constant RED   => "\e[31m";
use constant GREEN => "\e[0;32m";
use constant RESET => "\e[0m";

=pod

=cut

sub systemctl
{
    my @args = @_;
    my @cmd = ("systemctl", @args);
    execute(@cmd);
}

sub systemctl_add_requires
{
    my @args = @_;
    my @cmd = ("systemctl", "add-requires", @args);
    execute(@cmd);
}

sub systemctl_add_wants
{
    my @args = @_;
    my @cmd = ("systemctl", "add-wants", @args);
    execute(@cmd);
}

sub systemctl_bind
{
    my @args = @_;
    my @cmd = ("systemctl", "bind", @args);
    execute(@cmd);
}

sub systemctl_cancel
{
    my @args = @_;
    my @cmd = ("systemctl", "cancel", @args);
    execute(@cmd);
}

sub systemctl_cat
{
    my @args = @_;
    my @cmd = ("systemctl", "cat", @args);
    execute(@cmd);
}

sub systemctl_condreload
{
    my @args = @_;
    my @cmd = ("systemctl", "condreload", @args);
    execute(@cmd);
}

sub systemctl_condrestart
{
    my @args = @_;
    my @cmd = ("systemctl", "condrestart", @args);
    execute(@cmd);
}

sub systemctl_condstop
{
    my @args = @_;
    my @cmd = ("systemctl", "condstop", @args);
    execute(@cmd);
}

sub systemctl_daemon_reexec
{
    my @args = @_;
    my @cmd = ("systemctl", "daemon-reexec", @args);
    execute(@cmd);
}

sub systemctl_daemon_reload
{
    my @args = @_;
    my @cmd = ("systemctl", "daemon-reload", @args);
    execute(@cmd);
}

sub systemctl_default
{
    my @args = @_;
    my @cmd = ("systemctl", "default", @args);
    execute(@cmd);
}

sub systemctl_disable
{
    my @args = @_;
    my @cmd = ("systemctl", "disable", @args);
    execute(@cmd);
}

sub systemctl_edit
{
    my @args = @_;
    my @cmd = ("systemctl", "edit", @args);
    execute(@cmd);
}

sub systemctl_emergency
{
    my @args = @_;
    my @cmd = ("systemctl", "emergency", @args);
    execute(@cmd);
}

sub systemctl_enable
{
    my @args = @_;
    my @cmd = ("systemctl", "enable", @args);
    execute(@cmd);
}

sub systemctl_exit
{
    my @args = @_;
    my @cmd = ("systemctl", "exit", @args);
    execute(@cmd);
}

sub systemctl_force_reload
{
    my @args = @_;
    my @cmd = ("systemctl", "force-reload", @args);
    execute(@cmd);
}

sub systemctl_get_default
{
    my @args = @_;
    my @cmd = ("systemctl", "get-default", @args);
    execute(@cmd);
}

sub systemctl_halt
{
    my @args = @_;
    my @cmd = ("systemctl", "halt", @args);
    execute(@cmd);
}

sub systemctl_help
{
    my @args = @_;
    my @cmd = ("systemctl", "help", @args);
    execute(@cmd);
}

sub systemctl_hibernate
{
    my @args = @_;
    my @cmd = ("systemctl", "hibernate", @args);
    execute(@cmd);
}

sub systemctl_hybrid_sleep
{
    my @args = @_;
    my @cmd = ("systemctl", "hybrid-sleep", @args);
    execute(@cmd);
}

sub systemctl_import_environment
{
    my @args = @_;
    my @cmd = ("systemctl", "import-environment", @args);
    execute(@cmd);
}

sub systemctl_is_active
{
    my @args = @_;
    my @cmd = ("systemctl", "is-active", @args);
    execute(@cmd);
}

sub systemctl_is_enabled
{
    my @args = @_;
    my @cmd = ("systemctl", "is-enabled", @args);
    execute(@cmd);
}

sub systemctl_is_failed
{
    my @args = @_;
    my @cmd = ("systemctl", "is-failed", @args);
    execute(@cmd);
}

sub systemctl_isolate
{
    my @args = @_;
    my @cmd = ("systemctl", "isolate", @args);
    execute(@cmd);
}

sub systemctl_is_system_running
{
    my @args = @_;
    my @cmd = ("systemctl", "is-system-running", @args);
    execute(@cmd);
}

sub systemctl_kexec
{   
	my @args = @_;
    my @cmd = ("systemctl", "kexec", @args);
    execute(@cmd);
}

sub systemctl_kill
{   
	my @args = @_;
    my @cmd = ("systemctl", "kill", @args);
    execute(@cmd);
}

sub systemctl_link
{   
	my @args = @_;
    my @cmd = ("systemctl", "link", @args);
    execute(@cmd);
}

sub systemctl_list_automounts
{   
	my @args = @_;
    my @cmd = ("systemctl", "list-automounts", @args);
    execute(@cmd);
}

sub systemctl_list_dependencies
{   
	my @args = @_;
    my @cmd = ("systemctl", "list-dependencies", @args);
    execute(@cmd);
}

sub systemctl_list_jobs
{   
	my @args = @_;
    my @cmd = ("systemctl", "list-jobs", @args);
    execute(@cmd);
}

sub systemctl_list_machines
{   
	my @args = @_;
    my @cmd = ("systemctl", "list-machines", @args);
    execute(@cmd);
}

sub systemctl_list_sockets
{   
	my @args = @_;
    my @cmd = ("systemctl", "list-sockets", @args);
    execute(@cmd);
}

sub systemctl_list_timers
{   
	my @args = @_;
    my @cmd = ("systemctl", "list-timers", @args);
    execute(@cmd);
}

sub systemctl_list_unit_files
{   
	my @args = @_;
    my @cmd = ("systemctl", "list-unit-files", @args);
    execute(@cmd);
}

sub systemctl_list_units
{   
	my @args = @_;
    my @cmd = ("systemctl", "list-units", @args);
    execute(@cmd);
}

sub systemctl_log_level
{   
	my @args = @_;
    my @cmd = ("systemctl", "log-level", @args);
    execute(@cmd);
}

sub systemctl_log_target
{   
	my @args = @_;
    my @cmd = ("systemctl", "log-target", @args);
    execute(@cmd);
}

sub systemctl_mask
{   
	my @args = @_;
    my @cmd = ("systemctl", "mask", @args);
    execute(@cmd);
}

sub systemctl_mount_image
{   
	my @args = @_;
    my @cmd = ("systemctl", "mount-image", @args);
    execute(@cmd);
}

sub systemctl_poweroff
{   
	my @args = @_;
    my @cmd = ("systemctl", "poweroff", @args);
    execute(@cmd);
}

sub systemctl_preset
{   
	my @args = @_;
    my @cmd = ("systemctl", "preset", @args);
    execute(@cmd);
}

sub systemctl_presetl_all
{   
	my @args = @_;
    my @cmd = ("systemctl", "preset-all", @args);
    execute(@cmd);
}

sub systemctl_reboot
{   
	my @args = @_;
    my @cmd = ("systemctl", "reboot", @args);
    execute(@cmd);
}

sub systemctl_reenable
{   
	my @args = @_;
    my @cmd = ("systemctl", "reenable", @args);
    execute(@cmd);
}

sub systemctl_reload
{   
	my @args = @_;
    my @cmd = ("systemctl", "reload", @args);
    execute(@cmd);
}

sub systemctl_reload_or_restart
{   
	my @args = @_;
    my @cmd = ("systemctl", "reload-or-restart", @args);
    execute(@cmd);
}

sub systemctl_rescue
{   
	my @args = @_;
    my @cmd = ("systemctl", "rescue", @args);
    execute(@cmd);
}

sub systemctl_reset_failed
{   
	my @args = @_;
    my @cmd = ("systemctl", "reset-failed", @args);
    execute(@cmd);
}

sub systemctl_restart
{   
	my @args = @_;
    my @cmd = ("systemctl", "restart", @args);
    execute(@cmd);
}

sub systemctl_revert
{   
	my @args = @_;
    my @cmd = ("systemctl", "revert", @args);
    execute(@cmd);
}

sub systemctl_service_log_level
{   
	my @args = @_;
    my @cmd = ("systemctl", "service-log-level", @args);
    execute(@cmd);
}

sub systemctl_service_log_target
{   
	my @args = @_;
    my @cmd = ("systemctl", "service-log-target", @args);
    execute(@cmd);
}

sub systemctl_service_watchdogs
{   
	my @args = @_;
    my @cmd = ("systemctl", "service-watchdogs", @args);
    execute(@cmd);
}

sub systemctl_set_default
{   
	my @args = @_;
    my @cmd = ("systemctl", "set-default", @args);
    execute(@cmd);
}

sub systemctl_set_environment
{   
	my @args = @_;
    my @cmd = ("systemctl", "set-environment", @args);
    execute(@cmd);
}

sub systemctl_property
{   
	my @args = @_;
    my @cmd = ("systemctl", "property", @args);
    execute(@cmd);
}

sub systemctl_show
{   
	my @args = @_;
    my @cmd = ("systemctl", "show", @args);
    execute(@cmd);
}

sub systemctl_show_environment
{   
	my @args = @_;
    my @cmd = ("systemctl", "show-environment", @args);
    execute(@cmd);
}

sub systemctl_start
{   
	my @args = @_;
    my @cmd = ("systemctl", "start", @args);
    execute(@cmd);
}

sub systemctl_status
{   
	my @args = @_;
    my @cmd = ("systemctl", "status", @args);
    execute(@cmd);
}

sub systemctl_stop
{   
	my @args = @_;
    my @cmd = ("systemctl", "stop", @args);
    execute(@cmd);
}

sub systemctl_suspend
{   
	my @args = @_;
    my @cmd = ("systemctl", "suspend", @args);
    execute(@cmd);
}

sub systemctl_suspend_then_hibernate
{   
	my @args = @_;
    my @cmd = ("systemctl", "suspend-then-hibernate", @args);
    execute(@cmd);
}

sub systemctl_switch_root
{   
	my @args = @_;
    my @cmd = ("systemctl", "switch-root", @args);
    execute(@cmd);
}

sub systemctl_try_reload_or_restart
{   
	my @args = @_;
    my @cmd = ("systemctl", "try-reload-or-restart", @args);
    execute(@cmd);
}

sub systemctl_try_restart
{   
	my @args = @_;
    my @cmd = ("systemctl", "try-restart", @args);
    execute(@cmd);
}

sub systemctl_unmask
{   
	my @args = @_;
    my @cmd = ("systemctl", "unmask", @args);
    execute(@cmd);
}

sub systemctl_unset_environment
{   
	my @args = @_;
    my @cmd = ("systemctl", "unset-environment", @args);
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
