class Usacloud < Formula

  usacloud_version = "0.9.0"
  sha256_src_darwin = "031a2ef733ef6f041f3d2ae665721600100f276217256008f804e02fa90b36cc"
  sha256_src_linux = "336b8848512ce630f85eb95490083242a5282fc0c1c992b5486e119c8ae6e60b"
  sha256_bash_completion = "e23bd0cb96dd03fbd79ade8d20a5f6a9f530b0691e61a28ccbab6d3b078f04cb"

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
