use warnings;
use 5.020;
use experimental qw( signatures postderef );

package Run {

  use Test2::Tools::Process qw( intercept_exit );
  use App::plasm;
  use Capture::Tiny qw( capture );
  use Test2::API qw( context );

  sub run ($class, @cmd)
  {
    my($out, $err, $exit) = capture {
      local $0 = 'bin/plasm';
      my $ret;
      my $exit = intercept_exit(sub { $ret = App::plasm->main(@cmd) });
      defined $exit
        ? $exit
        : $ret;
    };

    my $ctx = context();
    $ctx->note("% plasm @cmd");
    $ctx->note("[out]\n$out") if $out ne '';
    $ctx->note("[err]\n$err") if $err ne '';
    $ctx->note("ret = $exit") if $exit;
    $ctx->release;

    bless {
      out  => $out,
      err  => $err,
      exit => $exit,
    }, $class;
  }

  sub out ($self) { $self->{out}  }
  sub err ($self) { $self->{err}  }
  sub ret ($self) { $self->{exit} }
}

1;
