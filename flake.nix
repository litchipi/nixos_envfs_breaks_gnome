{
  description = "NixOs VM to debug gnome";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    nixosgen = {
      url = "github:nix-community/nixos-generators";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    envfs = {
      url = "github:Mic92/envfs";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, ...}@inputs: {
    vm  = inputs.nixosgen.nixosGenerate {
      pkgs = import nixpkgs { system = "x86_64-linux"; };
      format = "vm";
      modules = [
        ./machine.nix
        inputs.envfs.nixosModules.envfs
      ];
    };
  };
}
