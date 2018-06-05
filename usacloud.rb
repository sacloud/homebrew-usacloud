class Usacloud < Formula

  usacloud_version = "0.11.1"
  sha256_src_darwin = "e62c8fedb783354a96636ecd88519499ad8445d2793e6205d6ad5fab7c13da73"
  sha256_src_linux = "2b284f2dc10120db74bcb35c65054683dee23fb2f0724e0aa69ce203b60b18e5"
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
