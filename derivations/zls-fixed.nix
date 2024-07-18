{ stdenvNoCC, stdenv, fetchFromGitHub, pkgs, inputs, ... }:
pkgs.stdenv.mkDerivation rec {
  pname = "zls-fixed";
  version = "0.13.0";
  #src = fetchFromGitHub { 
  #  owner = "zigtools";
  #  repo = "zls";
  #  rev = "bb19beeb38a8c3df9a2408b8e15664415b8347ef";
  #  sha256 = "sha256-fXZmddq7ZrEaX0rT4n+46f+qpwMbOdhoY+fCRj70xts=";# "sha256-xpL4Lk3HFa6+FCOOC69Bqcxr62EDqu+WdvXd2kzI6Hk=";
  #};
  src = fetchFromGitHub {
    owner = "darkdarcool";
    repo = "zls";
    rev = "6370a2a3136cf33d2f68bb885940621748937bbb";
    hash = "sha256-7zutw4Y5sP3bV7fz+KnGm+lT9zXJRRUF6LKyRHQMT+k=";
  };
  buildInputs = [ inputs.zig.packages."${pkgs.system}".master ];
  dontConfigure = true;
  dontFixup = true;
  buildPhase = ''
    export ZIG_GLOBAL_CACHE_DIR=$PWD
    zig build 
  '';
  installPhase = ''
    mkdir -p $out/bin
    cp zig-out/bin/zls $out/bin 
  '';

  # patches = [ ../patches/zls-hover.diff ../patches/testing.diff ];
}
