# indentlog-nix -- nix package for indentlog

See [indentlog](https://github.com/rconybea/indentlog)

[Nix](https://nixos.org) (functional package manager) package
([INRIA Tutorial](https://nix-tutorial.gitlabpages.inria.fr/nix-tutorial) here)

To build & install:
```
$ git clone git@github.com:rconybea/indentlog-nix.git
$ cd indentlog-nix
$ nix-build
```

To update indentlog version:

1. establish desired indentlog git revision hash

2. edit `default.nix`; comment out `sha256` + replace `rev` with desired hash
```
  src = pkgs.fetchgit {
    url = "https://github.com/rconybea/indentlog";
    rev = "4f6f045423289cae4d1422594ead8a5b82120b63";
#    sha256 = "sha256-5keXrlvkogROc7+MxhRcclLZ8n3B9wzE7tQslFc9sGY=#";
  };
```

3. attempt `nix-build` in `indentlog-nix` working directory
   this will fail,  revealing desired sha256 hash
```
...
error: hash mismatch in fixed-output derivation '/nix/store/l37lvi99x0v01jg342kk3zcfjqqlg681-indentlog-4f6f045.drv':
         specified: sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=
            got:    sha256-qUF/WDB0efk8ZAXAp3S10PkclpD8Ao6ikyNlY6RmHaU=
error: 1 dependencies of derivation '/nix/store/2vr6csjr31jc0c1kfzqwd22dp5812sb2-indentlog.drv' failed to build
```

4. substitute required sha256 hash in `default.nix`
```
  src = pkgs.fetchgit {
    url = "https://github.com/rconybea/indentlog";
    rev = "4f6f045423289cae4d1422594ead8a5b82120b63";
    sha256 = "qUF/WDB0efk8ZAXAp3S10PkclpD8Ao6ikyNlY6RmHaU=";
  };
```

5. retry `nix-build`;  this time expect it to succeed
