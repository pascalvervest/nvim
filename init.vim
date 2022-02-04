set nocompatible              " be iMproved, required
filetype off                  " required

:set number
:set autoindent
:set tabstop=4
:set shiftwidth=4
:set smarttab
:set softtabstop=4
:set mouse=a
:set encoding=UTF-8
:set signcolumn=yes

call plug#begin()
        Plug 'http://github.com/tpope/vim-surround' " Surrounding ysw)
        Plug 'https://github.com/preservim/nerdtree' " NerdTree
        Plug 'https://github.com/tpope/vim-commentary' " For Commenting gcc & gc
        Plug 'https://github.com/lifepillar/pgsql.vim' " PSQL Pluging needs :SQLSetType pgsql.vim
        Plug 'https://github.com/ap/vim-css-color' " CSS Color Preview
        Plug 'https://github.com/rafi/awesome-vim-colorschemes' " Retro Scheme
        Plug 'https://github.com/neoclide/coc.nvim'  " Auto Completion
        Plug 'https://github.com/ryanoasis/vim-devicons' " Developer Icons
        Plug 'https://github.com/tc50cal/vim-terminal' " Vim Terminal
        Plug 'https://github.com/preservim/tagbar' " Tagbar for code navigation
        Plug 'https://github.com/terryma/vim-multiple-cursors' " CTRL + N for multiple cursors
        Plug 'https://github.com/airblade/vim-gitgutter'
        Plug 'https://github.com/tpope/vim-fugitive'
        Plug 'https://github.com/junegunn/fzf'
        Plug 'https://github.com/junegunn/fzf.vim'
        Plug 'https://github.com/jiangmiao/auto-pairs'
        Plug 'https://github.com/SirVer/ultisnips'
        Plug 'https://github.com/sandermarechal/emptylines'
		Plug 'vim-airline/vim-airline'
		Plug 'vim-airline/vim-airline-themes'
call plug#end()

nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-f> :NERDTreeFind<CR>
nnoremap <F3> :NERDTreeToggle<CR>
nnoremap <F4> :NERDTreeFind<CR>
nnoremap <F5> :buffers<CR>:buffer<Space>
nnoremap <C-l> :call CocActionAsync('jumpDefinition')<CR>
nmap <F8> :TagbarToggle<CR>

:set completeopt-=preview " For No Previews

:colorscheme jellybeans

let g:NERDTreeDirArrowExpandable="+"
let g:NERDTreeDirArrowCollapsible="~"

" Map ; to add ; to the end of the line, when missing
nnoremap <buffer> ; :s/\([^;]\)$/\1;/<cr>

" air-line
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

" Configure Ultisnips
let g:UltiSnipsExpandTrigger = "<Tab>"
let g:UltiSnipsJumpForwardTrigger = "<Tab>"
let g:UltiSnipsJumpBackwardTrigger = "<S-Tab>"
let g:UltiSnipsListSnippets = "<M-Tab>"

" Set a custom snippets directory
let g:UltiSnipsSnippetDirectories = ["ultisnips"]

inoremap <expr> <Tab> pumvisible() ? coc#_select_confirm() : "<Tab>"

map . :Files<CR>

" Resize split windows using arrow keys by pressing:
" CTRL+UP, CTRL+DOWN, CTRL+LEFT, or CTRL+RIGHT.
noremap <c-up> <c-w>+
noremap <c-down> <c-w>-
noremap <c-left> <c-w>>
noremap <c-right> <c-w><

" Pressing the letter o will open a new line below the current one.
" Exit insert mode after creating a new line above or below the current line.
nnoremap o o<esc>
nnoremap O O<esc>

" Center the cursor vertically when moving to the next word during a search.
nnoremap n nzz
nnoremap N Nzz

" Type jj to exit insert mode quickly.
inoremap jj <Esc>

autocmd VimEnter * NERDTree
autocmd VimEnter * NERDTree | wincmd p
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * NERDTree | if argc() > 0 || exists("s:std_in") | wincmd p | endif
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') && v:this_session == '' | NERDTree | endif
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') |
    \ execute 'NERDTree' argv()[0] | wincmd p | enew | execute 'cd '.argv()[0] | endif
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
    \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif
autocmd BufWinEnter * if getcmdwintype() == '' | silent NERDTreeMirror | endif
