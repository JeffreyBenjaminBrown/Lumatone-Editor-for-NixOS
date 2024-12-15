# shell.nix
{ pkgs ? import <nixpkgs> {} }:
  pkgs.mkShell {
    nativeBuildInputs = with pkgs.buildPackages; [
      # nativeBuildInputs is usually what you want
      # -- tools you need to run
      alsa-lib
      curl
      freetype
      gcc
      juce
      libssh
      libssh2
      libstdcxx5
      pkg-config
      xorg.libX11
      xorg.xhost
    ];
    shellHook = ''
      export LD_LIBRARY_PATH=${pkgs.alsa-lib}/lib:${pkgs.freetype}/lib:${pkgs.curl}/lib:${pkgs.libssh2}/lib:${pkgs.libstdcxx5}/lib:$LD_LIBRARY_PATH
    '';
}
