{ pkgs, config, ... }:
{
  home.packages = [
    pkgs.awscli
    pkgs.ssm-session-manager-plugin
    (pkgs.callPackage ./ssm-helpers.nix {})
    pkgs.dss.bamc
  ];

  home.file.".aws/credentials".source =
    config.lib.file.mkOutOfStoreSymlink ./secret-credentials;

  home.file.".bamc.yaml".text = builtins.readFile ./semisecret-.bamc.yaml;
}
