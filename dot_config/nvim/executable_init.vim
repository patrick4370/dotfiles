" Nvim Configuration  Fri 15-07-2022 14:37 +1000
"    
" Basic Options
filetype plugin indent on                                   " Allows auto-indenting depending on file type
set autoindent                                              " Indent a new line the same amount as the line just typed
set backspace=indent,eol,start                              " Where in Insert mode the <BS> is allowed to delete the character in front of the cursor.
set clipboard=unnamed                                       " System Clipboard - Allow pasting to/from other applications
set completeopt=menuone,noinsert,noselect,preview           " Comma-separated list of options for Insert mode completion
set expandtab                                               " Converts tabs to white space
set formatoptions-=cro                                      " Stops auto commenting
set hidden                                                  " Allow to switch between buffers without saving
set hlsearch                                                " Highlight search results
set ignorecase                                              " Case insensitive matching
set incsearch                                               " Incremental search
set laststatus=2                                            " Statusline
set listchars=tab:‣\ ,trail:·,precedes:«,extends:»,eol:¬    " Show EOL, Tabs, etc
set mouse=a                                                 " Paste using middle mouse button 
set noshowcmd                                               " Disables showing commands under the status bar
set noshowmode                                              " Disables bar under the status bar
set nrformats+=alpha                                        " Add alpha characters to increment and decrement
set number                                                  " Add line numbers
set pastetoggle=<F2>                                        " Togle paste on/off
set path+=**                                                " Fuzzy search
set relativenumber                                          " Relative numbering 
set shiftwidth=4                                            " Width for autoindents
set shortmess+=F                                            " Shortens Vim's output messages   
set showcmd                                                 " Display incomplete commands
set showmatch                                               " Show matching brackets.
set smartcase                                               " Override the 'ignorecase' option if the search pattern contains upper case characters
set smarttab	        	                                " Autotabs for certain code
set softtabstop=4                                           " Insert one TAB character
set softtabstop=4                                           " See multiple spaces as tabstops so <BS> does the right thing
set spelllang=en_au                                         " Spell Language 
set splitright                                              " Splits open to the right 
set tabstop=4                                               " Number of columns occupied by a tab character
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx,*.iso,*.zip,*.tar.gz,*.tgz,*.tar.xz,*.tar*,*.mp3,*.ttf
set wildmenu                                                "
set wildmode=longest:full,full                              " Get bash-like tab completions
syntax on                                                   " Colour syntax in Perl,HTML,PHP etc

" map leader
let mapleader = ','

" Turn on Relative Line Numbering & Line Numbering
nmap <F3> :set norelativenumber!<CR> " toggle relativenumber

" ColorToggle function
map <c-c> :ColorToggle!<CR>

" Copy & Paste to/from external sources
map <leader>c "+y
map <leader>p "+p
"
" Zoom for Splits
noremap Zz <c-w>_ \| <c-w>\|
noremap Zo <c-w>=

" Insert date in normal and insert mode
nnoremap <F5> "=strftime("%d-%m-%Y %H:%M %z")<Space><CR>P
inoremap <F5> <C-R>=strftime("%d-%m-%Y %H:%M %z") <CR>

" Spell Check Toggle
map <F12> :setlocal spell!<CR>

" Wipereg to clear registers
command! WipeReg for i in range(34,122) | silent! call setreg(nr2char(i), []) | endfor

" Turn on or off the list option (For showing EOL etc)
noremap <F6> :set nolist<CR>
noremap <F7> :set list<CR>
 
" Press F4 to toggle highlighting on/off, and show current value.
noremap <F4> :set hlsearch! hlsearch?<CR>

" Toggle cursorcolumn
nnoremap <M-/> :set cursorcolumn! cursorcolumn?<CR>

" Toggle ColorColumn on/off
nnoremap <leader>cc :execute "set colorcolumn=" . (&colorcolumn == "" ? "81" : "")<CR>

" move updown by visual (wrapped) lines
noremap j gj
noremap k gk

" augroup vimrc_autocmds
"   autocmd BufEnter * highlight OverLength ctermfg=white ctermbg=052 guibg=#592929
"   autocmd BufEnter * match OverLength /\%72v.*/
" augroup END

