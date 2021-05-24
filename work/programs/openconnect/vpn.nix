{ writeScriptBin, bash, gawk, config }:
let
  passwordCommand = "${bash}/bin/bash ${builtins.toString ./secret-vpn.sh}";
in
writeScriptBin "vpn" ''
  ${passwordCommand} | \
    sudo openconnect vpn.disneystreaming.com \
      --user jkozlowski \
      --background''
