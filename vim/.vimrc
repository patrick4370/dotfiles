" myvimrc /home/patrick/.vimrc 
" 10-05-2024 15:48 +1000 
"
" New .vimrc file that has been through a huge tidy up
"
" Author: Patrick Heffernan
"  Email: <patrick4370@bigpond.com>
"
" [General Options]
filetype plugin indent on                                   " Allows auto-indenting depending on file type
" Smart wrapping
set autoindent                                              " Indent a new line the same amount as the line just typed
set backspace=indent,eol,start                              " Where in Insert mode the <BS> is allowed to delete the character in front of the cursor.
set clipboard=unnamed                                       " System Clipboard - Allow pasting to/from other applications
set complete+=kspell                                        " Use spelling in autocomplete
set completeopt=menuone,noselect,preview,popup              " Comma-separated list of options for Insert mode completion
set expandtab                                               " Converts tabs to white space
set formatoptions-=cro                                      " Stops auto commenting
set formatoptions+=t
set hidden                                                  " Allow to switch between buffers without saving
set hlsearch                                                " Highlight search results
set ignorecase                                              " Case insensitive matching
set incsearch                                               " Incremental search
set laststatus=2                                            " Statusline
set listchars=tab:‣\ ,trail:·,precedes:«,extends:»,eol:¬    " Show EOL, Tabs, etc
set modeline                                                " Enable vim modelines
set mouse=a                                                 " Paste using middle mouse button 
set noshowcmd                                               " Disables showing commands under the status bar
set noshowmode                                              " Disables bar under the status bar
set nrformats+=alpha                                        " Add alpha characters to increment and decrement
set number                                                  " Add line numbers
set omnifunc=syntaxcomplete#Complete                        " 
set pastetoggle=<F2>                                        " Toggle paste on/off
set path+=**                                                " Fuzzy search
set relativenumber                                          " Relative numbering 
set shiftwidth=4                                            " Width for autoindents
set shortmess+=F                                            " Shortens Vim's output messages   
set showcmd                                                 " Display incomplete commands
set showmatch                                               " Show matching brackets.
set showtabline=0                                           " Don't show file tabs 
set smartcase                                               " Override the 'ignorecase' option if the search pattern contains upper case characters
set softtabstop=4                                           " Insert one TAB character
set spelllang=en_au                                         " Spell Language 
set splitright                                              " Splits open to the right 
set tabstop=4                                               " Number of columns occupied by a tab character
set termguicolors                                           " Allows 24 bit colour in the terminal 
set textwidth=180
set virtualedit+=all
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx,*.iso,*.zip,*.tar.gz,*.tgz,*.tar.xz,*.tar*,*.mp3,*.ttf
set wildmenu                                                " Enhanced command line completion 
set wildmode=longest:full,full                              " Get bash-like tab completions
set wrap linebreak nolist
syntax on                                                   " Colour syntax in Perl,HTML,PHP etc

" [Plugin Manager.] 
call plug#begin()

Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }
Plug 'dhruvasagar/vim-table-mode'                                           " Table Mode for Markdown
Plug 'farmergreg/vim-lastplace'                                             " Remember position in file
Plug 'preservim/vim-markdown'
Plug 'dhruvasagar/vim-table-mode'
Plug 'jiangmiao/auto-pairs'
Plug 'PotatoesMaster/i3-vim-syntax'                                         " i3 config file syntax and colours
Plug 'tpope/vim-repeat'                                                     " enable repeating supported plugin maps with \".\"
Plug 'tpope/vim-surround'                                                   " Surround text/words with \"'{}[]()
Plug 'vim-airline/vim-airline'                                              " Status bar
Plug 'vim-airline/vim-airline-themes'                                       " Themes for vim-airline
Plug 'vimwiki/vimwiki'                                                      " Wiki for vim
Plug 'scrooloose/nerdcommenter'                                             " For comments
Plug 'prabirshrestha/vim-lsp'                                               " Language Server Protocol 
Plug 'mattn/vim-lsp-settings'                                               " For adding LSP Servers
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'SirVer/ultisnips'                                                     " Ultisnips for snippets
Plug 'honza/vim-snippets'
Plug 'artempyanykh/marksman'
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'lambdalisue/fern.vim'
Plug 'yuki-yano/fern-preview.vim'
Plug 'lambdalisue/nerdfont.vim'
Plug 'lambdalisue/fern-renderer-nerdfont.vim'
Plug 'vim-scripts/vis'
Plug 'haya14busa/is.vim'                                                    " Automatically clears search highlight when you move the cursor 
Plug 'vim-scripts/AutoComplPop'
Plug 'nelstrom/vim-visual-star-search'                                      " This allows you to select some text using Vim's visual mode and then hit * " and # to search for it elsewhere in the file.
Plug 'nightsense/carbonized'
Plug 'nanotee/zoxide.vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'gyim/vim-boxdraw'

