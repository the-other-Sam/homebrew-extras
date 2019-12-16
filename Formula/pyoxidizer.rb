class Pyoxidizer < Formula
  desc "Modern Python application packaging and distribution tool"
  homepage "https://pyoxidizer.readthedocs.io/en/latest/index.html"
  url "file:///dev/null"
  @name="pyoxidizer"
  version "0.4.0"
  sha256 "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"

  depends_on "rust" => :build

  def install
    system "cargo", "install", "--root", "#{prefix}", "--version", "#{version}", "#{name}"
  end

  test do
    output = shell_output(bin/"pyoxidizer --version")
    assert_match "pyoxidizer version #{version} (HEAD)", output
  end
end
