{ stdenv, lib, fetchFromGitHub, pkg-config, git, gtkmm4, gtk4-layer-shell
, wrapGAppsHook4, unstableGitUpdater, }:

stdenv.mkDerivation {
  pname = "sysmenu";
  version = "unstable-2024-08-08";

  #src = fetchFromGitHub {
  #  owner = "System64fumo";
  #  repo = "sysmenu";
  #  rev = "0b891e5d27f286b867d4a0984ee284a3456de851";
  #  hash = "sha256-zI6dmS+ZqcGrG/joWouqrMNQfTRflP677kYJLJEWTBc=";
  #};

  src = fetchFromGitHub {
    owner = "System64fumo";
    repo = "sysmenu";
    rev = "982a24ce8e8df1dcb7d3d43cf3e8d922e05e7acd";
    hash = "sha256-6dzDFhab8YPCc3fT6/Ivc4dUcSlYq4uxoO1wCd5VqEw=";
  };

  #patches = [
  #  ./001-no-runtime-config.patch
  #  ./002-cflags-fix.patch
  #];

  nativeBuildInputs = [ pkg-config git wrapGAppsHook4 ];

  buildInputs = [ gtkmm4 gtk4-layer-shell ];

  installPhase = ''
    runHook preInstall
    install -Dm755 sysmenu $out/bin/sysmenu
    runHook postInstall
  '';

  postInstall = ''
    wrapProgram $out/bin/sysmenu --prefix LD_LIBRARY_PATH : $out/lib
  '';

  passthru.updateScript = unstableGitUpdater { };

  meta = {
    description = "Simple program launcher using GTK4";
    homepage = "https://github.com/System64fumo/sysmenu";
    license = lib.licenses.wtfpl;
    mainProgram = "sysmenu";
    maintainers = with lib.maintainers; [ matteopacini ];
    platforms = lib.platforms.linux;
  };
}
