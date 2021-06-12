let
  pkgs = (import (fetchTarball {
    url =
      "https://github.com/NixOS/nixpkgs/archive/6f3e97e3f8cca69ad2528c8459682900a9b34a2f.tar.gz";
    sha256 = "1gb59awicr84p68nnqkdmd9mdsnpar28jbskanrd71vsp5nw7c2p";
  })) { };
  drv = pkgs.haskellPackages.callCabal2nix "changemetrics-io" ./. { };
in pkgs.haskellPackages.shellFor {
  packages = p: [ drv ];
  buildInputs = with pkgs.haskellPackages; [ cabal-install ];
}
