{ pkgs, config, ... }:
let
  nix-dss = import ../../nix-dss.nix { inherit pkgs; };
in
{
  home.packages = [
    pkgs.awscli
    pkgs.ssm-session-manager-plugin
    (pkgs.callPackage ./ssm-helpers.nix {})
    nix-dss.bamc
  ];

  home.file.".aws/credentials".source =
    config.lib.file.mkOutOfStoreSymlink ./secret-credentials;
}
