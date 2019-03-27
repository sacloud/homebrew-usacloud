class Usacloud < Formula

  usacloud_version = "0.21.0"
  sha256_src_darwin = "b22ca05d8758c8f31531d6a168b699a22bf22ce7350d2ef3e34ba91b0b027aae"
  sha256_src_linux = "b3852369b31bc0c8f0361a38e7a11d57c34d2f006c9e6ff31b3fe5b393768f07"
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
