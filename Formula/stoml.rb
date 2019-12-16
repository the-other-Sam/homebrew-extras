class Stoml < Formula
  desc "Simple TOML parser for Bash"
  homepage "https://github.com/freshautomations/stoml"
  url "https://github.com/freshautomations/stoml/archive/v0.4.0.tar.gz"
  sha256 "5b41845021181cf2e2204f9e30213d002ff2bc4c299a2b4edad1a9910e429546"

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
