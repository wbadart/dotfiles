{
  fetchurl,
  lib,
  stdenvNoCC,
  undmg,
}: stdenvNoCC.mkDerivation (self: {
  version = "8.19.0";
  pname = "signal-desktop-bin";
  src = fetchurl {
    url = "https://updates.signal.org/desktop/signal-desktop-mac-universal-${self.version}.dmg";
    hash = "sha256-rsH2u8+zfLynYjLltHgMkGVF02e2dnIAhC/1KWviYxM=";
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
