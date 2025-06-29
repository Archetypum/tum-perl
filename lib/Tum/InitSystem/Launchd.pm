#!/usr/bin/perl

package Tum::InitSystem::Launchd;

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

sub _run_launchctl
{
    my ($self, $action) = @_;
    my $exit_code;

    eval
    {
        $exit_code = system("launchctl", $action, $self->{args});
        $exit_code = $exit_code >> 8;
        die RED . "[!] 'launchctl $action $self->{args}' failed with exit code $exit_code\n" . RESET if $exit_code != 0;
    };

    if ($@)
    {
        print RED, "[!] Error: $@", RESET;
        return 0;
    }

    return 1;
}

my @actions = qw(
    bootstrap bootout enable disable uncache kickstart attach debug kill blame print
    print-cache print-disabled plist procinfo hostinfo resolveport examine reboot error
    variant version load unload submit remove start stop list setenv unsetenv getenv
    export limit bsexec asuser managerpid manageruid managername help
);

for my $action (@actions)
{
    (my $sub_name = $action) =~ s/-/_/g;
    no strict "refs";
    *{$sub_name} = sub { shift->_run_launchctl($action) };
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

