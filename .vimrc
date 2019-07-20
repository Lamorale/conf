set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set laststatus=2
set noshowmode
set background=dark
set backspace=indent,eol,start
syntax on

"MAPPINGS
let mapleader = ","
:map <leader>f :FZF<CR>
:map <leader>a :Ag<CR>
:map <leader>h :A<CR>
:map <leader>t :NERDTreeToggle<CR>
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

"PLUGINS

" Specify a directory for plugins
call plug#begin('~/.vim/plugged')

" LightLine
Plug 'itchyny/lightline.vim'
Plug 'itchyny/vim-gitbranch'
let g:lightline = {
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'gitbranch#name'
      \ },
      \ }

Plug 'altercation/vim-colors-solarized'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-easy-align'
Plug 'scrooloose/nerdtree'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/vim-lsp'
if executable('clangd-9')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'clangd-9',
        \ 'cmd': {server_info->['clangd-9', '-background-index']},
        \ 'whitelist': ['c', 'cpp'],
        \ })
endif
if executable('pyls')
    " pip install python-language-server
    au User lsp_setup call lsp#register_server({
        \ 'name': 'pyls',
        \ 'cmd': {server_info->['pyls']},
        \ 'whitelist': ['python'],
        \ })                         
endif
" David config
" inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
" inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
" inoremap <expr> <cr>    pumvisible() ? "\<C-y>" : "\<cr>"
" imap <c-space> <Plug>(asyncomplete_force_refresh)

" let g:lsp_signs_error       = {'text': '✗'}
" let g:lsp_signs_warning     = {'text': '⚠'}
" let g:lsp_signs_information = {'text': 'ℹ'}
" let g:lsp_signs_hint        = {'text': '⇗'}

" autocmd FileType c nmap gd    <plug>(lsp-definition)
" autocmd FileType c nmap ge    <plug>(lsp-document-diagnostics)
" autocmd FileType c nmap K     <plug>(lsp-hover)
" autocmd FileType c nmap gs    <plug>(lsp-document-symbol)
" autocmd FileType c nmap gr    <plug>(lsp-references)
" autocmd FileType c nmap gm    <plug>(lsp-rename)
" autocmd FileType c nmap <C-k> <plug>(lsp-previous-reference)
" autocmd FileType c nmap <C-j> <plug>(lsp-next-reference)
" autocmd FileType c nmap gu    <plug>(lsp-status)

" Custom config
let g:lsp_signs_enabled           = 1
let g:lsp_diagnostics_echo_cursor = 1
let g:lsp_signs_error             = {'text': '✗'}
let g:lsp_signs_warning           = {'text': '⚠'}
let g:lsp_signs_information       = {'text': 'ℹ'}
let g:lsp_signs_hint              = {'text': '⇗'}

let g:lsp_highlights_enabled = 1
let g:lsp_textprop_enabled   = 1

highlight link LspErrorText Error
highlight link LspWarningText Warning

nmap <leader>d <plug>(lsp-definition)
nmap <leader>r <plug>(lsp-references)
nmap <leader>w <plug>(lsp-next-reference)
nmap <leader>q <plug>(lsp-previous-reference)
nmap <leader>v <plug>(lsp-rename)

inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr>    pumvisible() ? "\<C-y>" : "\<cr>"

Plug 'vim-scripts/a.vim'
Plug 'vim-scripts/The-NERD-Commenter'
Plug 'justinmk/vim-syntax-extra'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'

" Initialize plugin system
call plug#end()

colorscheme solarized

let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1
