{ pkgs ? import <nixpkgs> {} }:

pkgs.stdenv.mkDerivation {
  name = "Lumatone Editor";

  # src = "./Lumatone_Editor";
  src = builtins.path {
    name = "lumatone-editor-bin";
    path = ./Lumatone_Editor;
  };

  nativeBuildInputs = [
    pkgs.autoPatchelfHook
    pkgs.makeWrapper
  ];

  buildInputs = with pkgs; [
    alsa-lib
    curl
    freetype
    gcc
    juce
    libssh
    libssh2
    libstdcxx5
    openssl
    pkg-config
    xorg.libX11
    xorg.libXScrnSaver
    xorg.libXcursor
    xorg.libXext
    xorg.libXinerama
    xorg.libXrandr
    xorg.libXrender
    xorg.libXrender
    xorg.libXfixes
    xorg.libXcomposite
    xorg.libGL

    stdenv.cc.cc
  ];

  unpackPhase = ''
    runHook preUnpack

    mkdir -p lumatone-editor
    cp $src lumatone-editor/Lumatone_Editor
    sourceRoot="$PWD/lumatone-editor"

    runHook postUnpack
  '';

  installPhase = ''
    mkdir -p $out/bin
    cp $sourceRoot/Lumatone_Editor $out/bin/Lumatone_Editor
    chmod u+w $out/bin/Lumatone_Editor

    patchelf --set-interpreter "$(cat $NIX_CC/nix-support/dynamic-linker)" \
             $out/bin/Lumatone_Editor

    # You can try letting autoPatchelfHook do RPATH patches, but if dynamic dlopen is used, RPATH might not help
    # So let's wrap the binary:

  makeWrapper $out/bin/Lumatone_Editor $out/bin/Lumatone_Editor \
    --set LD_LIBRARY_PATH "${pkgs.xorg.libX11}/lib:${pkgs.xorg.libXext}/lib:${pkgs.xorg.libXcursor}/lib:${pkgs.xorg.libXrandr}/lib:${pkgs.xorg.libXinerama}/lib:${pkgs.xorg.libXrender}/lib:${pkgs.xorg.libXfixes}/lib:${pkgs.mesa}/lib:${pkgs.openssl.out}/lib"
  '';

  meta = with pkgs.lib; {
    description = "Patched Lumatone Editor for NixOS";
    license = licenses.unfreeRedistributable;
    platforms = platforms.linux;
  };
}
