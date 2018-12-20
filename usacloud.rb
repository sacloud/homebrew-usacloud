class Usacloud < Formula

  usacloud_version = "0.17.0"
  sha256_src_darwin = "633b0f4363de3b3ea1f28baa14154ab6be1766d3b813c73586700caa1736351f"
  sha256_src_linux = "5a54cf9217713e0ed8879adb6ae39ad2856ec3dd730b0b1b7b47898c288fdd84"
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
