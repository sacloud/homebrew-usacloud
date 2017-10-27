class Usacloud < Formula

  usacloud_version = "0.3.0"
  sha256_src_darwin = "73ce0418edd6c6b3e291973ac31d0ac25b342056ebc325cf7cfbec62ed50c45d"
  sha256_src_linux = "4f77897bfcbc72e5d062519b4a367f70fedb6d8d692980e3dd2742c431372a8d"
  sha256_bash_completion = "3b2b3e6f3136a842659939f4055e7c98ab6fc24d0ca3aa495f25e2db46df7ee1"

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
    url "http://releases.usacloud.jp/usacloud/contrib/completion/bash/usacloud"
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
