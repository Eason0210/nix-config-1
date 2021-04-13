{ pkgs, ... }:
let
  nix-dss = import ../nix-dss.nix { inherit pkgs; };
  vscode-lib = import ../../vscode/lib.nix;
  inherit (vscode-lib) configuredExtension;
  extensionFromVscodeMarketplace = pkgs.vscode-utils.extensionFromVscodeMarketplace;
  swagger-viewer = extensionFromVscodeMarketplace {
    name = "swagger-viewer";
    publisher = "Arjun";
    version = "3.0.1";
    sha256 = "01cz9ag06h0624v963ypnaahrpfzl0gv0nnw356llbv1pz90f6w5";
  };
  sqltools = extensionFromVscodeMarketplace {
    name = "sqltools";
    publisher = "mtxr";
    version = "0.23.0";
    sha256 = "0gkm1m7jss25y2p2h6acm8awbchyrsqfhmbg70jaafr1dfxkzfir";
  };
  snowflake =
    configuredExtension {
      extension = extensionFromVscodeMarketplace {
        name = "snowflake-driver-for-sqltools";
        publisher = "koszti";
        version = "0.4.1";
        sha256 = "06csh4c9wjp6lvcvn915sjk9f1q6fg3kdsl3f94zqz8va11bcrbl";
      };
      settings = {
        "sqltools.connections" = [
          (import ./semisecret-snowflake.nix)
        ];
      };
    };
in
{
  imports = [ snowflake ];
  programs.vscode.extensions = [ swagger-viewer sqltools nix-dss.vscode-extensions.smithy-lsp ];
}
