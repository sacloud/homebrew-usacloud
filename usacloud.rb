class Usacloud < Formula

  usacloud_version = "0.0.10"
  sha256_src_darwin = "2dd55e17c46992d5da2d6fc59eaa7d0d5de0812c08b2f8023863adc021095745"
  sha256_src_linux = "d624d57202926f391cd2258ce2294cb2d28563feb5bd3f451a9447c3c94536d7"
  sha256_bash_completion = "162eacf51913ef9057239a6e042846e0a6eef49b8d49ed1f404cb551c71cf4d8"

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
