class Usacloud < Formula

  usacloud_version = "0.1.0"
  sha256_src_darwin = "f29d48eb8e6b5841dfc7a64f69f70bdb715997ff5193ba12b50cb34bb8f784f8"
  sha256_src_linux = "69f6060f8104d646edc4b9135533d5aa758852e9fa678d56424868de7f90b071"
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
