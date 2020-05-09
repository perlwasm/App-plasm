use Test2::V0 -no_srand => 1;
use lib 't/lib';
use Run;

is(
  Run->run('run', 'corpus/hello.wasm'),
  object {
    call out => "hello world!\n";
    call err => '';
    call ret => 0;
  },
  '% plasm run corpus/hello.wasm',
);

done_testing;