" Set CursorColumn for certain filetypes
autocmd Filetype sh set cursorcolumn
" autocmd Filetype yaml set cursorColumn

" Plugin Manager. Specify directory for plugins
call plug#begin('~/.config/nvim/plugged')

Plug 'PotatoesMaster/i3-vim-syntax'                 " i3 config file syntax and colours
Plug 'WolfgangMehner/bash-support'                  " BASH IDE
Plug 'chrisbra/colorizer'                           " Colorize Color numbers
Plug 'dhruvasagar/vim-table-mode'                   " Table Mode for Markdown
Plug 'farmergreg/vim-lastplace'                     " Remember position in file
Plug 'godlygeek/tabular'                            " It's useful to line up text
Plug 'iamcco/markdown-preview.vim'                  " Markdown Preview
Plug 'iamcco/mathjax-support-for-mkdp'              " Markdown for maths
Plug 'inkarkat/vim-OnSyntaxChange'                  " custom User events similar to the InsertEnter and InsertLeave
Plug 'inkarkat/vim-ingo-library'                    " Common vimscript functions
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'                             " Fuzzy File Finder for vim
Plug 'mhinz/vim-startify'                           " Provides a start screen for Vim and Neovim
Plug 'preservim/nerdtree'                           " A tree explorer plugin for vim
Plug 'ryanoasis/vim-devicons'                       " Adds icons to NERDTree
Plug 'tpope/vim-fugitive'                           " Vim plugin for Git
Plug 'tpope/vim-surround'                           " Surround text/words with \"'{}[]()
Plug 'tpope/vim-repeat'                             " enable repeating supported plugin maps with \".\" 
Plug 'vim-airline/vim-airline'                      " Status bar
Plug 'vim-airline/vim-airline-themes'               " Themes for vim-airline
Plug 'vim-scripts/AutoComplPop'                     " Autocomplete 
Plug 'vimwiki/vimwiki'                              " Wiki for vim
Plug 'zsh-users/zsh-syntax-highlighting'            " Syntax Highlighting for ZSH files
Plug 'lambdalisue/suda.vim'                         " Sudo for Nvim
Plug 'mattn/calendar-vim'                           " Vim Calendar
" Plug 'olimorris/onedarkpro.nvim'
Plug 'joshdick/onedark.vim'
Plug 'jsit/toast.vim/'                              " Colour Scheme
Plug 'NLKNguyen/papercolor-theme'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }
Plug 'jiangmiao/auto-pairs'

call plug#end()

" NERDTree Stuff
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

" Markdown Plugin
" set to 1, nvim will open the preview window after entering the markdown buffer
" default: 0
let g:mkdp_auto_start = 1

" set to 1, the nvim will auto close current preview window when change
" from markdown buffer to another buffer
" default: 1
let g:mkdp_auto_close = 1

command! Diary VimwikiDiaryIndex
augroup vimwikigroup
    autocmd!
    " automatically update links on read diary
    autocmd BufRead,BufNewFile diary.wiki VimwikiDiaryGenerateLinks
augroup end

set grepprg=grep\ -nH\ $*
let g:tex_flavor = "latex"
"
" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
" Open the existing NERDTree on each new tab.
autocmd BufWinEnter * if getcmdwintype() == '' | silent NERDTreeMirror | endif

let g:vimtex_view_method = 'zathura'
let maplocalleader = ","

" Detect Groff files
au BufNewFile,BufRead *.ms set filetype=groff

" Surround with Quote
nmap <Leader>' ysiw'
nmap <Leader>" ysiw"

" FZF Stuff
map <C-p> :Files<CR>
map <C-b> :Buffers<CR>
map <Leader>. :Commands<CR>
map <Leader>l :BLines<CR>
let g:fzf_layout = { 'down': '~50%' }
autocmd! FileType fzf set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler

let g:livepreview_previewer = 'zathura'

" Smart wrapping
set wrap
set textwidth=78
set formatoptions=qrnl

" Colours
colorscheme onedark
set background=dark

set cursorline
autocmd WinEnter * setlocal cursorline
autocmd WinLeave * setlocal nocursorline
highlight CursorLine ctermbg=238
highlight CursorColumn ctermbg=238
highlight ColorColumn ctermbg=229
highlight NonText cterm=NONE ctermfg=244
highlight Search cterm=NONE ctermfg=white ctermbg=033
highlight SignColumn guibg=darkgrey
highlight Error ctermfg=160

