class Usacloud < Formula

  usacloud_version = "0.3.1"
  sha256_src_darwin = "0036c34e3190836f244dc45faf5e3c4542366945bf2119c8ba57e908b191237a"
  sha256_src_linux = "d38ecb053e7fa3dea4bd1a4476641e908fccd85e28043c4656d906dbcf8ff41b"
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
