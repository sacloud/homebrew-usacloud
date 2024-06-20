# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Usacloud < Formula
  desc ""
  homepage "https://github.com/sacloud/usacloud"
  version "1.14.1"
  license "Apache-2.0"

  on_macos do
    on_intel do
      url "https://github.com/sacloud/usacloud/releases/download/v1.14.1/usacloud_darwin-amd64.zip"
      sha256 "26fbb1892de5e5b22617d676004ecee7f5ac98fc0e1bdc818e70faf1c08941f9"

      def install
        bin.install "usacloud"
      end
    end
    on_arm do
      url "https://github.com/sacloud/usacloud/releases/download/v1.14.1/usacloud_darwin-arm64.zip"
      sha256 "c52cefd12ebe3b090194d318ef2cb7acce0e5c9de63cd849e9ee7b0b7798b518"

      def install
        bin.install "usacloud"
      end
    end
  end

  on_linux do
    on_intel do
      if Hardware::CPU.is_64_bit?
        url "https://github.com/sacloud/usacloud/releases/download/v1.14.1/usacloud_linux-amd64.zip"
        sha256 "860d20a1b46653de996abde93db362f951b3abd596d10152c679ead1b384b2ce"

        def install
          bin.install "usacloud"
        end
      end
    end
    on_arm do
      if !Hardware::CPU.is_64_bit?
        url "https://github.com/sacloud/usacloud/releases/download/v1.14.1/usacloud_linux-arm.zip"
        sha256 "84de35aeadb3add7e6b42aa0e0d2e9f40496460508b3d8d682392219942106f0"

        def install
          bin.install "usacloud"
        end
      end
    end
    on_arm do
      if Hardware::CPU.is_64_bit?
        url "https://github.com/sacloud/usacloud/releases/download/v1.14.1/usacloud_linux-arm64.zip"
        sha256 "a4acb6f8cb57e44869afae33f5d0206e3a1c027478e87725cfd921f2288b4dfb"

        def install
          bin.install "usacloud"
        end
      end
    end
  end

  test do
    system "#{bin}/usacloud --version"
  end
end
