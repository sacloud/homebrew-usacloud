class Usacloud < Formula

  usacloud_version = "0.27.1"
  sha256_src_darwin = "a9d2e4c077032cc866a0e72377125b2ed494f7b01d274faa2c4f4257e5b55242"
  sha256_src_linux = "8c3bd53557e1415042ec3a8cbd0fac02740922f9c42babcc886a6e2f09fba09f"
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
