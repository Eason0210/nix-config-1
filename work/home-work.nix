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
    pkgs.dss.create-account
    pkgs.dss.dss-scripts
    pkgs.pipenv
  ];
}