call plug#end()

" [Statements]
"
" map leader
let mapleader = ','

" Colours
colorscheme carbonized-dark
set background=dark

hi clear SpellBad
hi SpellBad ctermfg=9 
hi clear SpellCap
hi SpellCap ctermfg=14
hi clear SpellRare	
hi SpellRare ctermfg=12
hi clear SpellLocal	
hi SpellLocal ctermfg=10
		
" Hexokinase Plugin
let g:Hexokinase_highlighters = [ 'foregroundfull' ]
let g:Hexokinase_optInPatterns = [
\     'full_hex',
\     'triple_hex',
\     'rgb',
\     'rgba',
\     'hsl',
\     'hsla',
\     'colour_names'
\ ]

" vimwiki 
" let wiki_1 = {}
" let wiki_1.path = '~/onedrive/Vimwiki/vimwiki/'
" let wiki_1.path_html = '~/onedrive/Vimwiki/vimwiki_html/'
"
" let wiki_2 = {}
" let wiki_2.path = '~/onedrive/Vimwiki/private/'
" let wiki_2.path_html = '~/onedrive/Vimwiki/private_html/'
"
let g:vimwiki_list = [{'path': '~/Documents/Vimwiki_md/', 'syntax': 'markdown', 'ext': '.md'}]
let g:vimwiki_global_ext = 0

" let g:vimwiki_list = [wiki_1, wiki_2]

let g:vimwiki_listsyms = ' ✗○●✓'

" Set up persistent undo across all files
set undofile
if !isdirectory(expand("/home/patrick/.vim/undodir"))
    call mkdir(expand("/home/patrick/.vim/undodir"), "p")
endif
set undodir=$HOME/.vim/undodir

" Cursor Shape
let &t_SI = "\<Esc>[6 q"
let &t_SR = "\<Esc>[4 q"
let &t_EI = "\<Esc>[2 q"

" Status Bar Settings
let g:airline_theme='tomorrow'
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_solarized_bg='dark'

" Trigger configuration. You need to change this to something other than <tab> if you use one of the following:
" - https://github.com/Valloric/YouCompleteMe
" - https://github.com/nvim-lua/completion-nvim
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<Tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-Tab>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsSnippetDirectories=["UltiSnips", "mysnippets"]

" Autopairs Disable Alt-p
execute "set <M-p>=\ep"
let g:AutoPairsShortcutToggle = '<M-p>'

" Add space in nerdcommenter
let g:NERDSpaceDelims = 1

set cursorline
autocmd WinEnter * setlocal cursorline
autocmd WinLeave * setlocal nocursorline

" [Mappings]
"
" Very Magic Regexes
"nnoremap / /\v
"vnoremap / /\v

" Turn on Relative Line Numbering & Line Numbering
nmap <F3> :set norelativenumber!<CR> " toggle relativenumber

" Press * to search for the term under the cursor or a visual selection
" and then press a key below to replace all instances of it in the file
" <leader>r to replace and <leader>rc to replace with prompting
nnoremap <leader>r :%s///g<left><left>
nnoremap <leader>rc :%s///gc<left><left><left>

