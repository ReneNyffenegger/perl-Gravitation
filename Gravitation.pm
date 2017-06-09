package Gravitation;
use strict;
use warnings;

my @bodies = ();

my $G = 6.67408;

sub Body { #_{

  my %b;

  @b{qw(m x y z vx vy vz)} = @_;

  push @bodies, \%b;

  return \%b;

} #_}

sub Iterate { #_{

  my $t = shift;

  my @new_bodies;

  for (my $this_body_no=0; $this_body_no<@bodies; $this_body_no++) { #_{

    my %new_body = %{$bodies[$this_body_no]};

#   print "old x: $new_body{x}\n";

    for (my $new_body_no=0; $new_body_no<@bodies; $new_body_no++) { #_{

      next if $this_body_no == $new_body_no;


      my $dist_x = $bodies[$this_body_no]->{x} - $bodies[$new_body_no]->{x};
      my $dist_y = $bodies[$this_body_no]->{y} - $bodies[$new_body_no]->{y};
      my $dist_z = $bodies[$this_body_no]->{z} - $bodies[$new_body_no]->{z};

      my $dist_squared = $dist_x**2 +
                         $dist_y**2 +
                         $dist_z**2;

      my $dist = sqrt($dist_squared);

#     my $force = ($bodies[$this_body_no]->{m} * $bodies[$new_body_no]) / $dist_squared;
      my $force = (                              $bodies[$new_body_no]) / $dist_squared;

#     print "force = $force\n";

      $new_body{vx} += $force * $dist_x / $dist * $t;
      $new_body{vy} += $force * $dist_y / $dist * $t;
      $new_body{vz} += $force * $dist_z / $dist * $t;


#     print $new_body_no, "\n";

    } #_}

    $new_body{x} += $new_body{vx} * $t;
    $new_body{y} += $new_body{vy} * $t;
    $new_body{z} += $new_body{vz} * $t;

#   print "new x: $new_body{x}\n";

    push @new_bodies, \%new_body;
    

  } #_}

  for (my $i=0; $i<@bodies; $i++) { #_{
#   print "new: $new_bodies[$i]->{x}\n";
#   print "trara\n";
#   print (join " - ", keys %{$bodies[$i]});
#   print "fertig trara\n";
#   print $bodies[$i]->{x};
#   print "\n======\n";
#
#   $bodies[$i]->{x} = $new_bodies[$i]->{x};
    @{$bodies[$i]}{qw(m x y z vx vy vz)} = @{$new_bodies[$i]}{qw( m x y z vx vy vz)};

#   print $bodies[$i]->{x};
#   print "\n------\n";
  } #_}


} #_}

1;
