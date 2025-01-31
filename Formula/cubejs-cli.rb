require "language/node"

class CubejsCli < Formula
  desc "Cube.js command-line interface"
  homepage "https://cube.dev/"
  url "https://registry.npmjs.org/cubejs-cli/-/cubejs-cli-0.31.54.tgz"
  sha256 "6f277a59ec1ccd50fbcb9d3b0e641c16cf4cd4090f2e1fb82cbf01d387d0dd6d"
  license "Apache-2.0"

  bottle do
    sha256 cellar: :any_skip_relocation, arm64_ventura:  "f7372b79357b6fa62c7f7408809d95d6df0ff2997a71ffbd6ace92b590521695"
    sha256 cellar: :any_skip_relocation, arm64_monterey: "f7372b79357b6fa62c7f7408809d95d6df0ff2997a71ffbd6ace92b590521695"
    sha256 cellar: :any_skip_relocation, arm64_big_sur:  "f7372b79357b6fa62c7f7408809d95d6df0ff2997a71ffbd6ace92b590521695"
    sha256 cellar: :any_skip_relocation, ventura:        "cebf10e9fee3cf4dd4e0c7d42501848ac049e08f6c32d0811d1fffb010580ee6"
    sha256 cellar: :any_skip_relocation, monterey:       "cebf10e9fee3cf4dd4e0c7d42501848ac049e08f6c32d0811d1fffb010580ee6"
    sha256 cellar: :any_skip_relocation, big_sur:        "cebf10e9fee3cf4dd4e0c7d42501848ac049e08f6c32d0811d1fffb010580ee6"
    sha256 cellar: :any_skip_relocation, x86_64_linux:   "f7372b79357b6fa62c7f7408809d95d6df0ff2997a71ffbd6ace92b590521695"
  end

  depends_on "node"

  def install
    system "npm", "install", *Language::Node.std_npm_install_args(libexec)
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/cubejs --version")
    system "cubejs", "create", "hello-world", "-d", "postgres"
    assert_predicate testpath/"hello-world/schema/Orders.js", :exist?
  end
end
