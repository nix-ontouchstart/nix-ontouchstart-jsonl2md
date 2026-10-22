{
  inputs.nixpkgs.url = "github:nixos/nixpkgs/master";

  outputs = { self, nixpkgs }: 
    let 
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; }; 
    in {
      packages = {
        ${system}.default = pkgs.rustPlatform.buildRustPackage {
          pname = "nix-ontouchstart-jsonl2md";
          version = "0.1.0";
          src = ./.;
          cargoLock.lockFile = ./Cargo.lock;
        };
      };
    };
}
