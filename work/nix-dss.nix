_: super:
{
  dss =
    import (
      builtins.fetchGit {
        url = "git@github.bamtech.co:jkozlowski/nix-dss";
        ref = "master";
        rev = "924924b0e47da9119a33135060babad43d331607";
      }
    ) { pkgs = super; };
}
