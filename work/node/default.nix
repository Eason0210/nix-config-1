{ pkgs, ... }:
let
  node2nix = pkgs.callPackage ./node2nix {};
  inherit (node2nix) dynamodb-admin;
  dynamodb-admin-local =
    pkgs.writeScriptBin
      "dynamodb-admin"
      "DYNAMO_ENDPOINT=http://localhost:4569 ${dynamodb-admin}/bin/dynamodb-admin \"$@\"";
in
{
  home.packages = [ dynamodb-admin-local ];
}
