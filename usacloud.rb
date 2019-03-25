class Usacloud < Formula

  usacloud_version = "0.20.1"
  sha256_src_darwin = "4a7ba1ad268ca053919266900468dd781e26dd22e8fb84f1b924ded048294d22"
  sha256_src_linux = "42dfd8d3ede76334eea352a043a9d2c333c895bb235f3bb5d657e23837e9c8d1"
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
