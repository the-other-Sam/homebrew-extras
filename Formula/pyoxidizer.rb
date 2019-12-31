class Pyoxidizer < Formula
  desc "Modern Python application packaging and distribution tool"
  homepage "https://pyoxidizer.readthedocs.io/en/latest/index.html"
  url "https://github.com/indygreg/PyOxidizer/archive/v0.4.0.tar.gz"
  sha256 "73f948c3b6e810f2cc1d241bab85bfc804166780e73f2935aed837d2644dbe11"
  head "https://github.com/indygreg/PyOxidizer.git", :using => :git
  bottle do
    cellar :any_skip_relocation
    root_url "https://dl.bintray.com/the-other-sam/bottles-homebrew-extras"
    sha256 "6bef489b28c89e379b8870296e229daf2e3e4ae6e1dbd6a5bc3584aea2d3105e" => :catalina
    sha256 "cc0e2f4bd2f416a29f040de9f55528536191e101e0f64885713bffceeab5501d" => :x86_64_linux
  end
  
  option "OPENSSL_STATIC=1"
  depends_on "rust" => :build

  def install
    system "cargo", "install", "--all-features", "--locked", "--root", prefix, "--version", version, name
  end

  test do
    output = shell_output(bin/"pyoxidizer --version")
    assert_match "pyoxidizer version #{version} (HEAD)", output
  end
end
