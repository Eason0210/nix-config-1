{ pkgs, ... }:
let
  nix-dss = import ./nix-dss.nix { inherit pkgs; };
in
{
  imports = [
    ./node
    ./programs/aws
    ./programs/ssh
    ./programs/zsh
    ./programs/openconnect
    ./vscode
    ./scala
  ];

  home.packages = [
    nix-dss.create-account
    nix-dss.scala-cli
    pkgs.pipenv
  ];
}
