{
  programs.ssh = {
    enable = true;
    enableDefaultConfig = false;
    settings = {
      "*".SetEnv.TERM = "xterm-256color";
      vultr.User = "root";
      kindle = {
        User = "root";
        Port = 2222;
      };
    };
  };
}
