{ pkgs, ... }:
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
    pkgs.dss.dss-scripts
  ];
}
