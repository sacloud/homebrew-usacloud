class Usacloud < Formula

  usacloud_version = "0.6.0"
  sha256_src_darwin = "3ff0fe46bdc609de1b6ee648553de5ee58eaf2d83adb19de3f131be91bcbf98b"
  sha256_src_linux = "cd5f7f2b2d08b2f09b7f6c755d2985d8ac1c5fa48a87d10397c62eb2d5e0462b"
  sha256_bash_completion = "17e922d8cc8bf26454b5e4d5419a2c30e1e72e9fbd8b9412fa5d5c9022551977"

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
