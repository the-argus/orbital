{
  stdenv,
  cmake,
  pkg-config,
  fmt,
  rapidjson,
  glslang,
  imgui,
  libzip,
  SDL2,
  vulkan-headers,
  vulkan-loader,
  zlib,
  ...
}:
stdenv.mkDerivation {
  pname = "orbital";
  version = "alpha";
  src = ../../.;
  patches = [./cmake-for-nix.patch];
  nativeBuildInputs = [
    cmake
    pkg-config
    fmt
    rapidjson
    glslang
    imgui
    libzip
    SDL2
    vulkan-headers
    vulkan-loader.dev
    zlib
  ];
  installPhase = ''
    # this will need to change later once I can actually complete the build
    mkdir -p $out
    mv bin $out/bin
  '';
}
