
" ========================================================================
" Vundle stuff
" ======================================================================== 
set nocompatible " Required by vundle 
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" My bundles
Bundle 'christoomey/vim-tmux-navigator'
Plugin 'ervandew/supertab'
Plugin 'skwp/greplace.vim'
Plugin 'tomtom/tcomment_vim'
Plugin 'tpope/vim-bundler'
Plugin 'tpope/vim-dispatch'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-unimpaired'
Plugin 'maksimr/vim-jsbeautify'
Plugin 'nvie/vim-flake8'
Plugin 'nanotech/jellybeans.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'mattn/emmet-vim'
Plugin 'pangloss/vim-javascript'
Bundle 'jistr/vim-nerdtree-tabs'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

syntax on  " Enable syntax highlighting

autocmd FileType python set sw=4
autocmd FileType python set ts=4
autocmd FileType python set sts=4

augroup myfiletypes
  " Clear old autocmds in group
  autocmd!
  " autoindent with 4 spaces in python"
  autocmd FileType python setlocal ai sw=4 sts=4 et
  autocmd FileType javascript setlocal ai sw=4 sts=4 et
  " autocmd FileType html setlocal ai sw=4 sts=4 et
  autocmd FileType htmldjango setlocal ai sw=4 sts=4 et
  autocmd FileType html setlocal ai sw=4 sts=4 et
  autocmd FileType css setlocal ai sw=4 sts=4 et

  " autoindent with two spaces, always expand tabs
  autocmd FileType ruby,eruby,yaml setlocal ai sw=4 sts=4 et
  autocmd FileType ruby,eruby,yaml setlocal path+=lib
  autocmd FileType ruby,eruby,yaml setlocal colorcolumn=80
  " Make ?s part of words
  autocmd FileType ruby,eruby,yaml setlocal iskeyword+=?

  " Clojure
  autocmd FileType clojure setlocal colorcolumn=80
  autocmd FileType clojure map <Leader>t :!lein test<cr>
augroup END

" Enable built-in matchit plugin
runtime macros/matchit.vim
" ===============


" Set up vertical vs block cursor for insert/normal mode
if &term =~ "screen."
  let &t_ti.="\eP\e[1 q\e\\"
  let &t_SI.="\eP\e[5 q\e\\"
  let &t_EI.="\eP\e[1 q\e\\"
  let &t_te.="\eP\e[0 q\e\\"
else
  let &t_ti.="\<Esc>[1 q"
  let &t_SI.="\<Esc>[5 q"
  let &t_EI.="\<Esc>[1 q"
  let &t_te.="\<Esc>[0 q"
endif


" emmet leader key
let g:user_emmet_leader_key='<C-M>'
" ================

let mapleader = ","

