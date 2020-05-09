package App::plasm;

use strict;
use warnings;
use 5.008001;

# ABSTRACT: Perl WebAssembly command line tool
# VERSION

=head1 SYNOPSIS

 % perldoc plasm

=head1 DESCRIPTION

This module contains the machinery for L<plasm>, the Perl WebAssembly
command line tool.  For details on its use see L<plasm>.

=head1 SEE ALSO

=over 4

=item L<Wasm>

=item L<Wasm::Wasmtime>

=item L<plasm>

=back

=cut

sub main
{
  my(undef, @ARGV) = @_;

  return 0;
}

1;


