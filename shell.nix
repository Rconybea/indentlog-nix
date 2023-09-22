{
  pkgs ? import (fetchTarball {
    # see ./NIX for nix hash instructions

    # 23.05 release commit
    #url = "https://github.com/NixOS/nixpkgs/archive/90d94ea32eed9991e2b8c6a761ccd8145935c57c.tar.gz";
    # 23.05, asof 19sep2023:
    url = "https://github.com/NixOS/nixpkgs/archive/5d017a8822e0907fb96f7700a319f9fe2434de02.tar.gz";
    # tip of nixpkgs asof 19sep2023:
    # url = "https://github.com/NixOS/nixpkgs/archive/3ff262989756def104cadee8f5525bfed0296fcc.tar.gz";
  }) {}
}:

pkgs.mkShell rec {
  buildInputs = [
    pkgs.cmake

    # development tools
    pkgs.llvmPackages_16.clang-unwrapped
    pkgs.emacs29
    pkgs.gdb
    pkgs.valgrind
    pkgs.ripgrep
    pkgs.less
    pkgs.tree
    pkgs.netcat-gnu
    pkgs.wget
    pkgs.openssh
    pkgs.which
    pkgs.lcov
  ];
}
