{
  fetchurl,
  lib,
  stdenvNoCC,
  undmg,
}:
stdenvNoCC.mkDerivation (self: {
  version = "8.34.0";
  pname = "signal-desktop-bin";
  src = fetchurl {
    url = "https://updates.signal.org/desktop/signal-desktop-mac-universal-${self.version}.dmg";
    hash = "sha256:10m1r40c20wq4q7wi7p1q9jzwr4949d9j8zyfv0iab6i9fwyybhq";
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
