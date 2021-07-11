{ pkgs, ... }:
let
  nix-dss = import ../nix-dss.nix { inherit pkgs; };
  vscode-lib = import ../../vscode/lib.nix;
  inherit (vscode-lib) configuredExtension managedPackages;
  managed = managedPackages {
    file = ./extensions/managed.nix;
    inherit (pkgs) vscode-utils;
  };
  swagger-viewer = managed.Arjun.swagger-viewer;
  sqltools = managed.mtxr.sqltools;
  snowflake =
    configuredExtension {
      extension = managed.koszti.snowflake-driver-for-sqltools;
      settings = {
        "sqltools.connections" = [
          (import ./semisecret-snowflake.nix)
        ];
      };
    };
in
{
  imports = [ snowflake ];
  programs.vscode.extensions = [ swagger-viewer sqltools nix-dss.vscode-extensions.vscode-smithy ];
}
