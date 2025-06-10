#!/usr/bin/perl

use 5.006;
use strict;
use warnings;
use Test::More;

plan tests => 1;

BEGIN {
    use_ok( 'Tum' ) || print "Bail out!\n";
}

diag( "Testing Tum $Tum::VERSION, Perl $], $^X" );
