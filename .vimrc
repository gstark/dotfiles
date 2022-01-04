" Of course
set nocompatible

" Colorize all the things
set t_Co=256

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'jonathanfilip/vim-lucius'
Plugin 'gmarik/vundle'
Plugin 'mileszs/ack.vim'
Plugin 'vim-scripts/mru.vim'
Plugin 'tpope/vim-commentary'
Plugin 'scrooloose/nerdtree'
Plugin 'tsaleh/vim-align'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-markdown'
Plugin 'slim-template/vim-slim'
Plugin 'airblade/vim-gitgutter'
" Plugin 'powerline/powerline', {'rtp': 'powerline/bindings/vim/'}
Plugin 'vim-airline/vim-airline'
Plugin 'bronson/vim-trailing-whitespace'
Plugin 'mattn/emmet-vim'
Plugin 'vim-scripts/loremipsum'
Plugin 'w0rp/ale'
Plugin 'ngmy/vim-rubocop'
Plugin 'kana/vim-textobj-user'
Plugin 'nelstrom/vim-textobj-rubyblock'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'alvan/vim-closetag'
Plugin 'henrik/vim-ruby-runner'
Plugin 'junegunn/fzf'
Plugin 'prettier/vim-prettier'
" required for vim-textobj-rubyblock
runtime macros/matchit.vim

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" change the mapleader from \ to ,
let mapleader=","
let g:mapleader=","

" Prevent modelines exploits
" set modelines=0

" Allow ruby folding
let ruby_fold = 1

" Center search results
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz
nnoremap g* g*zz
nnoremap g# g#zz

"" No backup files
set nobackup                    "no backup files
set nowritebackup               "only in case you don't want a backup file while editing
set noswapfile                  "no swap files

"" Go look at the snippets here: https://github.com/scrooloose/snipmate-snippets/tree/master/ruby

let g:ctrlp_regexp = 1          " Default to regexp matching mode
let g:ctrlp_working_path_mode=0 " Don't manage the directory for CTRL-P
                                " 1 -> Dir of current file
                                " 2 -> source control root
" let g:ctrlp_cmd = 'CtrlP'

set laststatus=2                " Status bar
set showmatch                   " Show matching brackets
set visualbell                  " Show, don't bonk
set guicursor+=a:blinkon0       " Turn off cursor blinking
set guioptions-=T               " Hide MacVim toolbar by default
set ruler                       " Show the row/column
set encoding=utf-8              " UTF-8 for the win?
set showcmd                     " display incomplete commands
set number                      " show absolute line numbers
"" set relativenumber           " show line numbers

"" Cargo Culted status line
"set statusline=%F\ %m\ %{fugitive#statusline()}\ %y%=%l,%c\ %P

" folding settings
set nofoldenable        " dont fold by default


set nocompatible
if has("autocmd")
  filetype plugin indent on
endif

"" Whitespace
set list listchars=tab:>-,trail:.,precedes:<,extends:>   " Hightlights tabs
set nowrap                      " don't wrap lines
set tabstop=2 shiftwidth=2      " a tab is two spaces
set expandtab                   " use spaces, not tabs
set backspace=indent,eol,start  " backspace through everything in insert mode
set autoindent                  " automatically indent
set showmatch                   " Show matching parens
set numberwidth=6               " width of numberline area
set smarttab                    " insert tabs on the start of a line according to shiftwidth

" Searching
set ignorecase      " Ignore case in searching...
set smartcase       " ...unless you use capitals in your search string
set incsearch       " Incremental searches (begin matching as search is typed)
set hlsearch        " Highlight search
set nohls           " ...but unhighlight once done

" Most Recently Used files (open with ,m)
map <Leader>m :MRU<cr>
let MRU_Auto_Close = 0

" Window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Select the most recently pasted text
nnoremap <expr> gp '`[' . strpart(getregtype(), 0, 1) . '`]'

" Matching
nnoremap <tab> %
vnoremap <tab> %

" Turn off F1
inoremap <F1> <ESC>             " Turn off F1 for help (because it's right next to Esc & very easy to hit accidentally)
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

" Crazy ruby files without .rb extensions
au BufRead,BufNewFile {Gemfile,Rakefile,Vagrantfile,Thorfile,Podfile,Isolate,config.ru,.kick,.cap} set ft=ruby

" Ignore the .git directory
set wildignore+=.git

" My color scheme
syntax enable
colorscheme lucius
LuciusDarkHighContrast



" also check out:
"    http://vimcolorschemetest.googlecode.com/svn/colors/jellybeans.vim
"    http://vimcolorschemetest.googlecode.com/svn/colors/xoria256.vim
"    http://vimcolorschemetest.googlecode.com/svn/colors/wombat256.vim


" Commenting of code
autocmd FileType c,cpp,java,scala let b:comment_leader = '// '
autocmd FileType sh,ruby,python   let b:comment_leader = '# '
autocmd FileType conf,fstab       let b:comment_leader = '# '
autocmd FileType tex              let b:comment_leader = '% '
autocmd FileType mail             let b:comment_leader = '> '
autocmd FileType vim              let b:comment_leader = '" '
let NERDSpaceDelims=1   " add a space between the comment delimiter and text