" ================
" personal maps
" ================
cmap w!! w !sudo tee > /dev/null %
inoremap ( ()<esc>i
inoremap [ []<esc>i
inoremap { {}<esc>i
inoremap " ""<esc>i
inoremap ' ''<esc>i
inoremap <CR> <CR><esc>O
" nmap <C-j> 5j
" nmap <C-k> 5k
map <Leader>sov :so ~/.vimrc<cr>

map <Leader>fh :call HtmlBeautify()<cr>
map <Leader>bu :!python3 %<cr>
map <Leader>buf :!python3 % < @input.txt<cr>
map <Leader>sot :!tmux source-file ~/.tmux.conf<cr>

" vmap <Leader>xml :!xmllint --format -<cr>
map <Leader>xml ggVG:!xmllint --format -<cr>

" map <C-f> :call JsBeautify()<cr>
nnoremap <C-d> 7j
nnoremap <C-u> 7k
vnoremap <C-c> "+y
inoremap <C-v> <esc>"+pa
nnoremap <C-b> <C-v>
" nnoremap <C-v> "+p

vnoremap <silent> s //e<C-r>=&selection=='exclusive'?'+1':''<CR><CR>
      \:<C-u>call histdel('search',-1)<Bar>let @/=histget('search',-1)<CR>gv
omap s :normal vs<CR>


map <F2> :set wrap!<CR>

" Keep fingers close to home row
map <F3> :tabprevious<CR>
map <F4> :tabnext<CR>
nmap <C-i> :tabprevious<CR>
nmap <C-p> :tabnext<CR>
imap <C-i> <esc>:tabprevious<CR>
imap <C-p> <esc>:tabnext<CR>

map <C-n> <plug>NERDTreeTabsToggle<cr>
map <Leader>vi :tabe ~/.vimrc<CR>
map <Leader>w <C-w>w

" Test python3 with input.txt file in the same directory
" ToDo =============
" check if file input.txt exist, if not present create and open in split
" for edit
function! BuildWithFile()
  let curentFilePath = expand('%:p')
  let testFilePath = expand('%:p:h')
  " exec ":!echo  function is working"
  " exec ':!python3 ' . curentFilePath . ' < input.txt'
  exec ':!python3 ' . curentFilePath . ' < ' . testFilePath . '/input.txt'
  redraw!
endfunction
map <Leader>tp :call BuildWithFile()<cr>

" Edit another file in the same directory as the current file
" uses expression to extract path from current file's path
map <Leader>te :tabedit <C-R>=escape(expand("%:p:h"),' ') . '/'<CR>
map <Leader>e :e <C-R>=escape(expand("%:p:h"),' ') . '/'<CR>
map <Leader>s :split <C-R>=escape(expand("%:p:h"), ' ') . '/'<CR>
map <Leader>v :vnew <C-R>=escape(expand("%:p:h"), ' ') . '/'<CR>

map <Leader>h :set hls!<cr>
" imap <C-l> :<Space>

" Note that remapping C-s requires flow control to be disabled
" (e.g. in .bashrc or .zshrc)
map <C-s> <esc>:w<CR>
imap <C-s> <esc>:w<CR>
map <C-t> <esc>:tabnew<CR>
" map <C-x> <C-w>c

" Emacs-like beginning and end of line.
imap <c-e> <c-o>$
imap <c-a> <c-o>^

"======================================================================"
" set statusline+=%F
set scroll=0
set scrolloff=3
set mouse=a
set backspace=indent,eol,start " allow backspacing over everything in insert mode
set history=500		" keep 500 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set showmatch
set nowrap
" set directory=~/.tmp " Don't clutter my dirs up with swp and tmp files
" set directory^=$HOME/.vim/tmp//
set autoread
set viminfo+=!
set guioptions-=T
set guifont=Triskweline_10:h10
set et
set sw=2
set smarttab
" set noincsearch
set incsearch
set ignorecase smartcase
set laststatus=2  " Always show status line.
" Relative line number from current block position"
" set relativenumber
set number
set gdefault " assume the /g flag on :s substitutions to replace all matches in a line
set autoindent " always set autoindenting on
set bg=light
set lazyredraw " Don't redraw screen when running macros.

" Set the tag file search order
set tags=./tags;

" Use Silver Searcher instead of grep
set grepprg=ag

" Make the omnicomplete text readable
highlight PmenuSel ctermfg=black

" Ignore stuff that can't be opened
set wildignore+=tmp/**

set shiftround " When at 3 spaces and I hit >>, go to 4, not 5.

set nofoldenable " Say no to code folding...

command! Q q " Bind :Q to :q
command! Qall qall
command! QA qall
command! E e
command! W w
command! Wq wq


" Execute macro in q
map Q @q

" Disable K looking stuff up
map K <Nop>

au BufNewFile,BufRead *.txt setlocal nolist " Don't display whitespace

" Better? completion on command line
set wildmenu

" What to do when I press 'wildchar'. Worth tweaking to see what feels right.
set wildmode=list:full

" (Hopefully) removes the delay when hitting esc in insert mode
set noesckeys
set ttimeout
set ttimeoutlen=1

" Turn on spell-checking in markdown and text.
" au BufRead,BufNewFile *.md,*.txt setlocal spell

" Merge a tab into a split in the previous window
function! MergeTabs()
  if tabpagenr() == 1
    return
  endif
  let bufferName = bufname("%")
  if tabpagenr("$") == tabpagenr()
    close!
  else
    close!
    tabprev
  endif
  split
  execute "buffer " . bufferName
endfunction

nmap <C-W>u :call MergeTabs()<CR>

function! SearchForCallSitesCursor()
  let searchTerm = expand("<cword>")
  call SearchForCallSites(searchTerm)
endfunction

" Search for call sites for term (excluding its definition) and
" load into the quickfix list.
function! SearchForCallSites(term)
  cexpr system('ag ' . shellescape(a:term) . '\| grep -v def')
endfunction

" Make CtrlP use ag for listing the files. Way faster and no useless files.
let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
let g:ctrlp_use_caching = 0

inoremap <Tab> <C-P>

" Let's be reasonable, shall we?
nmap k gk
nmap j gj

let g:CommandTMaxHeight=50
let g:CommandTMatchWindowAtTop=1


" Don't wait so long for the next keypress (particularly in ambigious Leader
" situations.
set timeoutlen=300


" Set gutter background to black
highlight SignColumn ctermbg=black

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" RENAME CURRENT FILE (thanks Gary Bernhardt)
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! RenameFile()
  let old_name = expand('%')
  let new_name = input('New file name: ', expand('%'), 'file')
  if new_name != '' && new_name != old_name
    exec ':saveas ' . new_name
    exec ':silent !rm ' . old_name
    redraw!
  endif
endfunction
map <Leader>r :call RenameFile()<cr>


" Display extra whitespace
set list listchars=tab:»·,trail:·

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" Make it more obvious which paren I'm on
hi MatchParen cterm=none ctermbg=black ctermfg=202

" Status line color
" hi StatusLine cterm=none ctermbg=black ctermfg=202

" By default, vim thinks .md is Modula-2.
autocmd BufNewFile,BufReadPost *.md set filetype=markdown

" rdf file as XML syntax higlight
autocmd BufNewFile,BufReadPost *.rdf set filetype=xml

" Set to xml"
" autocmd BufNewFile,BufReadPost *.xml set filetype=xml

" Without this, vim breaks in the middle of words when wrapping
autocmd FileType markdown setlocal nolist wrap lbr

" Wrap the quickfix window
autocmd FileType qf setlocal wrap linebreak

" for javascript
autocmd FileType javascript noremap <buffer>  <c-f> :call JsBeautify()<cr>

" for json
autocmd FileType json noremap <buffer> <c-f> :call JsonBeautify()<cr>

" for jsx
autocmd FileType jsx noremap <buffer> <c-f> :call JsxBeautify()<cr>

" for html
autocmd FileType html noremap <buffer> <c-f> :call HtmlBeautify()<cr>
"
" for jinja_html
autocmd FileType htmldjango noremap <buffer> <c-f> :call HtmlBeautify()<cr>

" for css or scss
autocmd FileType css noremap <buffer> <c-f> :call CSSBeautify()<cr>

" visual mode"
autocmd FileType javascript vnoremap <buffer>  <c-f> :call RangeJsBeautify()<cr>
autocmd FileType json vnoremap <buffer> <c-f> :call RangeJsonBeautify()<cr>
autocmd FileType jsx vnoremap <buffer> <c-f> :call RangeJsxBeautify()<cr>
autocmd FileType html vnoremap <buffer> <c-f> :call RangeHtmlBeautify()<cr>
autocmd FileType css vnoremap <buffer> <c-f> :call RangeCSSBeautify()<cr>


" Make it more obviouse when lines are too long
highlight ColorColumn ctermbg=239

" Background color
highlight Normal ctermbg=235

" visual selection color
highlight Visual ctermbg=238

" Search highlight "
highlight Search ctermbg=242 ctermfg=251
" highlight lCursor ctermbg=044 ctermfg=269

" ============================================================
" End of things set by me.
" ========================================================================

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
    au!

    " When editing a file, always jump to the last known cursor position.
    " Don't do it when the position is invalid or when inside an event handler
    " (happens when dropping a file on gvim).
    autocmd BufReadPost *
          \ if line("'\"") > 0 && line("'\"") <= line("$") |
          \   exe "normal g`\"" |
          \ endif

  augroup END

endif " has("autocmd")

function! PhpSyntaxOverride()
  hi! def link phpDocTags  phpDefine
  hi! def link phpDocParam phpType
endfunction

augroup phpSyntaxOverride
  autocmd!
  autocmd FileType php call PhpSyntaxOverride()
augroup END

hi User1 cterm=inverse ctermbg=114   ctermfg=238  guibg=red   guifg=blue
hi User2 cterm=inverse ctermbg=226 ctermfg=black  guibg=Grey93 guifg=black
hi User3 ctermbg=blue  ctermfg=green guibg=blue  guifg=green

function! SubstituteHomePath()
  " redraw
  " let l:mode = mode()
  " if     mode ==# "n"  | exec 'hi User1 '.g:NeatStatusLine_color_normal  | return "NORMAL"
  " else                 | return l:mode
  " endif

  " if tabpagenr() == 1
  "     return
  " endif

  let fullpath=strpart(expand("%:p:h"), strlen($HOME) )
  return "~" . fullpath
endfunc

" nmap <C-S-o> :!cd $SHELL
" nmap <C-S-o> :
set statusline=
set statusline+=%<                       " cut at start
set statusline+=%1*  "switch to User1 highlight
set statusline+=%{SubstituteHomePath()}   "full filename
set statusline+=/%2*  "switch to User2 highlight
set statusline+=%t   "tail path > filename.ext
set statusline+=%1*  "switch to User1 highlight
set statusline+=%=   "filetype
set statusline+=%1*  "switch to User3 highlight
set statusline+=%-10.(%l,%c%V%)\ %<%P        " offset

" color desert
colorscheme monokai

