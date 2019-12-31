class Pyoxidizer < Formula
  desc "Modern Python application packaging and distribution tool"
  homepage "https://pyoxidizer.readthedocs.io/en/latest/index.html"
  url "https://github.com/indygreg/PyOxidizer/archive/v0.4.0.tar.gz"
  sha256 "73f948c3b6e810f2cc1d241bab85bfc804166780e73f2935aed837d2644dbe11"
  head "https://github.com/indygreg/PyOxidizer.git", :using => :git
  
  depends_on "rust" => :build

  def install
    system "cargo", "install", "--root", prefix, "--version", version, "."
  end

  test do
    output = shell_output(bin/"pyoxidizer --version")
    assert_match "pyoxidizer version version (HEAD)", output
  end
end
