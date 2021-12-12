" To include comments in the documentation start the line with "|

call plug#begin('~/.local/share/nvim/plugged/')
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'

Plug 'ryanoasis/vim-devicons'
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'cdelledonne/vim-cmake'
Plug 'scrooloose/nerdcommenter' "TODO: configure
call plug#end()

filetype plugin on
syntax on
set mouse=a
set tabstop=4
set shiftwidth=4
set expandtab
set number relativenumber " relative and absolute / hybrid linenumbers
set hlsearch " highlight every search result
set ruler
set smartindent
set autoindent
set nowrap
set noerrorbells
set spelllang=en,de
" colored column at 80 characters
" set colorcolumn=130
set colorcolumn=80

" color scheme stuff
" ------------------
set termguicolors
set background=dark
"let g:gruvbox_background = 'soft'
colorscheme gruvbox
let g:gruvbox_contrast_dark = 'hard'
let g:gruvbox_invert_selection='0'

let g:pandoc#biblio#use_bibtool = 1
let g:pandoc#completion#bib#mode = 'citeproc'
let g:pandoc#biblio#bibs = ["/home/joso/global.bib"]

let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

" coc config
" ----------
let g:coc_global_extensions = [
            \ 'coc-snippets',
            \ 'coc-pairs',
            \ 'coc-json',
            \ 'coc-python',
            \ 'coc-clangd'
            \]

" to edit snippets run ':CocCommand snippets.editSnippets'
let g:coc_snippet_next = '<tab>'

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR>
vnoremap ?? y?\V<C-R>=escape(@",'/\')<CR><CR>

" to insert Tabs in Makefiles hit Ctrl-V in Insert mode first
inoremap <S-Tab> <C-V><Tab>
nmap <C-n> :NERDTreeToggle<CR>

augroup numbertoggle
    autocmd!
    autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
    autocmd BufLeave,FocusLost,InsertEnter * set norelativenumber
augroup END

" Shortcut for moving between panes
    map <C-h> <C-w>h
    map <C-j> <C-w>j
    map <C-k> <C-w>k
    map <C-l> <C-w>l

"| **Jump to next `=`:** `<Space><Space>`
"inoremap <Space><Space> <Esc>/<++><Enter>"_c4l
inoremap ;e "{}"<Esc>hi
" autocmd FileType markdown inoremap * **<Esc>i
 autocmd FileType markdown inoremap ** ****<Esc>hi
" autocmd FileType markdown inoremap $ $$<Esc>i
" autocmd FileType markdown inoremap $$<Return> $$<Return><Return>$$<Esc>kA

"| # Snippets

" shebang section
"| ## Shebangs
"| **Insert shebang:** `;s`
"| * **sh:** `#!/bin/sh`
autocmd FileType sh inoremap ;s <Esc>ggO#!/bin/sh<Return><Return>
"| * **bash:** `#!/bin/bash`
autocmd FileType bash inoremap ;s <Esc>ggO#!/bin/bash<Return><Return>
"| * **python:** `#!/usr/bin/python3`
autocmd FileType python inoremap ;s <Esc>ggO#!/usr/bin/python3<Return><Return>

"| ## Python-Snippets
"| * **for each loop:** `;fori`
autocmd FileType python inoremap ;fori for <++> in <++>:<Return><++><Esc>k0frllv3l
"| * **print()**: `;p`
autocmd FileType python inoremap ;p print()<Return><++><Esc>k$i

"| ## Java-Snippets
"| * **`System.out.println();`:** `;sout`
autocmd FileType java inoremap ;sout System.out.println();<Return><++><Esc>k$hi
"| * **`public static void main(Strings args[]){}`:** `;main`
autocmd FileType java inoremap ;main public static void main(String args[]){<Esc> <Backspace><Return>}<Esc>kA

autocmd FileType markdown inoremap ;p <Esc>:read !~/.scripts/pasteImage<Return>kddI![](<Esc>A)

