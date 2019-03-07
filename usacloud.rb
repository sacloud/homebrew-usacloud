class Usacloud < Formula

  usacloud_version = "0.20.0"
  sha256_src_darwin = "64a6657a436d735d92c259ae701df928e57269c5a79db7b677ab89cb4cde7b12"
  sha256_src_linux = "6cbd5d9d54942004111cd67cee9d40a93a9f42d0da56852185aa88efd6b1ef0a"
  sha256_bash_completion = "69407c820cdb9b3537d06df9e649500d3334860de93d733ecdf5817f40c87aeb"

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
