class Stemplate < Formula
  desc "Simple template parser for Bash"
  homepage "https://github.com/freshautomations/stemplate"
  url "https://github.com/freshautomations/stemplate/archive/v0.6.1.tar.gz"
  sha256 "17f27ca2cd03b3f5d8875437497ec2bb6370f5a858f5c38680c57c1e6ea316cd"

  depends_on "go" => :build

  def install
    mkdir_p buildpath/"src/github.com/freshautomations"
    ln_s buildpath, buildpath/"src/github.com/freshautomations/stemplate"
    ENV["GOPATH"] = "#{buildpath}/Godeps/_workspace:#{buildpath}"
    # Language::Go.stage_deps resources, buildpath/"src"
    system "go", "build", "-o", "stemplate"
    bin.install "stemplate"
  end

  test do
    output = shell_output(bin/"stemplate --version")
    assert_match "stemplate version #{version} (HEAD)", output
  end
end