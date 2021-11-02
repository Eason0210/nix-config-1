{ pkgs, config, ... }:
{
  home.packages = [
    pkgs.awscli
    pkgs.dss.bamc
  ];

  home.file.".aws/credentials".source =
    config.lib.file.mkOutOfStoreSymlink ./secret-credentials;

  home.file.".bamc.yaml".source = config.lib.file.mkOutOfStoreSymlink ./secret-.bamc.yaml;
}
