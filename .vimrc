set nocompatible                                "We want the latest Vim settings/options.

so ~/.vim/plugins.vim

syntax enable

set backspace=indent,eol,start                  "Make backspace behave like every other editor.
let mapleader = ','                             "The default leader is \, but a comma is much better
set number
set cursorline

set autowriteall                                "Automatically write when switching buffers.

set tabstop=4                                   "set tab size
set shiftwidth=4
set softtabstop=4
set expandtab


"-------------Visuals-------------"
"Enable true colors for material theme
if (has('nvim'))
  let $NVIM_TUI_ENABLE_TRUE_COLOR = 1
endif

if (has('termguicolors'))
  set termguicolors
endif

colorscheme material
"colorscheme atom-dark-256

set t_Co=256					                "Use 256 colors.

let g:material_terminal_italics = 1
" let g:material_theme_style = 'dark'
let g:lightline = { 'colorscheme': 'material_vim' }

set guioptions-=e                               "disable gui tabs

"Change line number background
"hi LineNr ctermbg=bg                           "Not works due to material theme

set foldcolumn=2                                "Add little bit padding to the left
"hi foldcolumn ctermbg=bg                       "Not works due to material theme

"Remove split borders.
"hi vertsplit ctermbg=bg ctermfg=bg              "Not works due to material theme

set linespace=15                                "Set linehight. not working in ubuntu
    
set guioptions-=l					            "Remove scroll bar
set guioptions-=L
set guioptions-=r
set guioptions-=R



"-------------Search---------------"
set hlsearch
set incsearch
set smartcase



"-------------Split management---------------"
set splitbelow
set splitright
nmap <C-J> <C-W><C-J>
nmap <C-K> <C-W><C-K>
nmap <C-H> <C-W><C-H>
nmap <C-L> <C-W><C-L>

"-------------Mappings--------------"

"Make is easy to edit vimrc file
nmap <leader>ev :tabedit $MYVIMRC<cr> 

"add simple highlight removal.
nmap <leader><space> :nohlsearch<cr>

"enter normal mode by pressing jj
imap jj <esc>

"select all with Ctrl+A (default Ctrl+A is: increment integer)
map <C-a> <esc>ggVG<CR>

nmap <leader>w :w<cr>
nmap <leader>q :q<cr>

"Make NERDTree easy to toggle
nmap <leader>n :NERDTreeToggle<cr>

"CtrlP mappings
nmap <C-e> :CtrlPMRUFiles<cr>



"-------------Plugins--------------"
"/
"/ CtrlP
"/
let g:ctrlp_custom_ignore = 'node_modules\|git'
let g:ctrlp_match_window = 'top,order:ttb,min:1,max:30,results:30'

"/
"/ NERDTree
"/
let NERDTreeHijackNetrw = 0



"-------------Auto-Commands--------------"

"Automatically source the vimrc file on save.
augroup autosourcing
	autocmd!
	autocmd BufWritePost .vimrc source %
augroup END
"Hilight the word which is under the cursor & similer words
augroup cursor
    autocmd CursorMoved * exe printf('match StatusLine /\V\<%s\>/', escape(expand('<cword>'), '/\'))
augroup End

