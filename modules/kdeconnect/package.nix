{
  fetchurl,
  stdenvNoCC,
  undmg,
}: stdenvNoCC.mkDerivation (self: {
  pname = "kdeconnect";
  version = "6325";
  src = fetchurl {
    url = "https://origin.cdn.kde.org/ci-builds/network/kdeconnect-kde/master/macos-arm64/kdeconnect-kde-master-${self.version}-macos-clang-arm64.dmg";
    hash = "sha256-f5CLB/pP8AXSdrL9rn8kt8O3odJtqm8bXhpVudauKeE=";
  };
  sourceRoot = ".";
  nativeBuildInputs = [ undmg ];
  installPhase = ''
    runHook preInstall

    mkdir -p "$out/Applications"
    cp -r *.app "$out/Applications"

    runHook postInstall
  '';
})
