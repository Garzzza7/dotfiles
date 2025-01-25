#!/bin/bash
toilet --g rust
rustup update
toilet --g cabal
cabal update
toilet --g ghcup
ghcup upgrade
# toilet --g ocaml
# opam update
# opam upgrade
