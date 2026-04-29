{
  fetchFromGitHub,
  fetchNpmDeps,
  pi-coding-agent,
}:
pi-coding-agent.overrideAttrs (final: _prev: {
  version = "0.70.6";
  src = fetchFromGitHub {
    owner = "badlogic";
    repo = "pi-mono";
    tag = "v${final.version}";
    hash = "sha256-XZUnKk+B9kWn51kRfMkfInYCz+5hVuWQBvgOm9PO9bo=";
  };
  npmDeps = fetchNpmDeps {
    inherit (final) src;
    hash = "sha256-pEVIqp9rbuHFE6eqSmADmIXWAPey1VbD7qmOJwksz1o=";
  };
})
