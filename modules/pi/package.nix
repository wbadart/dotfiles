{
  fetchFromGitHub,
  fetchNpmDeps,
  pi-coding-agent,
}:
pi-coding-agent.overrideAttrs (final: _prev: {
  version = "0.70.5";
  src = fetchFromGitHub {
    owner = "badlogic";
    repo = "pi-mono";
    tag = "v${final.version}";
    hash = "sha256-Jn+hvS/DIwbwAff+UovdIVnmrb4o8gsC4IR24MnwF1I=";
  };
  npmDeps = fetchNpmDeps {
    inherit (final) src;
    hash = "sha256-MZgcHJdGFGSNgQ26/24iA12FdmO7S5vWv4crSNFhHi0=";
  };
})
