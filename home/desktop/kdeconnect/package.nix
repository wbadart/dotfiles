{
  fetchurl,
  lib,
  stdenvNoCC,
  undmg,
}:
stdenvNoCC.mkDerivation (self: {
  pname = "kdeconnect";
  version = "26.04.2";
  src = fetchurl {
    url = "https://download.kde.org/stable/release-service/${self.version}/macos/kdeconnect-kde-macos-clang-arm64.dmg";
    hash = "sha256-4r5CZBfrVf+aS835WdBcdHUaK4MkCiNotWRa70JS1xg=";
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
