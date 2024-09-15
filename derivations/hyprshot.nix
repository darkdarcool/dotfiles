{ stdenvNoCC, stdenv, fetchFromGitHub, pkgs, inputs, ... }:
pkgs.stdenv.mkDerivation rec {
  pname = "hyprshot";
  version = "1.3.0";

  src = fetchFromGitHub {
    owner = "Gustash";
    repo = "Hyprshot";
    rev = "f95068db7765b85a2bbae0f083e29074d7bee027";
    hash = "sha256-9vsBNe6qTvbw2rgf1y5MIxN1eZzdCtimMvEXF8M36cQ=";
  };

  #buildInputs = [ inputs.zig.packages."${pkgs.system}".master ];
  dontConfigure = true;
  dontFixup = true;
  buildPhase = ''
    chmod +x ./hyprshot 
  '';
  installPhase = ''
    mkdir -p $out/bin
    cp hyprshot $out/bin 
  '';

  # patches = [ ../patches/zls-hover.diff ../patches/testing.diff ];
}
