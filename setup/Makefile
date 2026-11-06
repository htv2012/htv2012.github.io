.PHONY: after check help after repos tools

help:
	@which bat && bat README.md || cat README.md

repos:
	sh repos.sh

check:
	python3 find_missing.py

after:
	@which bat && bat support/after_setup_tasks.md || cat support/after_setup_tasks.md

setup:
	python3 support/create_download_script.py > ../setup.sh
