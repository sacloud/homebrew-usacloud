class Usacloud < Formula

  usacloud_version = "0.2.2"
  sha256_src_darwin = "39cc817450eca7c5e84f048c41226ea8bb3c6b07145e5c3cba377ce5d4432717"
  sha256_src_linux = "d2461a5493b07a7aa5e3a8a67482238fb88c85d94ea153328f77dac34e66a61a"
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
