call plug#begin()
Plug 'Numkil/ag.nvim'
Plug 'morhetz/gruvbox'
Plug 'terryma/vim-multiple-cursors'
Plug 'sheerun/vim-polyglot'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'w0rp/ale'
Plug 'cohama/lexima.vim'
Plug 'honza/vim-snippets'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdTree'
"Plug 'preservim/nerdtree'
"Plug 'ryanoasis/vim-devicons'
"Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'easymotion/vim-easymotion'
Plug 'mustache/vim-mustache-handlebars'
Plug 'mattn/emmet-vim'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'deoplete-plugins/deoplete-jedi'
Plug 'airblade/vim-gitgutter'
Plug 'mileszs/ack.vim'
Plug 'zeekay/vim-beautify'
Plug 'joukevandermaas/vim-ember-hbs'
Plug 'Shougo/denite.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Vimjas/vim-python-pep8-indent'
" Highlighting and language support
Plug 'leafgarland/typescript-vim'
Plug 'joukevandermaas/vim-ember-hbs'
call plug#end()

set encoding=UTF-8
colorscheme gruvbox
set background=dark

set hidden
set number
set relativenumber
set mouse=a
set inccommand=split
set clipboard=unnamed

set expandtab
set shiftwidth=2

filetype indent on

let mapleader="\<space>"

nnoremap <leader>; A;<esc>
nnoremap <leader>sv :source $MYVIMRC<cr>
nnoremap <c-t> :Files<cr>
nnoremap <c-f> :Ag<space>
nnoremap <c-b> :Beautify<cr>

let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsSnippetsDir = '~/.config/nvim/UltiSnips'

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'default'
let g:airline_powerline_fonts = 1
set t_Co=256
let g:airline_theme='bubblegum'

let g:user_emmet_expandabbr_key = '<C-a>,'
let g:python_pep8_indent_multiline_string = 1

map <leader>n :NERDTreeToggle<cr>

map <leader>v :source ~/.config/nvim/init.vim<cr>
map <leader>j :tabp<cr>
map <leader>k :tabn<cr>
map <leader>b :Beautify<cr>

let g:deoplete#enable_at_startup = 1

let g:python_host_prog = 'usr/bin/python'
let g:python3_host_prog = '/usr/bin/python3.6'
let g:ackprg = 'ag --nogroup --nocolor --column'

let g:gitgutter_terminal_reports_focus=0
"let g:ale_lint_on_save = 1
let g:ale_linters = {
      \   'python': ['flake8', 'pylint'],
      \   'ruby': ['standardrb', 'rubocop'],
      \}

let g:ale_fixers = {
      \    'python': ['yapf', 'isort', 'autopep8', 'remove_trailing_lines', 'trim_whitespace'],
      \}
nmap <F10> :ALEFix<CR>
let g:ale_fix_on_save = 1


function! LinterStatus() abort
  let l:counts = ale#statusline#Count(bufnr(''))

  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors

  return l:counts.total == 0 ? '✨ all good ✨' : printf(
        \   '😞 %dW %dE',
        \   all_non_errors,
        \   all_errors
        \)
endfunction
let g:ale_sign_error = '❌'
let g:ale_sign_warning = '⚠️'
"let g:ale_fixers['javascript'] = ['eslint']


set statusline=
set statusline+=%m
set statusline+=\ %f
set statusline+=%=
set statusline+=\ %{LinterStatus()}

set clipboard+=unnamedplus

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" Mude para o modo normal com o esc
tnoremap <Esc> <C-\><C-j>
" start terminal in insert mode
au BufEnter * if &buftype == 'terminal' | :startinsert | endif
function! OpenTerminal()
  split term://zsh
  resize 10
endfunction
nnoremap <c-j> :call OpenTerminal()<CR>

" use alt+hjkl para mover entre split/vsplit paineis
tnoremap <A-h> <C-\><C-n><C-w>h
tnoremap <A-j> <C-\><C-n><C-w>j
tnoremap <A-k> <C-\><C-n><C-w>k
tnoremap <A-l> <C-\><C-n><C-w>l
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l