" The same as above except instead of acting on the whole file, it will be
" restricted to the previously visually selected range. 
xnoremap <leader>r :s///g<left><left>
xnoremap <leader>rc :s///gc<left><left><left>

" Source the ~/.vimrc file
nnoremap <C-r> :source $MYVIMRC<CR>

" Toggle Hexokinase
map <C-h> :HexokinaseToggle<CR>

" Copy & Paste to/from external sources
map <leader>c "+y
map <leader>p "+p
vmap <leader>c "+yi
vmap <leader>x "+x
"vmap <C-v> c<ESC>"+p
"imap <C-v> <C-r><C-o>+

" Allows to insert flags like -g into RipGrep commands
command! -bang -nargs=* Rg call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case " . <q-args>, 1, <bang>0)

" Insert date in normal and insert mode
nnoremap <F5> "=strftime("%d-%m-%Y %H:%M %z")<Space><CR>P
inoremap <F5> <C-R>=strftime("%d-%m-%Y %H:%M %z") <CR>

" Spell Check Toggle
nnoremap <silent> <F12> :setlocal spell!<CR>
inoremap <F12> <C-O>:setlocal spell!<CR>

" Show list of buffer 
noremap <silent> <C-l> :ls<CR>

" Wipereg to clear registers
command! WipeReg for i in range(34,122) | silent! call setreg(nr2char(i), []) | endfor

" Turn on or off the list option (For showing EOL etc)
noremap <F6> :set list! nolist?<CR>
 
" Press F4 to toggle highlighting on/off, and show current value.
noremap <F4> :set hlsearch! hlsearch?<CR>

" Toggle cursorcolumn
nnoremap <leader>/ :set cursorcolumn! cursorcolumn?<CR>

" move updown by visual (wrapped) lines
noremap j gj
noremap k gk

" Bubble single line
nmap <C-Up> :m .-2<CR>
nmap <C-Down> :m  .+1<CR>

" Bubble multiple lines
vnoremap <silent> <C-Up>  @='"zxk"zP`[V`]'<CR>
vnoremap <silent> <C-Down>  @='"zx"zp`[V`]'<CR>
 
" Zoom for Splits
noremap Zz <c-w>_ \| <c-w>\|
noremap Zo <c-w>=

" source $MYVIMRC reloads the saved $MYVIMRC
nmap <leader>s :source $MYVIMRC<CR>

" opens $MYVIMRC for editing, or use :tabedit $MYVIMRC
nmap <Leader>v :e $MYVIMRC<CR>

" Add filename and path in insert mode 
inoremap <Leader>fn <C-R>=expand("%:p")<CR> 
 
" Open file under cursor with Ctrl-o
map <C-o> :let mycurf=expand("<cfile>")<cr><c-w> w :execute("e ".mycurf)<cr><c-w>p

" Auto Commands
au BufNewFile,BufRead *.md,*.markdown,*.mdown,*.mkd,*.mkdn,*.mdwn  set ft=markdown

" Vimwiki
command! Diary VimwikiDiaryIndex
augroup vimwikigroup
    autocmd!

" Navigate the complete menu items like CTRL+n / CTRL+p would.
inoremap <expr> <Down> pumvisible() ? "<C-n>" :"<Down>"
inoremap <expr> <Up> pumvisible() ? "<C-p>" : "<Up>"
"
" " Select the complete menu item like CTRL+y would.
inoremap <expr> <Right> pumvisible() ? "<C-y>" : "<Right>"
inoremap <expr> <CR> pumvisible() ? "<C-y>" :"<CR>"
"
" " Cancel the complete menu item like CTRL+e would.
inoremap <expr> <Left> pumvisible() ? "<C-e>" : "<Left>""

" Cycle through buffers
nnoremap <silent> <S-Left> :bprevious<CR>
nnoremap <silent> <S-Right> :bnext<CR>

" Select buffer to go to
execute "set <M-b>=\eb"
nnoremap <M-b> :Buffers<CR>

" automatically update links on read diary
autocmd BufRead,BufNewFile diary.wiki VimwikiDiaryGenerateLinks
augroup end

