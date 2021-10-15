let
  machine = import ../system/machines;
in
{
  imports =
    [ ./system/vpnc ./system/fonts ];

  nixpkgs = {
    overlays = [ (import ./nix-dss.nix) ];
  };

  home-manager.users."${machine.username}" = {
    imports = [ ./home-work.nix ];
  };
}
