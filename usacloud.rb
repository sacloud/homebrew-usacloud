class Usacloud < Formula

  usacloud_version = "0.1.1"
  sha256_src_darwin = "a1f7c4a39acf8d5f677fdd258ee9f2077c2cf2d01eae345b2439b5874f42cb6a"
  sha256_src_linux = "2230a09174371a07e6075c852c2eedd2be2c10fb0d58062b8e53ca0df0fd4ef7"
  sha256_bash_completion = "6c1656e549ef37348d23fd73784a5bf74453ef6168ae00741ce522cdf1a47b8c"

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
    url "https://usacloud.b.sakurastorage.jp/contrib/completion/bash/usacloud"
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
