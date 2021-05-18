{ pkgs, ... }:
let
  nix-dss = import ./nix-dss.nix { inherit pkgs; };
in
{
  imports = [
    ./node
    ./programs/aws
    ./programs/zsh
    ./programs/openconnect
    ./vscode
    ./scala
    ./semisecret-work.nix
  ];

  home.packages = [
    nix-dss.create-account
  ];
}
