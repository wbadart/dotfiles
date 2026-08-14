{
  fetchurl,
  lib,
  stdenvNoCC,
  undmg,
}: stdenvNoCC.mkDerivation (self: {
  version = "8.23.0";
  pname = "signal-desktop-bin";
  src = fetchurl {
    url = "https://updates.signal.org/desktop/signal-desktop-mac-universal-${self.version}.dmg";
    hash = "sha256-v36VDOlHb3CtkYuFoi8rh+qHmtlDf3aaA5Yd2RW2XSU=";
  };
  sourceRoot = ".";
  nativeBuildInputs = [ undmg ];
  installPhase = ''
    runHook preInstall

    mkdir -p "$out/Applications"
    cp -r *.app "$out/Applications"

    runHook postInstall
  '';
  meta.platforms = lib.platforms.darwin;
})
