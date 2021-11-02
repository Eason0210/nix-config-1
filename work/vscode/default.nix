{ pkgs, ... }:
let
  vscode-lib = import ../../vscode/lib.nix;
  inherit (vscode-lib) configuredExtension managedPackages;
  managed = managedPackages {
    file = ./extensions/managed.nix;
    inherit (pkgs) vscode-utils;
  };
in
{
  programs.vscode.extensions = [
    managed.Arjun.swagger-viewer
  ];
}
