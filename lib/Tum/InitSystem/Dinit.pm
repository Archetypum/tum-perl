#!/usr/bin/perl

package Tum::InitSystem::Dinit;

use strict;
use warnings;

use constant RED   => "\e[31m";
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

sub _run_dinitctl
{
    my ($self, $action) = @_;
    my $exit_code;

    eval
    {
        $exit_code = system("dinitctl", $action, $self->{args});
        $exit_code = $exit_code >> 8;
        die RED . "[!] 'dinitctl $action $self->{args}' failed with exit code $exit_code\n" . RESET if $exit_code != 0;
    };

    if ($@)
    {
        print RED, "[!] Error: $@", RESET;
        return 0;
    }

    return 1;
}

my @actions = qw(
    start stop status is-started is-failed restart wake release unpin unload reload list shutdown
    add-dep rm-dep enable disable trigger untrigger setenv unsetenv catalog signal
);

for my $action (@actions)
{
    (my $sub_name = $action) =~ s/-/_/g;
    no strict "refs";
    *{$sub_name} = sub { shift->_run_dinitctl($action) };
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

