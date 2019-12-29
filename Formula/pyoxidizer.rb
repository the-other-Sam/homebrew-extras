class Pyoxidizer < Formula
  desc "Modern Python application packaging and distribution tool"
  homepage "https://pyoxidizer.readthedocs.io/en/latest/index.html"
  url "https://github.com/indygreg/PyOxidizer/archive/v0.4.0.zip"
  head "https://github.com/indygreg/PyOxidizer.git", :using => :git
  bottle do
    cellar :any
    #sha256 "64fd79987eb5276eef4c58f0148244d71f2fa05a364c69030fdf60d3b259f689" => :catalina
  end
  
  #@name="pyoxidizer"
  #version "0.4.0"
  #sha256 "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"

  depends_on "rust" => :build

  def install
    system "cargo", "install", "--locked", "--root", prefix, "--path", "."
    #system "cargo", "install", "--root", "#{prefix}", "--version", "#{version}", "#{name}"
  end

  test do
    output = shell_output(bin/"pyoxidizer --version")
    assert_match "pyoxidizer version #{version} (HEAD)", output
  end
end
