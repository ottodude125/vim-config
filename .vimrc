execute pathogen#infect()
syntax on 		" turn on syntax highlighting 
set background=dark 	" makes darker colors brighter
set shiftwidth=2 	" sets spaces used for auto indent
set shiftround 		" indent to nearest tabstop
set autoindent 		" Carries over previous indent to the next line
set t_Co=256 		" sets color to 256 - was needed for airline to work
set hlsearch 		" highlights all found text in search
set incsearch		" while typing a search command show matches immediately
set mouse=a 		" allows scrolling with mouse
set number 		" adds numbers to lines
set showcmd		" show (partial) command in status line
set showmatch		" when a bracket is inserted briefly highlight the matching bracket
set ignorecase		" ignore case on searches
set more		" use more prompt"
set autoread		" watch for file changes"
set hidden		" hides buffers instead of closing them - allows you to open new file withoug saving first
set nowrap		" dont wrap lines"

" Persistent undo
try
	set undofile 				" Save undo's after file closes
	set undodir=~/.vim/undo	" where to save history"
	set undolevels=10000			" how many undos"
	set undoreload=10000			" number of lines to save for undo"
catch
endtry

colorscheme twilight256
filetype plugin indent on

" Load NERDTree automatically when vim starts up
"autocmd vimenter * NERDTree				" if file specified"
autocmd vimenter * if !argc() | NERDTree | endif	" if no file specified"

" map Ctrl+n to open and close and close nerd tree
map <C-n> :NERDTreeToggle<CR>

" allows vim to close if nerd tree last thing open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif



"makes airline show content on bottom becuase was not showing on its own
set laststatus=2
let g:airline_powerline_fonts = 1

" :clrh alias to :nohlsearch to get rid of highlight
cnoreabbrev <expr> clrh ((getcmdtype() is# ':' && getcmdline() is# 'clrh')?('nohlsearch'):('clrh'))

" :W alias to :w to still save when accidentally capitalising w
cnoreabbrev <expr> W ((getcmdtype() is# ':' && getcmdline() is# 'W')?('w'):('W'))

" :Wq alias to :wq to still save and quit when accidentally capitalizing w
cnoreabbrev <expr> Wq ((getcmdtype() is# ':' && getcmdline() is# 'Wq')?('wq'):('Wq'))

" map the colon to semicolon to save 2 key strokes
nnoremap ; :

" use w!! to become sudo to edit file that requires priveledges if you forgot
cmap w!! w !sudo tee % >/dev/null
