class Usacloud < Formula

  usacloud_version = "0.3.1"
  sha256_src_darwin = "3c6b7ea9def03f85530d22911b4dba3dd7fe8a5376a2ee1004c1a315cd234e5a"
  sha256_src_linux = "b75b2b1dc346ba320f1f9a5716b18733e8f3d6674c5754717752f867b2513b46"
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
