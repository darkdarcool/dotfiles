{ fetchFromGitHub, pkgs, inputs, ... }:

pkgs.stdenv.mkDerivation rec {
  pname = "poop";
  version = "1.0.0";

  src = fetchFromGitHub {
    owner = "andrewrk";
    repo = "poop";
    rev = "13c930a72612fb2aaf59156c5922ac7b2eb72555";
    hash = "sha256-56HlbMcAWdt+v0GmtccUuYiBdBFIhTrqz2gC6tu2vcQ=";
  };
  # buildInputs = [ inputs.zig.packages."${pkgs.system}".master ];
  buildInputs = [ pkgs.zig_0_12 ];
  dontConfigure = true;
  dontFixup = true;
  buildPhase = ''
    export ZIG_GLOBAL_CACHE_DIR=$PWD
    zig build
  '';
  installPhase = ''
    mkdir -p $out/bin
    cp zig-out/bin/poop $out/bin
  '';
}
