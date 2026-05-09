{
  stdenvNoCC,
  undmg,
}: stdenvNoCC.mkDerivation (self: {
  pname = "InstantSpaceSwitcher";
  version = "2.0";
  src = builtins.fetchurl {
    url = "https://github.com/jurplel/InstantSpaceSwitcher/releases/download/v${self.version}/InstantSpaceSwitcher-${self.version}.dmg";
    sha256 = "sha256:1f1gcz1klid9jqmrkfl8k5ncb4icwq5diky8mz7i4pmzggccgh73";
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
