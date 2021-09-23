_: super:
{
  dss =
    import (
      builtins.fetchGit {
        url = "git@github.bamtech.co:jkozlowski/nix-dss";
        ref = "master";
        rev = "a10c1b0ca7b790db6ad8261ff78a4c6660ed0c39";
      }
    ) { pkgs = super; };
}
