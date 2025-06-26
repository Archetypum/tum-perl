#!/usr/bin/perl

package Tum::InitSystem::Systemd;

use strict;
use warnings;

use constant RED   => "\e[31m";
use constant GREEN => "\e[0;32m";
use constant RESET => "\e[0m";

=pod

=cut

sub new
{
    my ($class, $command, $args) = @_;
    die RED . "[!] Error: Command is required.\n" . RESET unless defined $command;

    my $self = {
        command => $command,
        args => $args // "",
    };

    bless $self, $class;

    return $self;
}

sub _run_systemctl
{
    my ($self, $action) = @_;
    my $exit_code;

    eval
    {
        $exit_code = system("systemctl", $action, $self->{args});
        $exit_code = $exit_code >> 8;
        die RED . "[!] 'systemctl $action $self->{args}' failed with exit code $exit_code\n" . RESET if $exit_code != 0;
    };

    if ($@)
    {
        print RED, "[!] Error: $@", RESET;
        return 0;
    }

    return 1;
}

my @actions = qw(
    add-requires add-wants bind cancel cat condreload condrestart condstop
    daemon-reexec daemon-reload default disable edit emergency enable exit
    force-reload get-default halt help hibernate hybrid-sleep import-environment
    is-active is-enabled is-failed isolate is-system-running kexec kill link
    list-automounts list-dependencies list-jobs list-machines list-sockets
    list-timers list-unit-files list-units log-level log-target mask
    mount-image poweroff preset preset-all reboot reenable reload
    reload-or-restart rescue reset-failed restart revert service-log-level
    service-log-target service-watchdogs set-default set-environment property
    show show-environment start status stop suspend suspend-then-hibernate
    switch-root try-reload-or-restart try-restart unmask unset-environment
);

for my $action (@actions)
{
    (my $sub_name = $action) =~ s/-/_/g;
    no strict "refs";
    *{$sub_name} = sub { shift->_run_systemctl($action) };
}

sub execute
{
    my $self = shift;

    my %commands = map 
    {
        my $method = $_;
        $method => sub 
        {
            my $method_name = $method;
            $method_name =~ s/-/_/g;
            return $self->$method_name;
        }
    } @actions;

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

