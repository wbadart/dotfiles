{
  lib,
  stdenv,
  nim_lk,
  nix,
  openssl,
  writeShellApplication,
}: writeShellApplication {
  name = "update-3code-lock.sh";
  runtimeInputs = [ nim_lk nix ];
  # nim_lk dlopens libssl; on darwin it otherwise picks up the system
  # LibreSSL (libssl.43) and segfaults.
  runtimeEnv = lib.optionalAttrs stdenv.hostPlatform.isDarwin {
    DYLD_LIBRARY_PATH = "${lib.getLib openssl}/lib";
  };
  text = ''
    # Run from the dotfiles root. Regenerates packages/_3code.lock.json
    # from the nimble.lock of the npins-pinned 3code source.
    src=$(nix-instantiate --eval --raw -E '(import ./npins)._3code.outPath')
    nix-store --realise "$src" >/dev/null
    tmp=$(mktemp -d)
    trap 'rm -rf "$tmp"' EXIT
    cp -r "$src"/. "$tmp"
    chmod -R u+w "$tmp"
    (cd "$tmp" && nim_lk nimble-to-nix) > "$tmp/lock.json"
    mv "$tmp/lock.json" packages/_3code.lock.json
  '';
}
