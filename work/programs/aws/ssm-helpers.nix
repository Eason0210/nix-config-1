{ stdenv, gnutar }:
let
  version = "1.0.2";

in
stdenv.mkDerivation {
  name = "ssm-helpers-${version}";
  buildInputs = [ gnutar ];

  src = builtins.fetchurl {
    url =
      "https://github.com/disneystreaming/ssm-helpers/releases/download/v${version}/ssm-helpers_${version}_Darwin_x86_64.tar.gz";
    sha256 = "1mnqv55is011jk1djg5j4znank9bvya3ygaaq9r25ryccpsxxh02";
  };

  unpackPhase = "tar -xzf $src";

  installPhase = ''
    mkdir -p $out/bin
    cp ssm $out/bin'';
}
