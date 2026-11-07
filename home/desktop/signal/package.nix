{
  fetchurl,
  lib,
  stdenvNoCC,
  undmg,
}:
stdenvNoCC.mkDerivation (self: {
  version = "8.33.0";
  pname = "signal-desktop-bin";
  src = fetchurl {
    url = "https://updates.signal.org/desktop/signal-desktop-mac-universal-${self.version}.dmg";
    hash = "sha256:1f8cqr4cwfcdccypbqg1qdq5ff4r2xzq82zvqd5a97ji1dbj98nj";
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
