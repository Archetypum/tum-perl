#!/usr/bin/perl

package Tum::InitSystem::SysVInit;

use strict;
use warnings;

use constant RED   => "\e[31m";
use constant GREEN => "\e[0;32m";
use constant RESET => "\e[0m";

sub new
{
    my ($class, $command, $service) = @_;
    my $self = {
        command => $command,
        service => $service
    };

    if ($command eq "--status-all" && $service eq "")
    {
        $self->{status_all} = 1;
    }

    if ($command eq "--full-restart" && $service ne "")
    {
        $self->{full_restart} = 1;
    }

    bless $self, $class;
    return $self;
}

sub _run_service
{
    my $exit_code;
    my ($self, $action) = @_;

    eval
    {
        $exit_code = system("service", $self->{service}, $action);
        die "[!] Error: Service command failed.\n" if $exit_code != 0;
    };

    if ($@)
    {
        print RED, "[!] Error: $@", RESET, "\n";
        return 1;
    }

    return 0;
}

sub start_service        { shift->_run_service("start") }
sub stop_service         { shift->_run_service("stop") }
sub reload_service       { shift->_run_service("reload") }
sub force_reload_service { shift->_run_service("force-reload") }
sub restart_service      { shift->_run_service("restart") }
sub status_service       { shift->_run_service("status") }

sub status_all_service   
{
    my $exit_code;
    $exit_code = system("service --status-all");
    die "[!] Error: Service command failed.\n" if $exit_code != 0;
}

sub full_restart_service 
{
    my $self = shift;
    
    unless ($self->{service})
    {
        print RED, "[!] Error: --full-restart requires a service name.\n", RESET;
        return 1;
    }
    
    my $exit_code;
    $exit_code = system("service", $self->{service}, "--full-restart");
    die "[!] Error: Service command failed.\n" if $exit_code != 0;
}

sub execute
{
    my $self = shift;

    if ($self->{status_all})
    {
        return $self->status_all_service();
    }

    if ($self->{full_restart})
    {
        return $self->full_restart_service();
    }

    my %commands = (
        start        => sub { $self->start_service },
        stop         => sub { $self->stop_service },
        reload       => sub { $self->reload_service },
        force_reload => sub { $self->force_reload_service },
        restart      => sub { $self->restart_service },
        status       => sub { $self->status_service }
    );

    if (exists $commands{ $self->{command} })
    {
        return $commands{ $self->{command} }->();
    }
    else
    {
        print RED, "[!] Error: Unknown command: $self->{command}", RESET, "\n";
        return 1;
    }
}

1;

