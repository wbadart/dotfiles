let
  me = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIOmCb9YQ3ytVmfkkRzo86cQx2hGGQ1iUA55yi/n1S2bK will@wb-mba"
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAILakDMu5pKKbduZRLOApmiyWGnFDa6vrPF3pOvpRwiaC will@Wills-MacBook-Air.local"
  ];
in
{
  "secrets/ALPHAVANTAGE_API_KEY.age".publicKeys = me;
  "secrets/env.age".publicKeys = me;
}
