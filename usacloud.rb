class Usacloud < Formula

  usacloud_version = "0.0.8"
  sha256_src = "1fa6feec89e0f0d815c3082c5315946b32ac7b001eca6b4a40ac71c14b8b89ae"
  sha256_bash_completion = "e4eba9bed59018176a39b8e33ea97c066ebd7344b80c2205920261e55498de45"

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
