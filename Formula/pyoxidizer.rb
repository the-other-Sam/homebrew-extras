class Pyoxidizer < Formula
  desc "Modern Python application packaging and distribution tool"
  homepage "https://pyoxidizer.readthedocs.io/en/latest/index.html"
  url "https://github.com/indygreg/PyOxidizer/archive/v0.4.0.tar.gz"
  sha256 "73f948c3b6e810f2cc1d241bab85bfc804166780e73f2935aed837d2644dbe11"
  head "https://github.com/indygreg/PyOxidizer.git", :using => :git
  bottle do
    cellar :any_skip_relocation
    root_url "https://dl.bintray.com/the-other-sam/bottles-homebrew-extras"
    sha256 "a2e2815d88798c5a3e0975d5de4c7210968ea97cbe2560f3c5bc1347b705589e" => :catalina
  end
  
  option "OPENSSL_STATIC=1"
  depends_on "rust" => :build

  def install
    system "cargo", "install", "--lib", "--locked", "--root", prefix, "--version", version, name
  end

  test do
    output = shell_output(bin/"pyoxidizer --version")
    assert_match "pyoxidizer version #{version} (HEAD)", output
  end
end