" Indentation Levels
autocmd FileType javascript set tabstop=2|set shiftwidth=2|set expandtab


" Create leader-a to imply :Align -- then just type the characters to align on
" :( this doesn't seem to work
noremap <silent> ,a :Align 

" Font info
set encoding=utf8
set guifont=Consolas\ for\ Powerline:h9

" Disable arrow keys
noremap  <Up> ""
noremap! <Up> <Esc>
noremap  <Down> ""
noremap! <Down> <Esc>
noremap  <Left> ""
noremap! <Left> <Esc>
noremap  <Right> ""
noremap! <Right> <Esc>

" Remember last location in file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal g'\"" | endif
endif

" Reselect visual block after indent/outdent
vnoremap < <gv
vnoremap > >gv

" Hightlight common typos
syn match typos "udpate"
hi def link typos Error

" Configure Ack plugin to use the faster *ag* (silver searcher) utility
if executable("rg")
  " Configure Ack plugin to use the faster *rg* (ripgrep) utility
  set grepprg=rg\ --vimgrep\ --no-heading\ --follow\ --no-messages\ --smart-case\ --max-columns=350
  set grepformat=%f:%l:%c:%m,%f:%l:%m
  let g:ackprg = 'rg --vimgrep --no-heading --follow --no-messages --smart-case --max-columns=350'
endif

" Configure ack-grep to default to not open the first match
cnoreabbrev Ack Ack!

" Press F5 to get a list of buffers to select from
" :nnoremap <F5> :buffers<CR>:buffer<Space>

" Start NERDTree if no files are given
" autocmd vimenter * if !argc() | NERDTree | endif

" Ctrl-n is NERDTree
map <C-n> :NERDTreeToggle<CR>

" Map Control-p to use FZF file finder
map <C-p> :FZF<CR>

" Don't close NERDTree when opening a file
let NERDTreeQuitOnOpen=0

" Splits open to the right
set splitright

" Splits open below
set splitbelow

" Ignore stuff in the NERD Tree
let NERDTreeIgnore=['REVISION','rgloader', 'node_modules$[[dir]]', '.pnp$[[dir]]']


" Convert 1.8 Ruby hashes to 1.9 form
command Hashify :%s/:\([^ ]*\)\(\s*\)=>/\1:/g

" common command typos
if has("user_commands")
  command! -bang -nargs=? -complete=file Wq wq<bang> <args>
  command! -bang Wa wa<bang>
  command! -bang WA wa<bang>
endif

" Somehow this makes ruby syntax highlighting faster
set re=1

" Stop vim syntax highlighting on wide lines -- turned off to try re=1 to see
" if that is fast enough
"set synmaxcol=200

syntax on

" If we are using ctrlp
" Speed up ctrlp by using 'ag' command to find files
let g:ctrlp_user_command = 'ag %s -i --nocolor --nogroup --hidden
      \ --ignore .git
      \ --ignore .svn
      \ --ignore .hg
      \ -g ""'

" Show current syntax highlight group
" from: http://vim.wikia.com/wiki/Identify_the_syntax_highlighting_group_used_at_the_cursor
map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
      \ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
      \ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>


" Seeing is believing
" nmap <buffer> <F5> <Plug>(seeing-is-believing-run)
" xmap <buffer> <F5> <Plug>(seeing-is-believing-run)
" imap <buffer> <F5> <Plug>(seeing-is-believing-run)
"
" nmap <buffer> <F4> <Plug>(seeing-is-believing-mark)
" xmap <buffer> <F4> <Plug>(seeing-is-believing-mark)
" imap <buffer> <F4> <Plug>(seeing-is-believing-mark)

" Allow yanks to be copied to clipboard by default (and the mac OS X clipboard)
set clipboard=unnamed

" Use tab for emmet expansion
"imap <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")
let g:user_emmet_settings = {
  \  'xml' : {
  \    'extends' : 'html',
  \  },
  \  'haml' : {
  \    'extends' : 'html',
  \  },
  \}

" Change some background colors
highlight LineNr ctermfg=241
highlight LineNr ctermbg=none

" Set git gutter to be realtime and only a short time before updating
let g:gitgutter_realtime = 1
set updatetime=400

" Check rubocop for ruby syntax
let g:syntastic_ruby_checkers=['rubocop']
let b:ale_linters = ['rubocop']

" Check syntastic on open
"let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0



" Files where we automatically close HTML tag names
let g:closetag_filenames = "*.html,*.xhtml,*.phtml,*.jsx,*.js"

" Languages we suppoert for ``` fencing
let g:markdown_fenced_languages = ['html', 'python', 'bash=sh', 'ruby']

" Force ES6/JSX for all .js files
let g:jsx_ext_required = 0

" Prettier
let g:prettier#config#print_width = 120
let g:prettier#config#semi = 'false'
let g:prettier#config#bracket_spacing = 'true'

" Spellcheck
set spelllang=en
set spellfile=${HOME}/Dropbox/dotfiles/vim/spell/en.utf-8.add
syn match myExCapitalWords +\<\w*[_0-9A-Z-]\w*\>+ contains=@NoSpell
set spell


" Set git commit message to anything that starts with a semi-colont
"syn match gitcommitComment "^;.*"

