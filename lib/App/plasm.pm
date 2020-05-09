package App::plasm;

use strict;
use warnings;
use 5.008001;
use Pod::Usage qw( pod2usage );
use Getopt::Long qw( GetOptions );

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

  Getopt::Long::Configure('permute');

  if(defined $_[0] && $_[0] !~ /^-/)
  {
    my $cmd   = shift;
    my $class = "App::plasm::$cmd";
    my $main  = $class->can('main');
    pod2usage({
      -message => "no subcommand '$cmd'",
      -exitval => 2,
    }) unless defined $main;
    return $main->(@_);
  }
  else
  {
    local @ARGV = @_;
    GetOptions(
      'help|h'    => sub { pod2usage({ -exitval => 0 }) },
      'version|v' => sub { print "plasm version @{[ App::plasm->VERSION || 'dev' ]} Wasm.pm @{[ Wasm->VERSION ]}\n"; exit 0 },
    ) or pod2usage({ -exitval => 2 });
    pod2usage({ -exitval => 2 });
  }
}

package App::plasm::run;

use Pod::Usage qw( pod2usage );
use Getopt::Long qw( GetOptions );
use Wasm 0.08;

my $sandbox;

sub main
{
  local @ARGV = @_;

  Getopt::Long::Configure('require_order');

  my @pod = (-verbose => 99, -sections => "SUBCOMMANDS/run");

  GetOptions(
    'help|h'    => sub { pod2usage({ -exitval => 0, @pod }) },
  ) or pod2usage({ -exitval => 2, @pod });

  my $filename = shift @ARGV;

  pod2usage({ @pod,
    -exitval  => 2,
  }) unless defined $filename;

  pod2usage({ @pod,
    -message => "File not found: $filename",
    -exitval  => 2,
  }) unless -f $filename;

  my $class = "App::plasm::run::sandbox@{[ $sandbox++ ]}";

  local $0 = $filename;

  Wasm->import(
    -api     => 0,
    -package => $class,
    -file    => $filename,
  );

  my $start = $class->can('_start');
  $start->();

  # TODO: detect exit value and pass that on...

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
