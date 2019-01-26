class Usacloud < Formula

  usacloud_version = "0.18.0"
  sha256_src_darwin = "d51ccdef67ba4a2e3dca4d82654293db1906ddfffd5fd7e1f953db91e136ad8c"
  sha256_src_linux = "25dbd80a379f0bfaba56d4d611cebb7737c367038f06ea56cf7f3b761c7aa214"
  sha256_bash_completion = "20d441a4a0b23a65c87950bd38baf0cca1f7d71b270173f4895e7df44a9ddfe9"

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
