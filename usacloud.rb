# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Usacloud < Formula
  desc ""
  homepage "https://github.com/sacloud/usacloud"
  version "1.4.1"
  license "Apache 2.0"
  bottle :unneeded

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/sacloud/usacloud/releases/download/v1.4.1/usacloud_darwin-amd64.zip"
      sha256 "ac735d1acf82f3b96989093229af768c45a520db90831afa0c98c10caa22aea0"
    end
    if Hardware::CPU.arm?
      url "https://github.com/sacloud/usacloud/releases/download/v1.4.1/usacloud_darwin-arm64.zip"
      sha256 "516a0867ed3fd2d3081c071704e33f6698826111e31f06cea0dab5bb490ea84c"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/sacloud/usacloud/releases/download/v1.4.1/usacloud_linux-amd64.zip"
      sha256 "8ff039806c771a6b353817b10d3d150310f10f61124d5dfe96b35db363d7d12e"
    end
    if Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
      url "https://github.com/sacloud/usacloud/releases/download/v1.4.1/usacloud_linux-arm.zip"
      sha256 "ee5cdc3f6ed1a7297a4edccb76319a2c9cb78d87d38f631668644f47f7241dd3"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/sacloud/usacloud/releases/download/v1.4.1/usacloud_linux-arm64.zip"
      sha256 "44654fa761d48ad3f8e8b84909174816770f1d4362249b3b85983ddad18a02e2"
    end
  end

  def install
    bin.install "usacloud"
  end

  test do
    system "#{bin}/usacloud --version"
  end
end
