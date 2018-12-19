class Usacloud < Formula

  usacloud_version = "0.16.4"
  sha256_src_darwin = "46eaa203a04d3cc04a3cac2ecf05327cde84ff10d8fa56313a4b2eac87fa3b54"
  sha256_src_linux = "4a5ac53ae7aa9e8351db37e78df60dec9541f38132413c19a3371f4add3b7e32"
  sha256_bash_completion = "3a5c1c47e524baf1cc666532fd7a2ef28849195a9ad0ec2aa2c037093f7b45c1"

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
