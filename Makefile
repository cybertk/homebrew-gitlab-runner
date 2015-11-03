test:
	# Setup
	cp gitlab-runner.rb $(shell brew --repository)/Library/Formula
	chmod 644 $(shell brew --repository)/Library/Formula/gitlab-runner.rb

	# Run tests
	brew reinstall gitlab-runner
	brew test gitlab-runner
	brew audit --strict --online gitlab-runner