" Set executable bit on scripts
au BufWritePost * if getline(1) =~ "^#!" | if getline(1) =~ "/bin/" | silent execute "!chmod +x <afile>" | endif | endif

augroup auto_wrap_comments
  " Set textwidth to 75 when editing
  autocmd User SyntaxCommentEnterI setlocal textwidth=75
  " Remove it again when leaving insert mode
  autocmd User SyntaxCommentLeaveI setlocal tw=0
augroup END

" FERN Initialisation and keybindings

" Disable netrw
"let g:loaded_netrw=1
"let g:loaded_netrwPlugin=1
"let g:loaded_netrwSettings=1
"let g:loaded_netrwFileHandlers=1


" Custom settings and mappings
let g:fern#disable_default_mappings = 1
let g:fern#renderer = "nerdfont"

noremap <silent> <leader>f :Fern . -drawer -reveal=% -width=30 -toggle<CR><C-w>=

function! FernInit() abort
    nmap <buffer><expr>
                \ <Plug>(fern-my-open-expand-collapse)
                \ fern#smart#leaf(
                \ "\<Plug>(fern-action-open:select)",
                \ "\<Plug>(fern-action-expand)",
                \ "\<Plug>(fern-action-collapse)",
                \ )

nmap <buffer> <CR> <Plug>(fern-my-open-expand-collapse)
nmap <buffer> <2-LeftMouse> <Plug>(fern-my-open-expand-collapse)
nmap <buffer> o <Plug>(fern-action-open)
nmap <buffer> n <Plug>(fern-action-new-path)
nmap <buffer> d <Plug>(fern-action-remove)
nmap <buffer> m <Plug>(fern-action-move)
nmap <buffer> M <Plug>(fern-action-rename)
nmap <buffer> h <Plug>(fern-action-hidden:toggle)
nmap <buffer> r <Plug>(fern-action-reload)
nmap <buffer> k <Plug>(fern-action-mark:toggle)
nmap <buffer> b <Plug>(fern-action-open:split)
nmap <buffer> v <Plug>(fern-action-open:vsplit)
nmap <buffer> < <Plug>(fern-action-leave)
nmap <buffer> > <Plug>(fern-action-enter)
endfunction

augroup FernGroup
    autocmd!
    autocmd FileType fern setlocal norelativenumber | setlocal nonumber | call FernInit()
augroup END

function! s:fern_settings() abort
  nmap <silent> <buffer> p     <Plug>(fern-action-preview:toggle)
  nmap <silent> <buffer> <C-p> <Plug>(fern-action-preview:auto:toggle)
  nmap <silent> <buffer> <C-d> <Plug>(fern-action-preview:scroll:down:half)
  nmap <silent> <buffer> <C-u> <Plug>(fern-action-preview:scroll:up:half)
endfunction

augroup fern-settings
  autocmd!
  autocmd FileType fern call s:fern_settings()
augroup END

function! s:isAtStartOfLine(mapping)
  let text_before_cursor = getline('.')[0 : col('.')-1]
  let mapping_pattern = '\V' . escape(a:mapping, '\')
  let comment_pattern = '\V' . escape(substitute(&l:commentstring, '%s.*$', '', ''), '\')
  return (text_before_cursor =~? '^' . ('\v(' . comment_pattern . '\v)?') . '\s*\v' . mapping_pattern . '\v$')
endfunction

inoreabbrev <expr> <bar><bar>
          \ <SID>isAtStartOfLine('\|\|') ?
          \ '<c-o>:TableModeEnable<cr><bar><space><bar><left><left>' : '<bar><bar>'
inoreabbrev <expr> __
          \ <SID>isAtStartOfLine('__') ?
          \ '<c-o>:silent! TableModeDisable<cr>' : '__'

" Allow files to be saved as root when forgetting to start Vim using sudo.
command W :execute ':silent w !sudo tee % > /dev/null' | :edit!

" Abbreviations

ab ph Patrick Heffernan
ab em Patrick Heffernan <patrick4370@bigpond.com>

