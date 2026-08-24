{
  fetchurl,
  lib,
  stdenvNoCC,
  undmg,
}: stdenvNoCC.mkDerivation (self: {
  version = "8.24.1";
  pname = "signal-desktop-bin";
  src = fetchurl {
    url = "https://updates.signal.org/desktop/signal-desktop-mac-universal-${self.version}.dmg";
    hash = "sha256-XL5YgZ5xhc9mEejja9/x0+4QYYoR5K/jJPL8oRZq3u4=";
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
