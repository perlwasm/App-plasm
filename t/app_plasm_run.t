use Test2::V0 -no_srand => 1;
use App::plasm;
use Capture::Tiny qw( capture );

is(
  [capture { App::plasm::run::main("corpus/hello.wasm") }],
  [ "hello world!\n", "", 0 ],
  'run Simple hello world',
);

done_testing;
