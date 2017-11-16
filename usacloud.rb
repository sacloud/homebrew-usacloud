class Usacloud < Formula

  usacloud_version = "0.5.0"
  sha256_src_darwin = "e68fc01661a364cb3d391c2daae26670dd7620d0d8e5d87361e4b82328e56be4"
  sha256_src_linux = "5e5099fe1f4c6a94e97fe1367358bee60f45872387f8439a2fe2bd2380071658"
  sha256_bash_completion = "f601ca5c8ed5f7be1d887758bef481ac62702085e49d0d3dc1cd1a30c6cc4eba"

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
