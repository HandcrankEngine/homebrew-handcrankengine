class Handcrankengine < Formula
  version "0.0.1"
  desc "Handcrank Engine is a cross-platform game engine written in C++ utilizing SDL."
  homepage "https://github.com/HandcrankEngine/HandcrankEngine"
  url "https://github.com/HandcrankEngine/homebrew-handcrankengine/releases/download/v0.0.1/dist.zip"
  sha256 "1d326bf327e208f23c62233beb10c38c3f31bcaf9a8ea5d8b95b26add74746c0"
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
