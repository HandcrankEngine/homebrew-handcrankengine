#!/bin/bash

SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && pwd)
(

  VERSION=$1

  if [ -z "${VERSION}" ]; then
    echo "Missing version."
    exit 1
  fi

  cd "${SCRIPT_DIR}" || exit

  cd ../

  rm -rf temp/

  mkdir -p dist/
  mkdir -p temp/

  git clone --depth=1 https://github.com/HandcrankEngine/HandcrankEngine.git temp/

  cp -r temp/include dist/

  zip -r dist.zip dist/include

  hash=$(sha256sum dist.zip | awk '{print $1}')

  cat >handcrankengine.rb <<EOF
class Handcrankengine < Formula
  version "${VERSION//v/}"
  desc "Handcrank Engine is a cross-platform game engine written in C++ utilizing SDL."
  homepage "https://github.com/HandcrankEngine/HandcrankEngine"
  url "https://github.com/HandcrankEngine/homebrew-handcrankengine/releases/download/v${VERSION//v/}/dist.zip"
  sha256 "${hash}"
  license "MIT"

  depends_on "sdl2"
  depends_on "sdl2_image"
  depends_on "sdl2_ttf"
  depends_on "sdl2_mixer"

  def install
    prefix.install "include"
  end

  test do
    (testpath/"test.cpp").write <<~EOS
      #include <HandcrankEngine/HandcrankEngine.hpp>
      int main() { return 0; }
    EOS
    system ENV.cxx, "test.cpp", "-I#{include}", "-std=c++17"
  end
end
EOF

  rm -rf dist/
  rm -rf temp/

)
