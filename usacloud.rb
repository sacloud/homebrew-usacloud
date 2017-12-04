class Usacloud < Formula

  usacloud_version = "0.6.2"
  sha256_src_darwin = "8abf350ccf67919bc2b846d140b9c8d100a7049789e2d358a18b87dae20a952b"
  sha256_src_linux = "793a564b5b97d8ddbf92f0835f0d7aeb57d7d0a553b5980c6d0a569aed1d9bb2"
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
