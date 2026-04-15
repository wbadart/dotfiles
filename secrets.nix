let
  me = [ "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIOmCb9YQ3ytVmfkkRzo86cQx2hGGQ1iUA55yi/n1S2bK will@wb-mba" ];
in
{
  "secrets/env.age".publicKeys = me;
}
