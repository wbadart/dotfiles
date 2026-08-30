{
  fetchurl,
  lib,
  stdenvNoCC,
  undmg,
}: stdenvNoCC.mkDerivation (self: {
  version = "8.25.0";
  pname = "signal-desktop-bin";
  src = fetchurl {
    url = "https://updates.signal.org/desktop/signal-desktop-mac-universal-${self.version}.dmg";
    hash = "sha256:072d1inq5d1mkykncgqgaj9lx3cf09xlypncg2mjsvbjs2kxlzxa";
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
