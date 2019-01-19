SHELL := /bin/bash


setup-nvim:
    curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    nvim +PlugInstall +PlugUpgrade +qa


setup-local-development:
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

    brew tap d12frosted/emacs-plus
    brew install neovim tmux emacs-plus git jq tree python erlang awscli stack
    ln -s /usr/local/opt/emacs-plus/Emacs.app /Applications

    curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.34.0/install.sh | bash
