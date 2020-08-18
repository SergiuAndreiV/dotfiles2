# dotfiles2

## Installation

### Install Vim plugins from vim
1. Set up Vundle ( https://github.com/VundleVim/Vundle.vim )  
`git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim`

1. Install Plugins:  
Launch vim and run `:PluginInstall`

1. Copy `monokai.vim` color scheme to `~/.vim/` folder  
From this repository run:
    ```shell script
    cp -a .vim/. ~/.vim/
    ```

### Add Tmux plugin
https://jdhao.github.io/2019/01/17/tmux_plugin_management/


### ToDo

- [ ]  configure .vimrc for light use ( essential plugins )
    - [x] to navigate seamlessly between vim and tmux splits add this plugin https://github.com/christoomey/vim-tmux-navigator
- [ ]  add Ansible script for setting and configuring dot files
