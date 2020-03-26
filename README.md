# clang-ocaml-pretty-printer

## Compilation

Firstly you should compile `facebook-clang-plugins` (which is submoduled in this repo), run
```
CLANG_PREFIX=/usr
make -C facebook-clang-plugins
make -C facebook-clang-plugins/clang-ocaml
```
where CLANG is assumed to be installed in `/usr` (`clang` is located at `/usr/bin/clang`).
If you don't prefer to install CLANG systemwise,
run `./facebook-clang-plugins/clang/setup.sh` instead of the first line above.

Then run `make`.

## Usage
C to JSON
```
./dump-json.bash test.c > test.json
```

Pretty-print
```
./main.exe test.json
```
