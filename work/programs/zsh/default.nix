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

    initExtraBeforeCompInit = ''
      fpath+=(~/dev/dss-scripts/completions)
    '';

    initExtra = ''
      source ${awsp-script}
      source ~/dev/dss-scripts;
    '';

    oh-my-zsh = {
      plugins = [ "aws" ];
    };
  };

  home.sessionPath = [ "$HOME/dev/dss-scripts/bin" ];
}
