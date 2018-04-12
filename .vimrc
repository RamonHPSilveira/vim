set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
"set rtp+=$GOPATH/src/github.com/golang/lint/misc/vim
set clipboard=unnamed
set number " Show current line number
set tabstop=4
set shiftwidth=4
set expandtab
set ruler
set backspace=2
set hlsearch
set showcmd

set wildmenu
set cursorline
set ignorecase
set smartcase	"When use uppercase it will not ignorecase froms search
set lbr 	"no break words when line ends
set ai		"auto indent
set si		"smart ident
set scrolloff=10 "number of lines on edges

"set bg=dark
"set bg=light

" set t_Co=256
"######################################
"map KEY KEYSTROKES

" \ key commands..
"let mapleader= (put key around string)
"map <leader> ...  (\)

map <leader>a <Esc>A;<Esc>
nnoremap <leader>c <Esc>f)a<space>{<Enter>}<Esc>O
nnoremap <leader>C <Esc>f)a<space>=><space>{<Enter>}<Esc>O
nnoremap <leader>tn <Esc>$<Enter>i.then( function () {<Enter>});<Esc>k2f(a
nnoremap <leader>tc <Esc>$<Enter>i.then( function () {<Enter>}).catch( function () {<Enter>});<Esc>2k2f(a
nnoremap <leader>f <Esc>i function () {<Enter>};<Esc>2k/function<CR>:noh<Enter>f(
nnoremap <leader>F <Esc>i () => {<Enter>};<Esc>kf=3h
nnoremap <leader>n <Esc>:cn<Enter>
nnoremap <leader>b <Esc>:cp<Enter>
nnoremap <leader>oo <Esc>:copen<Enter>
nnoremap <leader>oc <Esc>:cclose<Enter>
nnoremap <leader>g :vimgrep <cword> **/*.js<CR>
nnoremap <leader>p :e #<Enter>
nnoremap gr :vimgrep <cword> **/*.js<CR>
inoremap jk <esc>

imap <F3> app.post('', require('../middlewares/auth'), function(req, res){<Enter>}); 
imap <F2> app.get('', require('../middlewares/auth'), function(req, res){<Enter>});
imap <F4> app.put('', require('../middlewares/auth'), function(req, res){<Enter>});
imap <F5> try{<Enter>}catch(err){<Enter>}
imap <leader>t <Esc>f)a.then(function(data){<Enter>}).catch(function (err){<Enter>});<Esc>kO
imap <leader>T <Esc>f)a.then((data) => {<Enter>}).catch((err) => {<Enter>});<Esc>kO
imap <leader>c console.log();<Esc>F(a"
imap <leader>p <Esc>pa

"######################################

set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/node_modules/*,*/bower_components/*

let g:fuzzy_ignore = "*.png;*.PNG;*.JPG;*.jpg;*.GIF;*.gif;vendor/**;coverage/**;tmp/**;rdoc/**;node_modules/**"

call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
" plugin from http://vim-scripts.org/vim/scripts.html

Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'AutoComplPop'
Plugin 'scrooloose/nerdtree'
Plugin 'mileszs/ack.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
Plugin 'othree/html5.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'alvan/vim-closetag'
Plugin 'pangloss/vim-javascript'
Plugin 'dracula/vim'
Plugin 'szorfein/darkest-space'
Plugin 'flazz/vim-colorschemes'
Plugin 'tpope/vim-surround'
Plugin 'Townk/vim-autoclose'

"Plugin 'mxw/vim-jsx'
"Plugin 'fatih/vim-go'
"Plugin 'elubow/cql-vim'
"Plugin 'posva/vim-vue'


" filetype on
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" Fugitive shortcuts
nnoremap <silent> <leader>gs :Gstatus<CR>
nnoremap <silent> <leader>gd :Gdiff<CR>
nnoremap <silent> <leader>gc :Gcommit<CR>
nnoremap <silent> <leader>gb :Gblame<CR>
nnoremap <silent> <leader>gl :Glog<CR>
nnoremap <silent> <leader>gp :Git push<CR>
nnoremap <silent> <leader>gr :Gread<CR>
nnoremap <silent> <leader>gw :Gwrite<CR>
nnoremap <silent> <leader>ge :Gedit<CR>
" Mnemonic _i_nteractive
nnoremap <silent> <leader>gi :Git add -p %<CR>
nnoremap <silent> <leader>gg :SignifyToggle<CR>
nnoremap <C-d> :sh<cr>
nnoremap <C-I> :noh<cr>
inoremap ç <Esc>
"not working
"nmap gx yiw/^\(sub\<Bar>function\)\s\+<C-R>"<CR>
"nmap gx mryiw/^\(sub\<Bar>function\)\s\+<C-R>"<CR>

" Remove trailing white spacing in the file
function! CustomStripWhitespace()
  if has("persistent_undo") && !empty(@%)
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")

    %s/\s\+$//e
    exe "w"

    " clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
  endif
endfunction

" Always remove the whistespace if the following command is used
command! W call CustomStripWhitespace()
let g:jsx_ext_required=0 " Allow JSX in normal JS files
let g:closetag_filenames = "*.html,*.xhtml,*.phtml"

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
autocmd BufWritePost,FileWritePost *.go execute 'Lint' | cwindow

map <C-k> :NERDTreeToggle<CR>
filetype plugin indent on
colorscheme Benokai
"colorscheme ubaryd
"color dracula
"colorscheme darkest-space
syntax on
