{ stdenv }:
let
  name = "poppins";
  version = "88398090720b3fd373b68a5c4e6915c3ee77ab81";
in
stdenv.mkDerivation {
  name = "${name}-${version}";
  src =
    let
      mkVariant = { variant, sha256 }:
        let
          baseUrl =
            "https://raw.githubusercontent.com/google/fonts/main/ofl/poppins";
        in
          builtins.fetchurl {
            name = "Poppins-${variant}.ttf";
            url = "${baseUrl}/Poppins-${variant}.ttf";
            inherit sha256;
          };

    in
      map mkVariant [
        {
          variant = "Regular";
          sha256 = "1fm7jh59ic5z56da1psc8brcx3bcw62whz1600irw5brkcg20rby";
        }
        {
          variant = "Medium";
          sha256 = "01gxl4dhnyaqy4wsd7mrrbni5nqbr8niagpw7224ccldhdykwdwh";
        }
        {
          variant = "SemiBold";
          sha256 = "11h2k95kk6k0irbjial3ba1qdc3dzvcx3cf0kbd863jmy3d1pgyk";
        }
      ];
  dontUnpack = true;
  installPhase = ''
    mkdir -p $out/share/fonts/truetype/${name}
    cp $src $out/share/fonts/truetype/${name}
  '';
}
