# plasm ![linux](https://github.com/perlwasm/App-plasm/workflows/linux/badge.svg) ![macos](https://github.com/perlwasm/App-plasm/workflows/macos/badge.svg) ![windows](https://github.com/perlwasm/App-plasm/workflows/windows/badge.svg)

Perl WebAssembly command line tool

# SYNOPSIS

```
% plasm run program.wasm [ arguments ]
% plasm dump program.wasm
% plasm --help
% plasm --version
```

For full documentation:

```
% perldoc plasm
```

# DESCRIPTION

`plasm` is the Perl WebAssembly command line tool.

# SUBCOMMANDS

## run

```
% plasm run program.wasm [ arguments ]
% plasm run --help
```

Runs the given WebAssembly program.  The arguments after
`program.wasm` are passed on to the WebAssembly program.

## dump

```
% plasm dump program.wasm
% plasm dump --help
```

Dumps the import and exports of the given WebAssembly module.

## wat

```
% plasm wat program.wat
% plasm wat --help
```

Converts WebAssembly Text (.wat) to WebAssembly Binary (.wasm)
using wasmtime's `wat2wasm` function.

# SEE ALSO

- [Wasm](https://metacpan.org/pod/Wasm)

    Write Perl extensions using Wasm!

- [Wasm::Wasmtime](https://metacpan.org/pod/Wasm::Wasmtime)

    Low-level Wasmtime bindings for Perl.

# AUTHOR

Graham Ollis <plicease@cpan.org>

# COPYRIGHT AND LICENSE

This software is copyright (c) 2020 by Graham Ollis.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.
