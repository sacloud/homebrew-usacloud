class Usacloud < Formula

  usacloud_version = "0.32.2"
  sha256_src_darwin = "165e09ea8b53625ff10f0279d8ce2ca78e116fc156d7f87889324b3fe8f94b86"
  sha256_src_linux = "fa97038d6f6bd325bb6cf3ad66f1c0a9ccea0c0700ab3927152f1a47eb1cd9dd"
  sha256_bash_completion = "59fe64fba4cd02dc101bf9b761cb404aa1245698edf193d090c41b2ff64d1627"

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
