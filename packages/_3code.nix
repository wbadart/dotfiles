{ _3code, ... }:
{
  buildNimPackage,
  openssl,
}: buildNimPackage {
  pname = "3code";
  version = _3code.version or _3code.branch;
  src = _3code;
  lockFile = ./_3code.lock.json;
  buildInputs = [ openssl ];
  # tests/tty_expect.nim imports std/re (pcre v1, dropped from nixpkgs)
  doCheck = false;
  nimFlags = [
    "-d:useOpenssl3"
    "--dynlibOverride:ssl"
    "--passL:-lssl"
    "--passL:-lcrypto"
  ];
  postBuild = ''
    eval nim compile "''${nimFlags[@]}" --parallelBuild:$NIX_BUILD_CORES -o:"$out/bin/3code" src/threecode.nim
  '';
  postPatch = ''
    substituteInPlace config.nims --replace-fail '& getVersionString())' '& getNimbleVersion())'
    substituteInPlace src/threecode/anthropic.nim \
      --replace-fail 'd{"text_delta"}{"text"}' 'd{"text"}' \
      --replace-fail 'd{"thinking_delta"}{"thinking"}' 'd{"thinking"}' \
      --replace-fail 'd{"signature_delta"}{"signature"}' 'd{"signature"}' \
      --replace-fail 'd{"input_json_delta"}{"partial_json"}' 'd{"partial_json"}'
    substituteInPlace src/threecode/prompts.nim --replace-fail '    return 131_072' '    return 128_000'
  '';

  meta = {
    description = "The Economical Coding Agent";
    homepage = "https://github.com/capocasa/3code";
  };
}
