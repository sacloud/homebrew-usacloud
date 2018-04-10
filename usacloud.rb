class Usacloud < Formula

  usacloud_version = "0.11.0"
  sha256_src_darwin = "9e3a371f8119544e2e612b1919b3dc203eea497f56acdfc5aba45781ea82d33e"
  sha256_src_linux = "24a89d7a52300eaf241fd2535ac848d0bdc7f786877c090971e969a02261c733"
  sha256_bash_completion = "f7455ad770debf5a06e170d423fc5b7b544184451a3d1112fd00ad184c9076ac"

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
