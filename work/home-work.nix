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
    pkgs.dss.scala-cli
    pkgs.dss.dss-scripts-v2
    pkgs.pipenv
  ];
}
