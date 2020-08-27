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
   
 ### Ansible configuration and installation
1. First check pip that it is installed 
     ```shell script
    pip3 --version
    ```

    If we get an error we can install using `apt`
     ```shell script
    sudo apt install python3-pip
    ```
1. Install `ansible`
    ```shell script
    pip install ansible
    ```
   or to install ansible on Ubuntu use this:
   ```shell script
    $ sudo apt update
    $ sudo apt install software-properties-common
    $ sudo apt-add-repository --yes --update ppa:ansible/ansible
    $ sudo apt install ansible
    ```
   link to ansible documentation https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html#installing-ansible-on-ubuntu

### Add Tmux plugin
https://jdhao.github.io/2019/01/17/tmux_plugin_management/


### ToDo

- [x]  configure .vimrc for light use ( essential plugins )
    - [x] to navigate seamlessly between vim and tmux splits add this plugin https://github.com/christoomey/vim-tmux-navigator
- [ ]  add Ansible playbook for setting and configuring dot files
