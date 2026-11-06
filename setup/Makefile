.PHONY: after check help notes repos tools

help:
	@which bat && bat README.md || cat README.md

repos:
	sh install-repos.sh

check:
	python3 find_missing.py

notes:
	@which bat && bat support/after_setup_tasks.md || cat support/after_setup_tasks.md

