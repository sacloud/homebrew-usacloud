class Usacloud < Formula

  usacloud_version = "0.33.0"
  sha256_src_darwin = "24b5e533edb5eb6a00b6724e231ec1ee16eddd4e76a707ca5c72a35d42e617d8"
  sha256_src_linux = "bd0faccffa2881dd53b08d8e216f04972be6a09778cb8bcbf01b285f0fc9f4a8"
  sha256_bash_completion = "7d811dbd143130e8d3117154e4fc69dcb6cff50374ed724960576283b96e023e"

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
