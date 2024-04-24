{pkgs}:

pkgs.python3Packages.buildPythonPackage {
  pname = "keroro";
  version = "0.0.1";
  pyproject = true;

  src = ./.;

  dependencies = with pkgs.python3Packages; [
    platformdirs
    colorama
    requests
    pypresence
    setuptools
  ];

  meta = {
    changelog = "https://github.com/cdumars/keroro/commits/main/";
    description = "Plays next unwatched episode in mpv and syncs progress with AniList";
    homepage = "https://github.com/cdumars/keroro";
  };
}
