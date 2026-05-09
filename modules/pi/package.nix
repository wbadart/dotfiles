{
  fetchFromGitHub,
  fetchNpmDeps,
  pi-coding-agent,
}:
pi-coding-agent.overrideAttrs (final: _prev: {
  version = "0.73.1";
  src = fetchFromGitHub {
    owner = "badlogic";
    repo = "pi-mono";
    tag = "v${final.version}";
    hash = "sha256-ZcqMWghMACzEUswLujwClPF1pbwjTKzTbcYW86ZvjL4=";
  };
  npmDeps = fetchNpmDeps {
    inherit (final) src;
    hash = "sha256-tneAcwtTIfkcqQ8/Ch1Xa6OiOkTjJNYbH8wfhNneT/g=";
  };
})
