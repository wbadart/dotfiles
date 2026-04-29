{
  programs.ssh = {
    enable = true;
    enableDefaultConfig = false;
    matchBlocks = {
      "*".setEnv.TERM = "xterm-256color";
      vultr.user = "root";
      vultr2.user = "root";
      kindle = {
        user = "root";
        port = 2222;
      };
    };
  };
}
