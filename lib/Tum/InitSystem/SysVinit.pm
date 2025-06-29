#!/usr/bin/perl

package Tum::InitSystem::SysVinit;

use strict;
use warnings;

use constant RED   => "\e[31m";
use constant RESET => "\e[0m";

=pod

=head1 NAME

...
    
=head1 DESCRIPTION

...

=head1 FUNCTIONS

...

=head1 AUTHOR

Archetypum <archetypum@tutamail.com>

=head1 COPYRIGHT AND LICENSE

Copyright (C) 2025 Archetypum

This program is free software: you can redistribute it and/or modify it
under the terms of the GNU Lesser General Public License as published by the
Free Software Foundation, either version 3 of the License, or any later version.

This program is distributed in the hope that it will be useful, but
WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License
for more details.

You should have received a copy of the GNU Lesser General Public License along
with this program. If not, see L<https://www.gnu.org/licenses/>.

=cut

sub new
{
    my ($class, $command, $service) = @_;
    die "[!] Error: Command is required.\n" unless defined $command;

    my $self = {
        command => $command,
        service => $service // "",
    };

    if ($command eq "--status-all" && $self->{service} eq "")
    {
        $self->{status_all} = 1;
    }

    if ($command eq "--full-restart" && $self->{service} ne "")
    {
        $self->{full_restart} = 1;
    }

    bless $self, $class;

    return $self;
}

sub _run_service
{
    my ($self, $action) = @_;
    my $exit_code;

    eval
    {
        $exit_code = system("service", $self->{service}, $action);
        $exit_code = $exit_code >> 8;
        die "[!] Error: Service command failed.\n" if $exit_code != 0;
    };

    if ($@)
    {
        print RED, "[!] Error: $@", RESET, "\n";
        return 0;
    }

    return 1;
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

    eval
    {
        $exit_code = system("service", "--status-all");
        $exit_code = $exit_code >> 8;
        die "[!] Error: Service command failed.\n" if $exit_code != 0;
    };

    if ($@)
    {
        print RED, "[!] Error: $@", RESET, "\n";
        return 0;
    }

    return 1;
}

sub full_restart_service
{
    my $self = shift;

    unless ($self->{service})
    {
        print RED, "[!] Error: --full-restart requires a service name.\n", RESET;
        return 0;
    }

    my $exit_code;

    eval
    {
        $exit_code = system("service", $self->{service}, "--full-restart");
        $exit_code = $exit_code >> 8;
        die "[!] Error: Service command failed.\n" if $exit_code != 0;
    };

    if ($@)
    {
        print RED, "[!] Error: $@", RESET, "\n";
        return 0;
    }

    return 1;
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

