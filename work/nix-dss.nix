_: super:
let
  sources = import ../nix/sources.nix;
in
{
  dss = import sources.nix-dss { pkgs = super; };
}
