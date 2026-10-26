let
  withPins = f: overrides: f (import ./npins // overrides);
in
{
  darwin.default = withPins (import ./darwin);
  home.default = withPins (import ./home);
  hosts.mba = import ./hosts/mba.nix;
}
