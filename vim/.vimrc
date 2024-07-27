" myvimrc /home/patrick/.vimrc

" 31/May/2024 21:54
"
" New .vimrc file that has been through a huge tidy up
"
" Author: Patrick Heffernan
"  Email: <patrick4370@bigpond.com>

" [General Options]
filetype plugin indent on
runtime macros/matchit.vim
packadd! matchit
syntax on

set autoindent
set backspace=indent,eol,start
set belloff=all
set clipboard^=unnamed,unnamedplus
set complete+=k
set completeopt=menu
" set dictionary+=/usr/share/dict/british-english
set encoding=UTF-8
set expandtab
set foldlevel=99
set formatoptions+=t
set formatoptions-=cro
set grepprg=rg\ --vimgrep\ --smart-case\ --follow
set hidden
set history=500
set hlsearch
set ignorecase
set incsearch
set laststatus=2
set listchars=trail:·,eol:$,tab:>.,extends:>,precedes:<
set modeline
set mouse=nvi
set noshowcmd
set noshowmode
set nrformats+=alpha
set number
set numberwidth=3
set pastetoggle=<F2>
set path+=**
set relativenumber
set ruler
set rulerformat=%l,%c%V%=%P
set sessionoptions=blank,buffers,curdir,folds,globals,help,terminal
set shiftwidth=4
set shortmess+=f
set shortmess-=S
set showcmd
set showmatch
set showtabline=0
set smartcase
set softtabstop=4
set spellfile=~/.vim/spell/en.utf-8.add
set spellfile+=~/.vim/spell/jargon.utf-8.add
set spelllang=en_au
set splitright
set visualbell
set t_vb=       " Helps disable the annoying flicker when sourcing .vimrc
set tabstop=4
set showtabline=2
set term=xterm-256color " Needed to fix problem with HOME key
set termguicolors
set textwidth=75
" set virtualedit+=all
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe
set wildmenu
set wildmode=full
set wildoptions=pum
set wrap linebreak nolist

" [Plugin Manager.]
call plug#begin()

Plug 'PotatoesMaster/i3-vim-syntax'
Plug 'preservim/nerdtree', {'on': 'NERDTreeToggle'}
Plug 'ryanoasis/vim-devicons'
Plug 'dstein64/vim-startuptime'
Plug 'SirVer/ultisnips'
Plug 'ap/vim-buftabline'
Plug 'nvie/vim-flake8', {'for': 'python'}
Plug 'sillybun/vim-repl', {'for': 'python'}
Plug 'christoomey/vim-tmux-navigator'
Plug 'dhruvasagar/vim-table-mode'
Plug 'vimwiki/vimwiki'
Plug 'farmergreg/vim-lastplace'
Plug 'haya14busa/is.vim'
Plug 'honza/vim-snippets'
Plug 'jannis-baum/vivify.vim', {'for': 'markdown'}
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/fzf.vim'
Plug 'mattn/vim-lsp-settings'
Plug 'mhinz/vim-grepper'
Plug 'nanotee/zoxide.vim'
Plug 'nelstrom/vim-visual-star-search'
Plug 'pacha/vem-statusline'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'romainl/vim-qf'
Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }
" Plug 'sainnhe/sonokai'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'vim-scripts/AutoComplPop'
" Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'catppuccin/vim', { 'as': 'catppuccin' }
                                            
call plug#end()
 
" map leader
let mapleader = ','

" Important!!
if has('termguicolors')
    set termguicolors
endif

" The configuration options should be placed before `colorscheme sonokai`.
" Schemes : default, atlantis, andromeda, shusia, maia, espresso
" let g:sonokai_style = 'atlantis'
" let g:sonokai_better_performance = 1
" let g:sonokai_cursor='auto'

" Colours
set t_Co=256
colorscheme catppuccin_mocha 
set background=dark

" Change some colours to match what I want.
highlight VemStatusLineBranch       cterm=none ctermfg=117 ctermbg=237 guifg=#1793D1 guibg=#3a3a3a gui=bold
highlight VemStatusLineFileModified cterm=bold ctermfg=192 ctermbg=237 guifg=#d70000 guibg=#3a3a3a gui=bold
highlight VemStatusLineFileRO       cterm=bold ctermfg=192 ctermbg=237 guifg=#d70000 guibg=#3a3a3a gui=bold
highlight VemStatusLineMode         cterm=none ctermfg=141 ctermbg=237 guifg=#1793D1 guibg=#3a3a3a gui=bold
highlight VemStatusLineModeInsert   cterm=none ctermfg=117 ctermbg=237 guifg=#1793D1 guibg=#3a3a3a gui=bold
highlight VemStatusLinePosition     cterm=none ctermfg=34  ctermbg=237 guifg=#00af00 guibg=#3a3a3a gui=bold
highlight VemStatusLineSeparator    cterm=none ctermfg=241 ctermbg=237 guifg=#626262 guibg=#3a3a3a gui=none

