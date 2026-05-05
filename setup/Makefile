.PHONY: after check help notes repos tools

help:
	@which bat && bat README.md || cat README.md

tools:
	sh install-tools.sh

repos:
	sh install-repos.sh

check:
	python3 support/tools-check.py

tar:
	cd ..; \
	rm setup.tar; \
	tar -cf setup.tar setup/

notes:
	@which bat && bat support/after_setup_tasks.md || cat support/after_setup_tasks.md

