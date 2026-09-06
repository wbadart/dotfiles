{
  fetchurl,
  lib,
  stdenvNoCC,
  undmg,
}: stdenvNoCC.mkDerivation (self: {
  version = "8.26.0";
  pname = "signal-desktop-bin";
  src = fetchurl {
    url = "https://updates.signal.org/desktop/signal-desktop-mac-universal-${self.version}.dmg";
    hash = "sha256:0kqfp1b2mp79lw516fad6367wi872nsr4ac2dxc8yvawnd3c4ala";
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
