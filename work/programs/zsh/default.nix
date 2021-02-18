{ ... }:
let
  awsp-script = import ../aws/awsp.nix;
in
{
  programs.zsh = {
    shellAliases = {
      awsall = "_awsListProfile";
      awsp = "_awsSwitchProfile";
      awswho = "aws configure list";
    };

    initExtra = ''source ${awsp-script}'';
  };
}
