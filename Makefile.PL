#!/usr/bin/perl

use 5.010;
use strict;
use warnings;

use ExtUtils::MakeMaker;

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
