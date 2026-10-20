{
  inputs.nixpkgs.url = "github:NixOS/nixpkgs";

  outputs = { self, nixpkgs }: 
    let 
      systems = [ "aarch64-linux" "aarch64-darwin" "x86_64-linux" ];
    in {
      packages = nixpkgs.lib.genAttrs systems (system: 
        let 
          pkgs = import nixpkgs { inherit system; }; 
        in {
          default = pkgs.rustPlatform.buildRustPackage {
          pname = "nix-ontouchstart-jsonl2md";
          version = "0.1.0";
          src = ./.;
          cargoLock.lockFile = ./Cargo.lock;
        };
      });
    };
}
