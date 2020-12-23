# This file was generated by GoReleaser. DO NOT EDIT.
class Usacloud < Formula
  desc ""
  homepage "https://github.com/sacloud/usacloud"
  version "1.0.1"
  license "Apache 2.0"
  bottle :unneeded

  if OS.mac?
    url "https://github.com/sacloud/usacloud/releases/download/v1.0.1/usacloud_darwin-amd64.zip"
    sha256 "d7d6b4760bd0b3f489da93ce94b2005fd71a89029e04de93259cb0e265028779"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/sacloud/usacloud/releases/download/v1.0.1/usacloud_linux-amd64.zip"
    sha256 "4a3b077ab909e2e1d4260e63c43854d5080e7f2bd00dfae946d800afe7d08618"
  end
  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://github.com/sacloud/usacloud/releases/download/v1.0.1/usacloud_linux-arm.zip"
    sha256 "76232edb7996da3e3c761b8ee2de7829903362565ca175aefe50b810ff0ba190"
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://github.com/sacloud/usacloud/releases/download/v1.0.1/usacloud_linux-arm64.zip"
    sha256 "a718923532f43b888be39ca1dbe8df5b3e7ee13b242fb25dfd0280e93b428f55"
  end

  def install
    bin.install "usacloud"
  end

  test do
    system "#{bin}/usacloud --version"
  end
end
