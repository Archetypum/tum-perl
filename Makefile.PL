#!/usr/bin/perl

use 5.010;
use strict;
use warnings;

use ExtUtils::MakeMaker;

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

my %WriteMakefileArgs = (
    "ABSTRACT"           => "Easy cross-platform UNIX scripting with Perl.",
    "AUTHOR"             => "Kinderfeld <archetypum\@tutamail.com>",
    "CONFIGURE_REQUIRES" => 
    {
        "ExtUtils::MakeMaker" => 0
    },
    "DISTNAME"           => "Tum",
    "LICENSE"            => "lgpl",
    "MIN_PERL_VERSION"   => "5.010",
    "NAME"               => "Tum",
    "PREREQ_PM"          => {},
    "VERSION"            => "0.1",
    "test"               => 
    {
        "TESTS" => "t/*.t"
    }
);


my %FallbackPrereqs = ();

unless ( eval { ExtUtils::MakeMaker->VERSION(6.63_03) } )
{
    delete $WriteMakefileArgs{TEST_REQUIRES};
    delete $WriteMakefileArgs{BUILD_REQUIRES};
    $WriteMakefileArgs{PREREQ_PM} = \%FallbackPrereqs;
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);
