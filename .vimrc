" required for Vundle
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim "required
call vundle#begin() "required
Plugin 'gmarik/Vundle.vim' "required
Plugin 'FelikZ/ctrlp-py-matcher'
Plugin 'KurtPreston/vim-autoformat-rails'
Plugin 'Raimondi/delimitMate'
Plugin 'airblade/vim-gitgutter'
Plugin 'altercation/vim-colors-solarized'
Plugin 'bkad/CamelCaseMotion'
Plugin 'bling/vim-airline'
Plugin 'bogado/file-line'
Plugin 'chriskempson/base16-vim'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'dietsche/vim-lastplace'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'ervandew/supertab'
Plugin 'gabebw/vim-spec-runner'
Plugin 'gorodinskiy/vim-coloresque'
Plugin 'kien/ctrlp.vim'
Plugin 'mattn/gist-vim'
Plugin 'mattn/webapi-vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/syntastic'
Plugin 'slim-template/vim-slim'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-surround'
Plugin 'vim-ruby/vim-ruby'
Plugin 'vim-scripts/Rename'
Plugin 'vim-scripts/closetag.vim'
call vundle#end()
filetype plugin indent on "required

syntax enable
set background=dark

colorscheme solarized
let g:solarized_termcolors=256

set backspace=2
set backspace=indent,eol,start
set clipboard=unnamed " System clipboard
set hlsearch " Highlight search results
set incsearch " Search as you type
set laststatus=2 " Always show mode in powerline
set noshowmode " Hide INSERT, already displayed in powerline
set nobackup " Prevents ~ backups from being made
set noswapfile " Prevent swap files from being created
set number
set ruler
set runtimepath^=~/.vim/bundle/ctrlp.vim
set showmatch
".editorconfig handles this now
set softtabstop=2 tabstop=2 expandtab
set shiftwidth=2
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.swp,*.bak,*.pyc,*.class

highlight LineNr ctermfg=red
highlight clear SignColumn

autocmd BufWritePre * :%s/\s\+$//e

if exists('$TMUX')
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

let g:multi_cursor_use_default_mapping=0
let g:multi_cursor_next_key='<C-n>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'

let g:gitgutter_realtime = 1
let g:gitgutter_eager = 1

let g:ruby_path = system('echo $HOME/.rbenv/shims')

map <silent> w <Plug>CamelCaseMotion_w
map <silent> b <Plug>CamelCaseMotion_b
map <silent> e <Plug>CamelCaseMotion_e
sunmap w
sunmap b
sunmap e

autocmd QuickFixCmdPost *grep* cwindow

let g:ctrlp_user_command = 'ag %s -i --nocolor --nogroup --hidden
      \ --ignore .git
      \ --ignore .svn
      \ --ignore .hg
      \ --ignore .DS_Store
      \ --ignore "**/*.pyc"
      \ -g ""'

let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }

let g:airline#extensions#tabline#enabled = 1
let g:gitgutter_max_signs = 1000

set foldmethod=indent
set foldlevel=20

syntax match Tab /\t/
hi Tab gui=underline guifg=blue ctermbg=blue

map <Leader>t <Plug>RunCurrentSpecFile " Use <Leader>t to run the current spec file.
map <Leader>f <Plug>RunFocusedSpec " Use <Leader>u to run the current line in a spec.
map <Leader>l <Plug>RunMostRecentSpec " Use <Leader>v to explicitly run the most recent spec.

set autoread

let g:gist_post_private = 1

"Highlight character that makes a line greater than 80 characters
highlight ColorColumn ctermbg=red
call matchadd('ColorColumn', '\%81v', 100)


nnoremap ,v <C-w>v
nnoremap ,s <C-w>s
