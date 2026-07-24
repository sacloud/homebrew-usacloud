class Usacloud < Formula
  desc ""
  homepage "https://github.com/sacloud/usacloud"
  version "1.22.5"
  license "Apache-2.0"
  disable! date: "2026-07-24", because: :deprecated, replacement_cask: "sacloud/usacloud/usacloud"
  url "https://github.com/sacloud/usacloud/releases/download/v1.22.5/usacloud_darwin-amd64.zip"

  def install = system "false"
  def caveats = <<~EOS
    usacloud is now distributed as a Homebrew Cask.
    
    Please run:

      brew uninstall usacloud
      brew install --cask usacloud
  EOS
end
