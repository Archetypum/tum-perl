#!/usr/bin/perl

package Tum::InitSystem::S6;

use strict;
use warnings;

use constant RED   => "\e[31m";
use constant RESET => "\e[0m";

=pod

=cut

sub new
{
    my ($class, $mode, $command, $args) = @_;
    die RED . "[!] Error: Command is required.\n" . RESET unless defined $command;

    unless (defined $mode && $mode =~ /^-(u|d|D)$/)
    {
        die RED . "[!] Error: Invalid or missing s6-rc mode (expected -u, -d, or -D)\n" . RESET;
    }

    my $self = {
        mode    => $mode,
        command => $command,
        args    => $args // "",
    };

    bless $self, $class;
    return $self;
}

sub _run_s6_rc
{
    my ($self, $action) = @_;
    my $exit_code;

    eval
    {
        my @cmd = ("s6-rc", $self->{mode}, $action);
        push @cmd, split(/\s+/, $self->{args}) if $self->{args};

        $exit_code = system(@cmd);
        $exit_code = $exit_code >> 8;
        die RED . "[!] 's6-rc $self->{mode} $action $self->{args}' failed with exit code $exit_code\n" . RESET if $exit_code != 0;
    };

    if ($@)
    {
        print RED, "[!] Error: $@", RESET;
        return 0;
    }

    return 1;
}

my @actions = qw(help list listall diff start stop change);

for my $action (@actions)
{
    (my $sub_name = $action) =~ s/-/_/g;
    no strict "refs";
    *{$sub_name} = sub { shift->_run_s6_rc($action) };
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