highlight clear SpellBad
highlight SpellBad cterm=underline ctermbg=160 ctermfg=255
highlight SpellCap cterm=underline ctermbg=022 ctermfg=255
highlight SpellRare cterm=underline ctermbg=021 ctermfg=255
highlight SpellLocal cterm=underline ctermbg=024 ctermfg=255

call OnSyntaxChange#Install('Comment', '^Comment$', 1, 'i')

augroup auto_wrap_comments
  " Set textwidth to 80 when editing
  autocmd User SyntaxCommentEnterI setlocal textwidth=74
  " Remove it again when leaving insert mode
  autocmd User SyntaxCommentLeaveI setlocal tw=0
augroup END

let g:vimwiki_listsyms = ' ✗○●✓'
" Keys

" Bubble single lines
nmap <C-Up> :m .-2<CR>
nmap <C-Down> :m  .+1<CR>

command! Edrc edit $MYVIMRC

" Bubble multiple lines
vnoremap <silent> <C-Up>  @='"zxk"zP`[V`]'<CR>
vnoremap <silent> <C-Down>  @='"zx"zp`[V`]'<CR>

vmap ,mc !boxes -d pound-cmt<CR>
nmap ,mc !!boxes -d pound-cmt<CR>
vmap ,xc !boxes -d pound-cmt -r<CR>
nmap ,xc !!boxes -d pound-cmt -r<CR>

nmap <silent> <F8> <Plug>MarkdownPreview
" for insert mode
imap <silent> <F8> <Plug>MarkdownPreview
" for normal mode
nmap <silent> <F9> <Plug>StopMarkdownPreview
" for insert mode
imap <silent> <F9> <Plug>StopMarkdownPreview


" NERDTree keymaps
nnoremap <leader>1 :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>
" Start NERDTree and put the cursor back in the other window.
" autocmd VimEnter * NERDTree | wincmd p
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" This is an example of trying to make something work, and typing to get to
" the col
map <leader>, :bn<CR>

" source $MYVIMRC reloads the saved $MYVIMRC
nmap <Leader>s :source $MYVIMRC<CR>

" opens $MYVIMRC for editing, or use :tabedit $MYVIMRC
nmap <Leader>v :e $MYVIMRC<CR>

let g:airline_theme='bubblegum'
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_solarized_bg='dark'

 if !exists('g:airline_symbols')
          let g:airline_symbols = {}
  endif
  
      " unicode symbols
      let g:airline_left_sep = '»'
      let g:airline_left_sep = '>'
      let g:airline_right_sep = '«'
      let g:airline_right_sep = '<'
      let g:airline_symbols.crypt = '🔐'
      let g:airline_symbols.linenr = ' ☰ '
      " let g:airline_symbols.linenr = ' ln:'
      let g:airline_symbols.maxlinenr = ' '
      let g:airline_symbols.colnr = 'col:'
      let g:airline_symbols.branch = '⎇'
      let g:airline_symbols.paste = '🅿️ '
      let g:airline_symbols.branch = ''
      let g:airline_symbols.readonly = '🔐'

" Set up persistent undo across all files
set undofile
if !isdirectory(expand("/home/patrick/.config/nvim/undodir"))
    call mkdir(expand("/home/patrick/.config/nvim/undodir"), "p")
endif
set undodir=$HOME/.config/nvim/undodir

" Set executable bit on scripts
au BufWritePost * if getline(1) =~ "^#!" | if getline(1) =~ "/bin/" | silent execute "!chmod +x <afile>" | endif | endif

" vimwiki 
let wiki_1 = {}
let wiki_1.path = '~/Documents/vimwiki/'
let wiki_1.path_html = '~/Documents/vimwiki_html/'

let wiki_2 = {}
let wiki_2.path = '~/Documents/private/'
let wiki_2.path_html = '~/Documents/private_html/'

let g:vimwiki_list = [wiki_1, wiki_2]

command! Diary VimwikiDiaryIndex
augroup vimwikigroup
    autocmd!
    " automatically update links on read diary
    autocmd BufRead,BufNewFile diary.wiki VimwikiDiaryGenerateLinks
augroup end
