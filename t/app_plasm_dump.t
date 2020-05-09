use Test2::V0 -no_srand => 1;
use App::plasm;
use Capture::Tiny qw( capture );

my @res;

is(
  [@res = capture { App::plasm::dump::main("corpus/empty.wat") }],
  [ "(module)\n", "", 0 ],
  'dump empty module',
);

is(
  [@res = capture { App::plasm::dump::main("corpus/callback.wat") }],
  [ match qr/^\(module.*\)$/s, "", 0 ],
  'dump empty module',
);

note "[output]\n$res[0]";

done_testing;
