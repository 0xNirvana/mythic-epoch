# Epoch Makefile

.PHONY: help install start stop logs shell clean test

MYTHIC_DIR ?= $(HOME)/Mythic
REPO_ROOT := $(abspath $(CURDIR)/../..)

help:
	@echo "Epoch - Google Calendar Dead Drop C2 Profile"
	@echo ""
	@echo "Available targets:"
	@echo "  install   - Install Epoch into Mythic (local repo folder)"
	@echo "  start     - Start Epoch container"
	@echo "  stop      - Stop Epoch container"
	@echo "  logs      - View Epoch container logs"
	@echo "  shell     - Open shell in Epoch container"
	@echo "  clean     - Remove OAuth tokens and cached data"
	@echo "  test      - Run protocol unit tests"

install:
	@echo "[*] Installing Epoch from $(REPO_ROOT)..."
	cd "$(MYTHIC_DIR)" && sudo ./mythic-cli install folder "$(REPO_ROOT)"
	@echo "[+] Epoch installed!"

start:
	@echo "[*] Starting Epoch..."
	cd "$(MYTHIC_DIR)" && sudo ./mythic-cli start epoch
	@echo "[+] Epoch started!"

stop:
	@echo "[*] Stopping Epoch..."
	cd "$(MYTHIC_DIR)" && sudo ./mythic-cli stop epoch
	@echo "[+] Epoch stopped!"

logs:
	@echo "[*] Viewing Epoch logs..."
	sudo docker logs -f epoch

shell:
	@echo "[*] Opening shell in Epoch container..."
	sudo docker exec -it epoch /bin/bash

clean:
	@echo "[*] Cleaning OAuth tokens and cache..."
	sudo docker exec -it epoch rm -f /Mythic/c2_code/token.pickle
	sudo docker exec -it epoch rm -rf /Mythic/c2_code/__pycache__
	@echo "[+] Cleaned!"

test:
	python3 -m unittest discover -s "$(REPO_ROOT)/tests" -p "test_*.py" -v
