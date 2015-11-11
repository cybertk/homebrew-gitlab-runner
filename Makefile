FORMULA = gitlab-ci-multi-runner

test:
	# Setup
	cp $(FORMULA).rb $(shell brew --repository)/Library/Formula
	chmod 644 $(shell brew --repository)/Library/Formula/$(FORMULA).rb

	# Run tests
	brew reinstall $(FORMULA)
	brew test $(FORMULA)
	brew audit --strict --online $(FORMULA)
