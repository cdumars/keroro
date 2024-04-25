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
    in rec {
      packages.default = pkgs.callPackage ./default.nix {inherit pkgs;};
      packages.mpvScripts.default = pkgs.callPackage ./script.nix {inherit pkgs; keroro = packages.default;};
      devShells.default = pkgs.mkShell {
        inputsFrom = [(pkgs.callPackage ./default.nix {inherit pkgs;})];
      };
    });
}
