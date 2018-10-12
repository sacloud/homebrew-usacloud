class Usacloud < Formula

  usacloud_version = "0.15.0"
  sha256_src_darwin = "c91a13b3915c1c81ac0e59d072b63af099c4522b0d253c0b0851a256fc96b528"
  sha256_src_linux = "40cfb21220645dd806d3ce07d92fdf6ad85e54eb7eb43e1c3b1b24e7122bc60b"
  sha256_bash_completion = "3a5c1c47e524baf1cc666532fd7a2ef28849195a9ad0ec2aa2c037093f7b45c1"

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
