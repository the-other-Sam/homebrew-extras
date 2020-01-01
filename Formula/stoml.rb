class Stoml < Formula
  desc "Simple TOML parser for Bash"
  homepage "https://github.com/freshautomations/stoml"
  url "https://github.com/freshautomations/stoml/archive/v0.4.0.tar.gz"
  sha256 "5b41845021181cf2e2204f9e30213d002ff2bc4c299a2b4edad1a9910e429546"
  head "https://github.com/freshautomations/stoml.git", :using => :git
  bottle do
    cellar :any_skip_relocation
    root_url "https://dl.bintray.com/the-other-sam/bottles-homebrew-extras"
    sha256 "4997b8f58051174113ed313801ec0c31ed3ad1f0f741c0f5196974e0fb167d6a" => :catalina
    sha256 "35fd506a079371eb992ca54a393ad14aaf86ecb96cfc6c31346c6f03104a6837" => :x86_64_linux
  end
  depends_on "go" => :build

  def install
    mkdir_p buildpath/"src/github.com/freshautomations"
    ln_s buildpath, buildpath/"src/github.com/freshautomations/stoml"
    ENV["GOPATH"] = "#{buildpath}/Godeps/_workspace:#{buildpath}"
    # Language::Go.stage_deps resources, buildpath/"src"
    system "go", "build", "-o", "stoml"
    bin.install "stoml"
  end

  test do
    output = shell_output(bin/"stoml --version")
    assert_match "stoml version #{version} (HEAD)", output
  end
end
