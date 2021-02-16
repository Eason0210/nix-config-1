let
  machine = import ../system/machines;
in
{
  imports =
    [ ./system/vpnc ];

  home-manager.users."${machine.username}" = {
    imports = [ ./home-work.nix ];
  };
}
