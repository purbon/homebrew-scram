class Scram < Formula
  desc "Probabilistic Risk Analysis Tool"
  homepage "https://scram-pra.org"
  # Needs to pull submodules to get the customized Tango iconset for Mac.
  url "https://github.com/rakhimov/scram.git",
    :revision => "9c9a75ca0c5c2fbb5b4a7d32e29fd25bf90f7bab",
    :tag => "0.16.2"

  head "https://github.com/rakhimov/scram.git"

  #needs :cxx14

  depends_on "cmake" => :build
  depends_on "boost"
  depends_on "libxml2"
  depends_on "qt"
  depends_on "gperftools" => :recommended

  def install
    mkdir "build" do
      system "cmake", "..", *std_cmake_args
      system "make", "install"
    end
  end

  test do
    system "#{bin}/scram", "--help"
    system "#{bin}/scram", "--version"
  end
end
