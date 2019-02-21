class Usacloud < Formula

  usacloud_version = "0.19.0"
  sha256_src_darwin = "bbb12a33dbc4e021f0ecc39ee45f68ccb144b8241aaa3e50785d7e8a1d00bbca"
  sha256_src_linux = "0cfa91e128626168744291da531b0fa5c79a86f29a6ce02207831b677620e8a6"
  sha256_bash_completion = "20d441a4a0b23a65c87950bd38baf0cca1f7d71b270173f4895e7df44a9ddfe9"

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
