{
  description = "Personal dev toolchain, reproducible across machines via nix-portable";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

  outputs = { self, nixpkgs }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };
    in {
      # exact match to what's currently installed manually (go1.27.0)
      devShells.${system}.default = pkgs.mkShell {
        packages = [
          pkgs.go_1_27
          pkgs.zig_0_16 # closest nixpkgs release; local install is a 0.17-dev nightly, not reproducible via nixpkgs
        ];
      };
    };
}