highlight clear ColorColumn
highlight clear CursorColumn
highlight clear CursorLine
highlight clear CursorLineNr
highlight clear LineNr
highlight clear NonText
highlight clear SignColumn
highlight clear Specialkey
highlight clear SpellBad
highlight clear SpellCap
highlight clear SpellLocal
highlight clear SpellRare
highlight clear StatusLine
highlight clear Visual
highlight clear WildMenu

highlight ColorColumn               ctermbg=240
highlight CursorColumn              ctermbg=240
highlight CursorLine                ctermbg=240
highlight CursorLineNr              ctermbg=236 ctermfg=15
highlight LineNr                    ctermfg=7 ctermbg=236
highlight NonText                   ctermfg=245
highlight SignColumn                ctermbg=236
highlight Specialkey                ctermfg=245
highlight SpellBad                  cterm=underline ctermfg=9
highlight SpellCap                  ctermfg=14
highlight SpellLocal                ctermfg=10
highlight SpellRare                 ctermfg=12
highlight StatusLine                guibg=#3a3a3a ctermbg=237
highlight Visual                    cterm=none ctermbg=28
highlight WildMenu                  ctermbg=26 ctermfg=15

highlight BufTabLineCurrent         cterm=none ctermfg=15 ctermbg=26
highlight BufTabLineActive          cterm=none ctermfg=15 ctermbg=26
highlight BufTabLineHidden          cterm=none ctermfg=15 ctermbg=240
highlight BufTabLineFill            cterm=none ctermfg=0  ctermbg=236
highlight BufTabLineModifiedHidden  cterm=none ctermfg=15 ctermbg=26
highlight BufTabLineModifiedCurrent cterm=none ctermfg=15 ctermbg=26
highlight BufTabLineModifiedActive  cterm=none ctermfg=15 ctermbg=26

" BufTabLine & Buffer key maps
let buftabline_show=1
let g:buftabline_numbers=1
let g:buftabline_indicators=1
let g:buftabline_separators=1
let g:vem_statusline_filename_format='p'

" Change buffers
nnoremap <Leader>b :Buffers<CR>

" Close all buffers except the active one
command BufOnly silent! execute "%bd|e#|bd#"
nnoremap <silent> <leader>cb :BufOnly<CR>

" Cycle through buffers
nnoremap <silent> <C-N> :bnext<CR>
nnoremap <silent> <C-P> :bprev<CR>

" Zoxide
let g:zoxide_prefix = 'jump'
let g:zoxide_executable='/usr/bin/zoxide'

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
let g:vimwiki_list = [{'path': '~/Documents/Vimwiki_md/', 'syntax': 'markdown', 'ext': '.md', 'links_space_char': '_'}]

let g:vimwiki_listsyms = ' ✗○●✓'
let g:vimwiki_markdown_link_ext = 1
let g:vimwiki_global_ext = 0
let g:vimwiki_automatic_nested_syntaxes = 1
let g:vimwiki_dir_link = 'index'

" Vimwiki Header Colours
hi VimwikiHeader1 guifg=#2C97E9
hi VimwikiHeader2 guifg=#2C97E9
hi VimwikiHeader3 guifg=#2C97E9

" Vimwiki
command! Diary VimwikiDiaryIndex
augroup vimwikigroup
    autocmd!

" automatically update links on read diary
autocmd BufRead,BufNewFile diary.wiki VimwikiDiaryGenerateLinks
augroup end

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

" Autopairs Disable Alt-p
execute "set <M-p>=\ep"
let g:AutoPairsShortcutToggle = '<M-p>'

" Add space in nerdcommenter
let g:NERDSpaceDelims = 1
let g:NERDTrimTrailingWhitespace = 1
let g:NERDToggleCheckAllLines = 1

set cursorline
autocmd WinEnter * setlocal cursorline
autocmd WinLeave * setlocal nocursorline

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

nnoremap <leader>H :HexokinaseToggle<CR>

