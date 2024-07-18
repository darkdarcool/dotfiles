# ./overlays/default.nix
{ config, pkgs, inputs, lib, ... }:

{
  nixpkgs.overlays = [
    (final: prev: {
      sf-mono-liga-bin = prev.stdenvNoCC.mkDerivation rec {
        pname = "sf-mono-liga-bin";
        version = "dev";
        src = inputs.sf-mono-liga-src;
        dontConfigure = true;
        installPhase = ''
          mkdir -p $out/share/fonts/opentype
          cp -R $src/*.otf $out/share/fonts/opentype/
        '';
      };

      phocus-oxocarbon =
        prev.callPackage ./derivations/phocus-oxocarbon.nix { };
      # zls-fixed = prev.callPackage ./derivations/zls-fixed.nix { pkgs = pkgs; inputs = inputs; };
    })

    # Overlay 3: Define overlays in other files
    # The content of ./overlays/overlay3/default.nix is the same as above:
    # `(final: prev: { xxx = prev.xxx.override { ... }; })`
    # (import ./overlay3)
  ];
}
