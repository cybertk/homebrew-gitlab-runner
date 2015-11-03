class GitlabRunner < Formula
  desc "The official GitLab CI runner written in Go"
  homepage "https://gitlab.com/gitlab-org/gitlab-ci-multi-runner"
  url "https://gitlab.com/gitlab-org/gitlab-ci-multi-runner/repository/archive.tar.gz?ref=v0.6.2"
  sha256 "4a384f5d4b9ea5241ddd7f8fa9b6c8d2d09da922622d87e536053170732ef5f5"

  head "https://gitlab.com/gitlab-org/gitlab-ci-multi-runner.git"

  version ("0.6.2")

  depends_on "go" => :build

  def install
    ENV["GOPATH"] = buildpath

    mkdir_p buildpath/"src/gitlab.com/gitlab-org"
    ln_sf buildpath, buildpath/"src/gitlab.com/gitlab-org/gitlab-ci-multi-runner"

    # gitlab-ci-multi-runner's deps is managed by godeps
    ENV.append_path "GOPATH", "#{buildpath}/Godeps/_workspace"

    cd "src/gitlab.com/gitlab-org/gitlab-ci-multi-runner" do
      # Copy from Makefile
      system "go", "build", "-o", "gitlab-runner", "-ldflags", "-X main.NAME=gitlab-runner -X main.VERSION=#{version} -X main.REVISION=HEAD"
      bin.install "gitlab-runner"
    end
  end

  test do
    assert_match "gitlab-runner version #{version} (HEAD)", shell_output("gitlab-runner --version")
  end
end
