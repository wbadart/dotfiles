{
  src ? import ../npins,
  pkgs ? import src.nixpkgs { },
  ...
}:
let
  inherit (pkgs) lib nixosOptionsDoc nixos-render-docs documentation-highlighter;

  hmSrc = src.home-manager;
  extendedLib = import "${hmSrc}/modules/lib/stdlib-extended.nix" lib;

  hmModules = import "${hmSrc}/modules/modules.nix" {
    lib = extendedLib;
    inherit pkgs;
    check = false;
  };

  eval = extendedLib.evalModules {
    modules = hmModules ++ [
      ../home.nix
      { _module.check = false; }
    ];
    class = "homeManager";
  };

  # Filter to only our custom dotfiles.* options
  optionsDoc = nixosOptionsDoc {
    options = builtins.removeAttrs eval.options
      (builtins.filter (n: n != "dotfiles") (builtins.attrNames eval.options));
  };
in
pkgs.stdenv.mkDerivation {
  name = "dotfiles-manual";

  src = ./.;

  nativeBuildInputs = [ nixos-render-docs ];

  buildPhase = ''
    mkdir -p out/highlightjs

    cp -t out/highlightjs \
      ${documentation-highlighter}/highlight.pack.js \
      ${documentation-highlighter}/LICENSE \
      ${documentation-highlighter}/mono-blue.css \
      ${documentation-highlighter}/loader.js

    substituteInPlace ./options.md \
      --subst-var-by \
        OPTIONS_JSON \
        ${optionsDoc.optionsJSON}/share/doc/nixos/options.json

    cp ${hmSrc}/docs/static/style.css out/style.css

    nixos-render-docs manual html \
      --manpage-urls ./manpage-urls.json \
      --revision local \
      --stylesheet style.css \
      --script highlightjs/highlight.pack.js \
      --script highlightjs/loader.js \
      --toc-depth 1 \
      --section-toc-depth 1 \
      manual.md \
      out/index.xhtml
  '';

  installPhase = ''
    mv out $out
  '';
}
