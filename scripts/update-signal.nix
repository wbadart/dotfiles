{
  curl,
  gawk,
  nix,
  writeShellApplication,
}: writeShellApplication {
  name = "update-signal.sh";
  runtimeInputs = [ curl gawk nix ];
  text = ''
    curl -sSI https://github.com/signalapp/Signal-Desktop/releases/latest \
      | awk -F '[:/]' '
          $1 == "location" {
            sub("^v", "", $NF)
            gsub("\r", "", $NF)
            printf "https://updates.signal.org/desktop/signal-desktop-mac-universal-%s.dmg\n", $NF
          }
        ' \
      | xargs nix-prefetch-url
  '';
}
