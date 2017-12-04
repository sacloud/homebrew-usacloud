class Usacloud < Formula

  usacloud_version = "0.6.1"
  sha256_src_darwin = "7d64c5f5839f2a5cdab8b6e6a489e7721e186b1d610295b938400a317cd9294c"
  sha256_src_linux = "a01a2b08b01c3bf68ed5669c650d8cb444410a08656b6250f7d40a763a45545f"
  sha256_bash_completion = "17e922d8cc8bf26454b5e4d5419a2c30e1e72e9fbd8b9412fa5d5c9022551977"

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
