# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Usacloud < Formula
  desc ""
  homepage "https://github.com/sacloud/usacloud"
  version "1.12.2"
  license "Apache 2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/sacloud/usacloud/releases/download/v1.12.2/usacloud_darwin-amd64.zip"
      sha256 "6bc2eb851ff96cdd309afcfe287279259fc7cb898ceb14165865ac8c3af1e7b8"

      def install
        bin.install "usacloud"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/sacloud/usacloud/releases/download/v1.12.2/usacloud_darwin-arm64.zip"
      sha256 "9d6c47eecd0b0cb720ddd2e4a16720ab13bcacfe26d0b6cfa12c053c4221e3f6"

      def install
        bin.install "usacloud"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/sacloud/usacloud/releases/download/v1.12.2/usacloud_linux-amd64.zip"
      sha256 "30fc05bf2d1918792418a875ff97de6f5b3607acc604cc98de79c6ebd8b5ba89"

      def install
        bin.install "usacloud"
      end
    end
    if Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
      url "https://github.com/sacloud/usacloud/releases/download/v1.12.2/usacloud_linux-arm.zip"
      sha256 "d61015f6a1c42eb3317a13b9fa3539cd1426178b0d0ffcb8ea27b02a2744cf01"

      def install
        bin.install "usacloud"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/sacloud/usacloud/releases/download/v1.12.2/usacloud_linux-arm64.zip"
      sha256 "d961d4e8cc83050bf6a4a51665c202f2567bf9fa35da1d383018d44aa8de622a"

      def install
        bin.install "usacloud"
      end
    end
  end

  test do
    system "#{bin}/usacloud --version"
  end
end
