class Usacloud < Formula

  usacloud_version = "0.28.0"
  sha256_src_darwin = "02182a435460c2a45cf04659f6149217564ebed44bc1bcb1d4ba4b17cc09ab17"
  sha256_src_linux = "4aa858e8f432f7aa829028de86af3b43f0485e5b3bf5e8b4cd93e8b720c6557d"
  sha256_bash_completion = "59fe64fba4cd02dc101bf9b761cb404aa1245698edf193d090c41b2ff64d1627"

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
