let
  pkgs = (import (fetchTarball {
    url =
      "https://github.com/NixOS/nixpkgs/archive/6f3e97e3f8cca69ad2528c8459682900a9b34a2f.tar.gz";
    sha256 = "1gb59awicr84p68nnqkdmd9mdsnpar28jbskanrd71vsp5nw7c2p";
  })) { };
  gitignore = pkgs.nix-gitignore.gitignoreSource [ ] ./.;
  drv = pkgs.haskellPackages.callCabal2nix "changemetrics-io" gitignore { };
in {
  drv = drv;
  pages = pkgs.stdenv.mkDerivation {
    name = "changemetrics.io-pages";
    buildInputs = [ drv ];
    src = drv.src;
    # https://github.com/jaspervdj/hakyll/issues/614
    # https://github.com/NixOS/nix/issues/318#issuecomment-52986702
    # https://github.com/MaxDaten/brutal-recipes/blob/source/default.nix#L24
    LOCALE_ARCHIVE =
      pkgs.lib.optionalString (pkgs.buildPlatform.libc == "glibc")
      "${pkgs.glibcLocales}/lib/locale/locale-archive";
    LANG = "en_US.UTF-8";

    buildPhase = ''
      changemetrics-io build
    '';
    installPhase = ''
      mkdir -p "$out/docs"
      cp -r ./_site/* "$out/docs"
    '';
  };
  shell = pkgs.haskellPackages.shellFor {
    packages = p: [ drv ];
    buildInputs = with pkgs.haskellPackages; [ cabal-install ];
  };
}
