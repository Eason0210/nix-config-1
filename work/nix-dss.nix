_: super:
{
  dss =
    import (
      builtins.fetchGit {
        url = "git@github.bamtech.co:jkozlowski/nix-dss";
        ref = "master";
        rev = "0ffd424c7abdc5a1fde86ea5effb912540115c62";
      }
    ) { pkgs = super; };
}
