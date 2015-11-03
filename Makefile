test:
	cp gitlab-runner.rb $(shell brew --repository)/Library/Formula
	chmod 644 $(shell brew --repository)/Library/Formula/gitlab-runner.rb
	brew test gitlab-runner
	brew audit --strict --online gitlab-runner
