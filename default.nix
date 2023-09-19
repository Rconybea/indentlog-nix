{
  pkgs ? import (fetchTarball {
    # 23.05 commit
    url = "https://github.com/NixOS/nixpkgs/archive/90d94ea32eed9991e2b8c6a761ccd8145935c57c.tar.gz";
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
