test:
	# Setup
	cp gitlab-runner.rb $(shell brew --repository)/Library/Formula
	chmod 644 $(shell brew --repository)/Library/Formula/gitlab-runner.rb

	# Run tests
	brew reinstall gitlab-runner
	brew test gitlab-runner
	brew audit --strict --online gitlab-runner

bottle:
	# Setup
	cp gitlab-runner.rb $(shell brew --repository)/Library/Formula
	chmod 644 $(shell brew --repository)/Library/Formula/gitlab-runner.rb

	# See https://github.com/Homebrew/homebrew/blob/master/share/doc/homebrew/Bottles.md
	brew install --build-bottle gitlab-runner
	brew bottle gitlab-runner
