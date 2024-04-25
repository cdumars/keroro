{
  description = "Plays next unwatched episode in mpv and syncs progress with AniList";
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
  inputs.flake-utils.url = "github:numtide/flake-utils";

  outputs = {
    nixpkgs,
    flake-utils,
    ...
  }:
    flake-utils.lib.eachDefaultSystem (system: let
      pkgs = nixpkgs.legacyPackages.${system};
    in {
      packages.default = pkgs.callPackage ./default.nix {inherit pkgs;};
      devShells.default = pkgs.mkShell {
        inputsFrom = [(pkgs.callPackage ./default.nix {inherit pkgs;})];
      };
    });
}
