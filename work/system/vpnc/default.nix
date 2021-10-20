{ pkgs, ... }:

{
  environment.etc = {
    "vpnc/post-connect.d/setup".text = ''
      #!${pkgs.bash}/bin/bash
      networksetup -setdnsservers Wi-Fi "$INTERNAL_IP4_DNS"
    '';

    "vpnc/post-disconnect.d/reset".text = ''
      #!${pkgs.bash}/bin/bash
      networksetup -setdnsservers Wi-Fi 1.1.1.1
    '';
  };
}
