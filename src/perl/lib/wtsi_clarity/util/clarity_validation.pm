package wtsi_clarity::util::clarity_validation;

use strict;
use warnings;

use wtsi_clarity::util::validation::validator;

use List::Util   qw/reduce/;
use Readonly;
use Exporter 'import';

our @EXPORT_OK = qw/flgen_bc ean13_bc/;

our $VERSION = '0.0';

Readonly::Scalar my $FLUIDIGM_BC_LENGTH => 10;
Readonly::Scalar my $EAN_BC_LENGTH      => 13;

sub flgen_bc {
  return _validate(shift)
           ->has_length($FLUIDIGM_BC_LENGTH)
           ->is_integer()
           ->result();
}
sub ean13_bc {
  return _validate(shift)
           ->has_length($EAN_BC_LENGTH)
           ->is_integer()
           ->result();
}

sub _validate {
  my $val = shift;
  return wtsi_clarity::util::validation::validator->new(value => $val);
}

1;

__END__

=head1 NAME

wtsi_clarity::util::clarity_validation

=head1 SYNOPSIS

use wtsi_clarity::util::clarity_validation qw/flgen_bc/;

my $validation = flgen_bc('1234567');

if ($validation->failed) {
  croak $validation->error_message;
}

=head1 DESCRIPTION

A module for providing a couple of different validations, each of which return a Validation
object with 2 methods on: failed and error_message.

=head1 SUBROUTINES/METHODS

=head2 flgen_bc
  Tests to see if a given value has a length of 10, and is numeric.

=head2 ean13_bc
  Tests to see if a given value has a length of 13, and is numeric.

=head1 CONFIGURATION AND ENVIRONMENT

=head1 DEPENDENCIES

=over

=item wtsi_clarity::util::validation::validator

=item List::Util

=item Readonly

=item Exporter

=back

=head1 AUTHOR

Chris Smith E<lt>cs24@sanger.ac.ukE<gt>

=head1 LICENSE AND COPYRIGHT

Copyright (C) 2015 GRL by Chris Smith

This file is part of wtsi_clarity project.

wtsi_clarity is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.

=cut
