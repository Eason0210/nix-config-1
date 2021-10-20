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
    # todo openssl
    # pkgs.dss.create-account
    pkgs.dss.scala-cli
    pkgs.dss.dss-scripts
    pkgs.pipenv
  ];
}
