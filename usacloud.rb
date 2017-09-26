class Usacloud < Formula

  usacloud_version = "0.2.1"
  sha256_src_darwin = "c4beca83bcafbc56eaeeac283feb075f40cd34dc7c08920c0402df3bb341b480"
  sha256_src_linux = "7697979e0dfe602a2e525c4c2318f7cbea31f23014f9c010edc47c61badda8af"
  sha256_bash_completion = "deff955dca065632330cbf043f4d5a6f1388e84da7c41824efa1d214cb318ab5"

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
