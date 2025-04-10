class Psgplay < Formula
  desc "PSG play is a music player and emulator for the Atari ST Programmable Sound Generator (PSG) YM2149 and files in the SNDH archive."
  homepage "https://github.com/frno7/psgplay"
  license "GPL-2.0-only"
  url "https://github.com/frno7/psgplay/archive/refs/tags/v0.7.tar.gz"
  head "https://github.com/kareandersen/psgplay.git", branch: "homebrew_builds", using: :git, shallow: false

  depends_on "gcc"
  depends_on "portaudio"

  def install
    system "git", "clone", "--recurse-submodules", ".", "build-clean"
    cd "build-clean" do
      system "./script/compile", "arch", "mac-homebrew-gcc-portaudio"
      bin.install "psgplay"
    end
  end

  test do
    system "#{bin}/psgplay", "--version"
  end
end

