class Usacloud < Formula

  usacloud_version = "0.0.9"
  sha256_src = "3c4564dd9c6e2b0fb469bf584633905b88b5d39fbe61fcc2b589e2fccbeed05c"
  sha256_bash_completion = "162eacf51913ef9057239a6e042846e0a6eef49b8d49ed1f404cb551c71cf4d8"

  desc "Unofficial 'sacloud' - CLI client of the SakuraCloud"
  homepage "https://github.com/sacloud/usacloud"
  url "https://github.com/sacloud/usacloud/releases/download/v#{usacloud_version}/usacloud_darwin-amd64.zip"
  sha256 sha256_src
  head "https://github.com/sacloud/usacloud.git"
  version usacloud_version

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
