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

    initExtra = ''
      source ${awsp-script}
    '';

    initExtraBeforeCompInit = ''
      fpath+=(~/dev/dss-scripts/completions)
    '';

    oh-my-zsh = {
      plugins = [ "aws" ];
    };
  };
}