if has ('autocmd')
    augroup vimrc     
        autocmd! BufWritePost $MYVIMRC source % | echom "Reloaded " . $MYVIMRC | redraw
        autocmd! BufWritePost $MYGVIMRC if has('gui_running') | so % | echom "Reloaded " . $MYGVIMRC | endif | redraw
    augroup END
endif 

" Markdown Preview Vivify
nnoremap <C-F4> :Vivify<CR>

" Autocomplete disable New Line
inoremap <expr> <CR> pumvisible() ? "\<C-Y>" : "\<CR>"

" Toggle Hexokinase
map <C-S-h> :HexokinaseToggle<CR>

" Insert date in normal and insert mode
nnoremap <F5> i<C-R>=strftime("%d/%B/%Y %H:%M")<CR><Space><ESC>
inoremap <F5> <C-R>=strftime("%d/%B/%Y %H:%M")<CR><Space>

" Spell Check Toggle
nnoremap <silent> <F12> :setlocal spell!<CR>
inoremap <F12> <C-O>:setlocal spell!<CR>

" Wipereg to clear registers
command! WipeReg for i in range(34,122) | silent! call setreg(nr2char(i), []) | endfor

" Turn on or off the list option (For showing EOL etc)
noremap <F6> :set list! nolist?<CR>

" Press F4 to toggle highlighting on/off, and show current value.
noremap <F4> :set hlsearch! hlsearch?<CR>

" Toggle cursorcolumn
nnoremap <F11> :set cursorcolumn! cursorcolumn?<CR>

" move updown by visual (wrapped) lines
noremap j gj
noremap k gk

" opens $MYVIMRC for editing, or use :tabedit $MYVIMRC
nmap <Leader>v :e $MYVIMRC<CR>

" Add filename and path in insert mode
inoremap <Leader>fn <C-R>=expand("%:p")<CR>

" Set filetype to Markdown
au BufNewFile,BufRead *.md,*.markdown,*.mdown,*.mkd,*.mkdn,*.mdwn  set ft=markdown

" Set executable bit on scripts
au BufWritePost * if getline(1) =~ "^#!" | if getline(1) =~ "/bin/" | silent execute "!chmod +x <afile>" | endif | endif

augroup auto_wrap_comments
  " Set textwidth to 75 when editing
  autocmd User SyntaxCommentEnterI setlocal textwidth=75
  " Remove it again when leaving insert mode
  autocmd User SyntaxCommentLeaveI setlocal tw=0
augroup END

" Vim Table Mode
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

" Ultisnips
let g:UltiSnipsSnippetDirectories=["UltiSnips"]
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
let UltiSnipsEditSplit="vertical"

nmap <leader>e :UltiSnipsEdit

" Window Zoom
function! WindowUnzoom()
  if !exists('w:zoomed')
    echo 'Could not unzoom'
  else
    unlet w:zoomed
    wincmd =
  endif
endfunction

function! WindowZoom()
  if exists('w:zoomed')
    call WindowUnzoom()
  else
    let w:zoomed = 'TRUE'
    wincmd |
    wincmd _
  endif
endfunction

autocmd  WinLeave,TabLeave * if exists('w:zoomed') | silent! call WindowUnzoom() | endif

nnoremap <silent> <C-w>z :call WindowZoom()<CR>

" Abbreviations
ab ph Patrick Heffernan
ab em Patrick Heffernan <patrick4370@bigpond.com>

" Line wrap, linebreak and nolist on for wrapping
command! -nargs=* Wrap set wrap linebreak nolist

" Navigate quickfix list with ease
nnoremap <silent> [q :cprevious<CR>
nnoremap <silent> ]q :cnext<CR>

" fzf stuff
let g:fzf_history_dir = '~/.local/share/fzf-history'
let g:fzf_layout = { 'down': '25%' }

autocmd! FileType fzf
autocmd  FileType fzf set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler

command! -bang -nargs=* Rg call fzf#vim#grep("rg --column --line-number --no-heading --color=always --vimgrep --follow ".<q-args>, 1, <bang>0)

" Resize windows
nnoremap <C-right> :vertical resize -5<cr>
nnoremap <C-down> :resize +5<cr>
nnoremap <C-up> :resize -5<cr>
nnoremap <C-left> :vertical resize +5<cr>

" When you forget to open vim as root
command Sw :execute ':silent w !sudo tee % > /dev/null' | :edit!

" NERDTree
nnoremap <C-n> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFocus<CR>
let g:NERDTreeFileLines = 1

" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | call feedkeys(":quit\<CR>:\<BS>") | endif
