_: super:
{
  dss =
    import (
      builtins.fetchGit {
        url = "git@github.bamtech.co:jkozlowski/nix-dss";
        ref = "master";
        rev = "aef3ab6df06329d5dbc78d48a7065f7a3a0f01aa";
      }
    ) { pkgs = super; };
}
