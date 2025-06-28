#!/usr/bin/perl

package Tum::InitSystem::OpenRC;

use strict;
use warnings;

use constant RED   => "\e[31m";
use constant RESET => "\e[0m";

=pod

=cut

sub new
{
    my ($class, $command, $service) = @_;
    die "[!] Error: Command is required.\n" unless defined $command;

    my $self = {
        command => $command,
        service => $service // "",
    };

    bless $self, $class;

    return $self;
}

sub _run_rc_service
{
    my ($self, $action) = @_;
    my $exit_code;

    eval
    {
        $exit_code = system("rc-service", $self->{service}, $action);
        $exit_code = $exit_code >> 8;
        die "[!] Error: 'rc-service' command failed.\n" if $exit_code != 0;
    };

    if ($@)
    {
        print RED, "[!] Error: $@", RESET, "\n";
        return 0;
    }

    return 1;
}

sub start_service        { shift->_run_rc_service("start") }
sub stop_service         { shift->_run_rc_service("stop") }
sub reload_service       { shift->_run_rc_service("reload") }
sub force_reload_service { shift->_run_rc_service("force-reload") }
sub restart_service      { shift->_run_rc_service("restart") }
sub try_restart_service  { shift->_run_rc_service("try-restart") }
sub status_service       { shift->_run_rc_service("status") }

sub execute
{
    my $self = shift;

    my %commands = (
        start        => sub { $self->start_service },
        stop         => sub { $self->stop_service },
        reload       => sub { $self->reload_service },
        force_reload => sub { $self->force_reload_service },
        restart      => sub { $self->restart_service },
        try_restart  => sub { $self->try_restart_service },
        status       => sub { $self->status_service },
    );

    if (exists $commands{ $self->{command} })
    {
        return $commands{ $self->{command} }->();
    }
    else
    {
        print RED, "[!] Error: Unknown command: $self->{command}\n", RESET;
        return 0;
    }
}

1;

