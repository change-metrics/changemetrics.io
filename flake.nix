{
  description = "hakyll-website";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = inputs:
    inputs.flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import inputs.nixpkgs { inherit system; };
        # the name of the cabal package and command line
        name = "changemetrics-io";

        haskellExtend = hpFinal: hpPrev: {
          ${name} =
            hpPrev.callCabal2nix name inputs.self { };
        };
        hsPkgs = pkgs.haskellPackages.extend haskellExtend;

        website = pkgs.stdenv.mkDerivation {
          name = "${name}-pages";
          buildInputs = [ hsPkgs.${name} ];
          src = inputs.self;
          # https://github.com/jaspervdj/hakyll/issues/614
          # https://github.com/NixOS/nix/issues/318#issuecomment-52986702
          # https://github.com/MaxDaten/brutal-recipes/blob/source/default.nix#L24
          LOCALE_ARCHIVE =
            pkgs.lib.optionalString (pkgs.buildPlatform.libc == "glibc")
            "${pkgs.glibcLocales}/lib/locale/locale-archive";
          LANG = "en_US.UTF-8";

          buildPhase = ''
            ${name} build
          '';
          installPhase = ''
            mv _site $out
          '';
        };
      in {
        packages.website = website;
        devShell = hsPkgs.shellFor {
          packages = p: [ p.${name} ];
          buildInputs = [ pkgs.cabal-install ];
        };
      });
}
