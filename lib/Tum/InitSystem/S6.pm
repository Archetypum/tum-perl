#!/usr/bin/perl

package Tum::InitSystem::S6;

use strict;
use warnings;

use constant RED   => "\e[31m";
use constant RESET => "\e[0m";

=pod

=head1 NAME

Tum::InitSystem::S6 - Perl interface to interact with the s6-rc service manager on Unix systems.

=head1 SYNOPSIS

    use Tum::InitSystem::S6;

    my $s6 = Tum::InitSystem::S6->new('-u', 'start', 'sshd');

    if ($s6->execute)
    {
        print "Service started successfully\n";
    }
    else
    {
        print "Failed to start service\n";
    }

=head1 DESCRIPTION

This module provides a programmatic Perl interface for managing services using the
C<s6-rc> command, part of the s6 suite of process supervision tools.

It allows object-oriented invocation of common C<s6-rc> commands with full control
over service startup, shutdown, state changes, and queries.

The required mode argument (e.g. C<-u>) determines how s6-rc is invoked, and all commands
are dispatched through Perl methods or by passing the command name to the constructor.

=head1 METHODS

=head2 new($mode, $command, $args)

Constructs a new C<Tum::InitSystem::S6> object.

=over 4

=item * C<$mode>: Required. One of C<-u>, C<-d>, or C<-D> to indicate the s6-rc invocation mode:

    - C<-u>: live directory (actual system control)
    - C<-d>: dry-run mode
    - C<-D>: compiled service database (no state interaction)

=item * C<$command>: A string containing a supported s6-rc command (e.g., 'start', 'stop', etc.)

=item * C<$args>: Optional. Additional arguments passed to the command as a string.

=back

=head2 execute()

Executes the command specified in the constructor.

Returns true on success and false on failure.

=head1 SUPPORTED COMMANDS

help, list, listall, diff, start, stop, change

Each of these commands can be passed to the constructor (e.g., `'start'`), or
called as an object method (e.g., `$s6->start`).

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

