{
  fetchurl,
  stdenvNoCC,
  undmg,
}: stdenvNoCC.mkDerivation (self: {
  pname = "InstantSpaceSwitcher";
  version = "2.0";
  src = fetchurl {
    url = "https://github.com/jurplel/InstantSpaceSwitcher/releases/download/v${self.version}/InstantSpaceSwitcher-${self.version}.dmg";
    hash = "sha256-48DH2Hu/XhLPr8jP2ArmLJLFbJmIupkrlqlFOsNnL7g=";
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
