{
  description = "Jakub's system config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?rev=a403c08ee0811b6feea4a54d71d831c4dd83090f";
    unstable.url = "github:nixos/nixpkgs?rev=bb9fb3d3eb6da10fd1117556c894ebc2dc917263";
    darwin.url = "github:lnl7/nix-darwin/master";
    darwin.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, darwin, nixpkgs, unstable }: {
    # darwin-rebuild switch --flake .
    darwinConfigurations.kubukoz-work = darwin.lib.darwinSystem {
      system = "x86_64-darwin";
      modules = [ ./darwin-configuration.nix ];
      inputs = { inherit unstable; };
    };
  };
}
