# Alacritty fonts should in all propability be set up first

# Zsh {{{
yay -S pure
# }}}

# Vim {{{
mkdir -p ~/.vim/autoload ~/.vim/bundlle && \
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

git clone https://github.com/vim-airline/vim-airline ~/.vim/bundle/vim-airline
git clone https://github.com/scrooloose/nerdtree.git  ~/.vim/bundle/nerdtree
git clone https://github.com/SirVer/ultisnips  ~/.vim/bundle/ultisnips
git clone https://github.com/arcticicestudio/nord-vim.git  ~/.vim/bundle/nord-vim
git clone https://github.com/lervag/vimtex ~/.vim/bundle/vimtex

cp ./.vim/vimrc ~/.vim/vimrc
# }}}


