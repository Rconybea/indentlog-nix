{
  pkgs ? import (fetchTarball {
    # see ./NIX for nix hash instructions

    # 23.05 commit
    #url = "https://github.com/NixOS/nixpkgs/archive/90d94ea32eed9991e2b8c6a761ccd8145935c57c.tar.gz";
    # 23.05, asof 19sep2023:
    url = "https://github.com/NixOS/nixpkgs/archive/5d017a8822e0907fb96f7700a319f9fe2434de02.tar.gz";
  }) {}
}:

pkgs.stdenv.mkDerivation rec {
  name = "indentlog";

  src = pkgs.fetchgit {
    url = "https://github.com/rconybea/indentlog";
    rev = "0977ff9";
    sha256 = "sha256-tGVLhDmal5R3sy7Ln/BVIwmbH7QzTyMSTMMBm2UajsM=";
  };

  buildInputs = [ pkgs.cmake ];
}
