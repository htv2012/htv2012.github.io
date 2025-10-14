.PHONY: after check help notes repos tools

### How to use this Makefile
help:
	@which bat && bat README.md || cat README.md

### Install Tools
tools:
	sh install-tools.sh

### Install the git repositories
repos:
	sh install-repos.sh

### Check to see if there are tools we need, but not yet installed
check:
	python3 support/tools-check.py

### Create the setup.tar
tar:
	cd ..; \
	rm setup.tar; \
	tar -cf setup.tar setup/

### Show after-installation steps
notes:
	@which bat && bat support/after_setup_tasks.md || cat support/after_setup_tasks.md

