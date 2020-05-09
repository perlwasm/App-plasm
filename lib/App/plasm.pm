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
  my $class = shift;  # unused

  if(defined $_[0] && $_[0] !~ /^-/)
  {
    my $class = 'App::plasm::' . shift();
    my $main  = $class->can('main');
    die 'todo: usage' unless defined $main;
    return $main->(@_);
  }
  else
  {
    die 'todo: usage';
  }
}

package App::plasm::run;

use Wasm 0.08;

my $sandbox;

sub main
{
  local @ARGV = @_;

  my $filename = shift @ARGV;
  die 'todo: usgae' unless defined $filename;
  my $class = "App::plasm::run::sandbox@{[ $sandbox++ ]}";

  Wasm->import(
    -api     => 0,
    -package => $class,
    -file    => $filename,
  );

  my $start = $class->can('_start');
  $start->();

  return 0;
}

package App::plasm::dump;

use Wasm::Wasmtime 0.08;

sub main
{
  local @ARGV = @_;

  my $filename = shift @ARGV;
  die 'todo: usgae' unless defined $filename;

  my $module = Wasm::Wasmtime::Module->new(
    file => $filename,
  );

  print $module->to_string;

  return 0;
}

1;
