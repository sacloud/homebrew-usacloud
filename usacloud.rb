class Usacloud < Formula

  usacloud_version = "0.10.0"
  sha256_src_darwin = "a8f0273c7b7032172db30a597366515848b5dccdca9a2d7322e066306d837064"
  sha256_src_linux = "c9a1bea81498eb07cbb1126018017e150566fd357ff5c1a2d249c5ff9dbddb5c"
  sha256_bash_completion = "6f2ffd9aaf07d16ba08077d1d14b11905a5dfdfca9138ceea8e5d7ab9dc8bf7c"

  desc "Unofficial 'sacloud' - CLI client of the SakuraCloud"
  homepage "https://github.com/sacloud/usacloud"
  head "https://github.com/sacloud/usacloud.git"
  version usacloud_version

  if OS.mac?
    url "https://github.com/sacloud/usacloud/releases/download/v#{usacloud_version}/usacloud_darwin-amd64.zip"
    sha256 sha256_src_darwin
  else
    url "https://github.com/sacloud/usacloud/releases/download/v#{usacloud_version}/usacloud_linux-amd64.zip"
    sha256 sha256_src_linux
  end

  option "without-completions", "Disable bash completions"
  resource "bash_completion" do
    url "https://releases.usacloud.jp/usacloud/contrib/completion/bash/usacloud"
    sha256 sha256_bash_completion
  end

  def install
    bin.install "usacloud"
    if build.with? "completions"
      resource("bash_completion").stage {
        bash_completion.install "usacloud"
      }
    end

  end

  test do
    assert_match "SAKURACLOUD_ACCESS_TOKEN", shell_output("usacloud --help")
  end
end
