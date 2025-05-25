#!/usr/bin/perl
#
# This file is part of tum-perl.
# tum-perl is free software: you can redistribute it and/or modify it under the terms of
# the GNU General Public License as published by the Free Software Foundation,
# either version 3 of the License, or (at your option) any later version.
#
# tum-perl is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY;
# without even the implied warranty of MERCHANTABILITY or
# FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for
# more details.
#
# You should have received a copy of the GNU General Public License along with
# tum-perl. If not, see <https://www.gnu.org/licenses/>. 

package SysVInitManagement;

use strict;
use warnings;

use constant RED   => "\e[31m";
use constant RESET => "\e[0m";

sub new
{
    my ($class, $command, $service) = @_;
    my $self = {
        command => $command,
        service => $service
    };

    if ($command eq '--status-all' && $service eq '')
    {
        $self->{status_all} = 1;
    }

    if ($command eq '--full-restart' && $service ne '')
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
        $exit_code = system('service', $self->{service}, $action);
        die "[!] Error: Service command failed.\n" if $exit_code != 0;
    };

    if ($@)
    {
        print RED, "[!] Error: $@", RESET, "\n";
        return 0;
    }

    return 1;
}

sub start_service        { shift->_run_service('start') }
sub stop_service         { shift->_run_service('stop') }
sub reload_service       { shift->_run_service('reload') }
sub force_reload_service { shift->_run_service('force-reload') }
sub restart_service      { shift->_run_service('restart') }
sub status_service       { shift->_run_service('status') }

sub status_all_service   
{
    my $exit_code;
    $exit_code = system('service --status-all');
    die "[!] Error: Service command failed.\n" if $exit_code != 0;
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
    $exit_code = system('service', $self->{service}, '--full-restart');
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
        return 0;
    }
}

1;

