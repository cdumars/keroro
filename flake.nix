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
      packages.mpvScripts.keroro = pkgs.writeText "keroro-mpv" ''
      local update_path = ${packages.default}/bin/keroro-update
      local update_presence_path = ${packages.default}/bin/keroro-update-presence
      local run_presence_path = ${packages.default}/bin/keroro-run-presence

      ${builtins.readFile ./anilist.lua}
      '';
      devShells.default = pkgs.mkShell {
        inputsFrom = [(pkgs.callPackage ./default.nix {inherit pkgs;})];
      };
    });
}
