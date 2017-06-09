#!/usr/bin/perl
use warnings;
use strict;

use Gravitation;

my $b1 = Gravitation::Body(1, 2000, 3000, 4000, 0.5, 0.6, 0.2);
my $b2 = Gravitation::Body(2, 1000, 4000, 3000, 0.3, 0.2, 0.4);
my $b3 = Gravitation::Body(3, 4000, 2000, 2000, 0.1, 0.6, 0.4);

Gravitation::Iterate(0.1);
Gravitation::Iterate(0.1);
Gravitation::Iterate(0.1);
Gravitation::Iterate(0.1);
Gravitation::Iterate(0.1);
Gravitation::Iterate(0.1);
Gravitation::Iterate(0.1);
Gravitation::Iterate(0.1);
Gravitation::Iterate(0.1);
Gravitation::Iterate(0.1);

print $b1->{y};
