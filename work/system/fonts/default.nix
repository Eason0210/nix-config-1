{ pkgs, ... }: {

  fonts = {
    enableFontDir = true;
    fonts = [ (pkgs.callPackage ./poppins.nix {}) ];
  };
}
