let
  pkgs = import (builtins.fetchTarball (
    builtins.fromJSON (builtins.readFile nix/nixpkgs.json))) {};

  ghc = pkgs.haskell.compiler.ghc8102;
in
with pkgs; stdenv.mkDerivation rec {
  name = "shell-cabal";

  buildInputs = [
    ghc
    zlib
  ];

  LD_LIBRARY_PATH = lib.makeLibraryPath buildInputs;
}
