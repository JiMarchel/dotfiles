{
  pkgs,
  lib,
  ...
}: {
  programs.starship = {
    enable = true;
    settings = lib.mkForce (pkgs.lib.importTOML ./starship.toml);
  };
}
