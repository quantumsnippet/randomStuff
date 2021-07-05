"""""Updated as of July 3rd, 2021"""""

                    """""PLUGINS USING VIM-PLUG
call plug#begin()
    Plug 'dracula/vim', { 'as': 'dracula' }                     "Dracula Vim Dark Theme

    Plug 'preservim/nerdtree'                                   "NERDTree Plugin

    Plug 'preservim/nerdcommenter'                              "NERD Commenter

call plug#end()


set exrc
set secure
set nocompatible				        "Don't try to be vi compatible
set history=100					        "Sets how many lines of history VIM has to remember			                    
filetype plugin on                      "Enable filetype plugins
filetype indent on


					"""""BASIC BEHAVIOUR SETTINGS
set ttyfast						        "Rendering
set mouse=a						        "Enable mouse support
set wildmenu					        "Visual autocomplete for command menu             
set ruler				            	"Always show current position
set number						        "Show line numbers
set lazyredraw			                "Don't redraw while executing macros (good performance config)
set magic				                "For regular expressions turn magic on  
set showmatch			                "Show matching brackets when text indicator is over them
set mat=2						        "How many tenths of a second to blink when matching brackets
set wrap 						        "Wrapping of lines
set encoding=utf8				        "Set utf8 as standard encoding and en_US as the standard language
set noerrorbells					    "No annoying sound on errors
set novisualbell					    "Disable screen flashing on errors
set cmdheight=1           			    "Height of the command bar
set showcmd			      			    "Show command in bottom bar
set showmode
set laststatus=2					    "Always show the status line
set cursorline					        "Don't highlight current line
set hidden				                "A buffer becomes hidden when it is abandoned
set backspace=eol,start,indent		    "Configure backspace so it acts as it should act
set whichwrap+=<,>,h,l
set modelines=0					        "Security settings
set nomodeline					        "Security settings
set autoread						    "Set to auto read when a file is changed from the outside			                 	


					"""""SYNTAX AND THEME SETTINGS
colorscheme dracula
syntax on						        "Enable Syntax highlightling
syntax enable   
set termguicolors
set background=dark


					"""""SEARCH SETTINGS
set ignorecase					        "Ignore case when searching		 
set smartcase			                "When searching try to be smart about cases
set hlsearch			                "Highlight search results
set incsearch			        		"Search as characters are entered
"Binds the command :nohlsearch with \+<spacebar> combo. <leader> is mapped by default to \ key
nnoremap <leader><space> :nohlsearch<CR>						

"Press F4 to toggle highlighting on/off, and show current value
noremap <F4> :set hlsearch! hlsearch?<CR>  


					"""""CODE FOLDING
set foldenable					        "Enable Code Folding
set foldlevelstart=10				    "10 ensures that only heavily nested blocks are folded.
"Shortcut for opening/closing folds
nnoremap <space> za				 
set foldmethod=indent			        "Tells Vim to fold based on indentation"
set foldcolumn=1		            	"Add a bit of extra margin to the left


					"""""TAB AND INDENTATION SETTINGS
set shiftwidth=4					    "1 tab == 4 spaces
set tabstop=4			       		    "Number of visual spaces per tab
set expandtab			 		        "Use spaces instead of tabs
set smarttab						    "Be smart when using tabs
set softtabstop=4					    "Removing multiple spaces on single backspace
set autoindent					        "Enable Automatic Indentation
set smartindent					        "Enable Smart Indentation
	
	
					"""""KEY BINDINGS
"Smart way to move between windows
map <C-j> <C-W>j		
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

"Move up/down editor lines
nnoremap j gj			
nnoremap k gk

"Mapping F2 for NERDTreeToggle
nmap <F2> :NERDTreeToggle<CR>


					"""""CLIPBOARD SETTINGS FOR COPY PASTE OPERATIONS
set clipboard=unnamedplus		"Makes all yanking/deleting operations automatically copy to the system clipboard           
"Copy Paste Shortcuts between the system clipboard and regular vim editor
vnoremap <C-c> "*y :let @+=@*<CR>		
map <C-v> "+P



