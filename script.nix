{ pkgs, stdenv, keroro}:


let
  script = pkgs.writeText "mpv-keroro.lua" ''
  local update_path = "${keroro}/bin/keroro-update"
  local update_presence_path = "${keroro}/bin/keroro-update-presence"
  local run_presence_path = "${keroro}/bin/keroro-run-presence"

  ${builtins.readFile ./anilist.lua}
  '';
in
  stdenv.mkDerivation {
    pname = "mpv-keroro";
    version = "0.0.1+git";

    src = script;
    passthru.scriptName = "mpv-keroro.lua";

    dontUnpack = true;

    installPhase = ''
    mkdir -p $out/share/mpv/scripts
    cp $src $out/share/mpv/scripts/mpv-keroro.lua
    '';
}
