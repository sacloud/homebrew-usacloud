class Usacloud < Formula

  usacloud_version = "0.2.0"
  sha256_src_darwin = "f9ceae506287b8d47ce1ba1d8c875290c73edbf8b5332c37c215ad5665454560"
  sha256_src_linux = "e7a5a67ccc6b8a779825448cd7e18b9a7d5f9d5905e085bbf17cf55cc9b09f0b"
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
    url "http://releases.usacloud.jp/usacloud/contrib/completion/bash/usacloud"
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
