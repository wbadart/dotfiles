{ config, lib, ... }:
let
  cfg = config.wb.sshd;
in
{
  options.wb.sshd.disable =
    let
      inherit (lib) types;
    in
    lib.mkOption {
      type = types.bool;
      default = false;
      example = true;
      description = "Whether to disable sshd";
    };

  config.services.openssh = lib.mkIf (!cfg.disable) {
    enable = true;
    extraConfig = ''
      AuthenticationMethods publickey
    '';
  };
  # TODO: users.users.*.authorizedKeys
  # TODO: networking.applicationFirewall?
}
