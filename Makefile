SHELL := /bin/bash
.DEFAULT_GOAL := help


.PHONY: setup-nvim
setup-nvim: ## install NeoVim, its plugins and coc extensions
	brew install --HEAD neovim
	curl -fLo ~/.config/nvim/autoload/plug.vim \
		--create-dirs \
		https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	nvim +PlugInstall \
		+PlugUpgrade \
		"+CocInstall coc-snippets coc-css coc-html coc-json coc-python coc-tsserver coc-sh" \
		+qa


.PHONY: setup-haskell
setup-haskell: ## install GHC, cabal-install and Stack
	curl https://get-ghcup.haskell.org -sSf | sh
	curl -sSL https://get.haskellstack.org/ | sh
	git clone https://github.com/haskell/haskell-ide-engine --recurse-submodules
	cd haskell-ide-engine && stack ./install.hs cabal-build-all


.PHONY: setup-python
setup-python: ## install Python and its goodies
	brew install pyenv
	pip install "python-language-server[all]"


.PHONY: setup-npm
setup-npm: ## install stable version of npm and node
	curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh | bash
	nvm install stable
	nvm use stable


.PHONY: setup-local-development
setup-local-development: ## setup local development
	/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
	brew install tmux git jq tree pyenv awscli
	$(MAKE) setup-nvim
	$(MAKE) setup-npm
	$(MAKE) setup-python
	$(MAKE) setup-haskell


.PHONY: help
help: ## show this help message
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##//'
