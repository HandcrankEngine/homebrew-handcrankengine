class handcrankengine < Formula
  version "0.0.1"
  desc "Handcrank Engine is a cross-platform game engine written in C++ utilizing SDL."
  homepage "https://github.com/HandcrankEngine/HandcrankEngine"
  url "https://github.com/HandcrankEngine/homebrew-handcrankengine/archive/refs/tags/v0.0.1/dist.zip"
  sha256 "1651b1c1e3079f7fc4f6d4ffba110c69c306740de02397a766176379b76b9353"
  license "MIT"

  depends_on "sdl2"
  depends_on "sdl2_image"
  depends_on "sdl2_ttf"
  depends_on "sdl2_mixer"
end
