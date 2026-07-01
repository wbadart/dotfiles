{
  programs.keepassxc = {
    enable = true;
    autostart = true;
    settings = {
      Browser = {
        Enabled = true;
        UpdateBinaryPath = false;  # see man page
      };
    };
  };
}
