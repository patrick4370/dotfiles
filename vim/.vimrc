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
set clipboard^=unnamed,unnamedplus                          
set complete+=kspell                                        
set completeopt=menuone,noselect,preview,popup              
set dictionary+=/usr/share/dict/british-english 
set expandtab                                               
set foldlevel=99
set formatoptions+=t
set formatoptions-=cro                                      
set hidden                                                  
set history=500
set hlsearch                                                
set ignorecase                                              
set incsearch                                               
set laststatus=2                                            
set listchars=trail:·,eol:¬,tab:>.                          
set modeline                                                
set noshowcmd                                               
set noshowmode                                              
set nrformats+=alpha                                        
set number                                                  
set omnifunc=syntaxcomplete#Complete                        
set pastetoggle=<F2>                                        
set path+=**                                                
set relativenumber                                          
set sessionoptions=blank,buffers,curdir,folds,globals,help,terminal
set shiftwidth=4                                            
set shortmess+=f                                            
set showcmd                                                 
set showmatch                                               
set showtabline=0                                           
set smartcase                                               
set softtabstop=4                                           
set spellfile=~/.vim/spell/en.utf-8.add
set spellfile+=~/.vim/spell/jargon.utf-8.add
set spelllang=en_au                                         
set splitright                                              
set tabstop=4                                               
set showtabline=2
set term=xterm-256color
set termguicolors                                           
set textwidth=75
set virtualedit+=all
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe
set wildmenu                                                
set wildmode=full                                           
set wrap linebreak nolist

" [Plugin Manager.] 
call plug#begin()

Plug 'PotatoesMaster/i3-vim-syntax'                                                 
Plug 'SirVer/ultisnips'                                         
Plug 'ap/vim-buftabline'                                        
Plug 'christoomey/vim-tmux-navigator'                           
Plug 'dhruvasagar/vim-table-mode'                               
Plug 'dhruvasagar/vim-table-mode'                               
Plug 'farmergreg/vim-lastplace'                                 
Plug 'haya14busa/is.vim'                                        
Plug 'honza/vim-snippets'                                       
Plug 'itchyny/vim-gitbranch'                                    
Plug 'jannis-baum/vivify.vim'                                   
Plug 'jiangmiao/auto-pairs'                                     
Plug 'lambdalisue/fern.vim'                                     
Plug 'lambdalisue/nerdfont.vim'                                 
Plug 'lambdalisue/vim-fern-git-status'
Plug 'lambdalisue/vim-fern-hijack'
Plug 'lambdalisue/vim-fern-renderer-nerdfont'
Plug 'lambdalisue/vim-suda'
Plug 'mattn/vim-lsp-settings'                                   
Plug 'nanotee/zoxide.vim'                                       
Plug 'nelstrom/vim-visual-star-search'                          
Plug 'pacha/vem-statusline'                                     
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/vim-lsp'                                               
Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }
Plug 'sainnhe/sonokai'
Plug 'scrooloose/nerdcommenter'                                             
Plug 'skywind3000/asyncrun.vim'  " If you prefer async behaviour
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-repeat'                                                     
Plug 'tpope/vim-surround'                                                   
Plug 'vim-scripts/AutoComplPop'
Plug 'vimwiki/vimwiki'                                                      
Plug 'yuki-yano/fern-preview.vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-unimpaired'
Plug 'romainl/vim-qf'

call plug#end()

" map leader
let mapleader = ','

" Important!!
if has('termguicolors')
    set termguicolors
endif

" The configuration options should be placed before `colorscheme sonokai`.
" Schemes : default, atlantis, andromeda, shusia, maia, espresso
let g:sonokai_style = 'atlantis'
let g:sonokai_better_performance = 1
let g:sonokai_cursor='auto'

" Colours
set t_Co=256 
colorscheme sonokai
set background=dark
                   
" Change some colours to match what I want.
highlight VemStatusLineBranch       cterm=none ctermfg=117 ctermbg=237 guifg=#1793D1 guibg=#3a3a3a gui=bold
highlight VemStatusLineFileModified cterm=bold ctermfg=192 ctermbg=237 guifg=#d70000 guibg=#3a3a3a gui=bold
highlight VemStatusLineFileRO       cterm=bold ctermfg=192 ctermbg=237 guifg=#d70000 guibg=#3a3a3a gui=bold
highlight VemStatusLineMode         cterm=none ctermfg=141 ctermbg=237 guifg=#1793D1 guibg=#3a3a3a gui=bold
highlight VemStatusLineModeInsert   cterm=none ctermfg=117 ctermbg=237 guifg=#1793D1 guibg=#3a3a3a gui=bold
highlight VemStatusLinePosition     cterm=none ctermfg=34  ctermbg=237 guifg=#00af00 guibg=#3a3a3a gui=bold
highlight VemStatusLineSeparator    cterm=none ctermfg=241 ctermbg=237 guifg=#626262 guibg=#3a3a3a gui=none

highlight clear CursorColumn
highlight clear CursorLine 
highlight clear CursorLineNr
highlight clear LineNr
highlight clear SignColumn
highlight clear SpellBad
highlight clear SpellCap
highlight clear SpellLocal
highlight clear SpellRare
highlight clear StatusLine
highlight clear Visual
highlight clear WildMenu

highlight CursorColumn              ctermbg=240
highlight CursorLine                ctermbg=240
highlight CursorLineNr              ctermbg=236 ctermfg=15
highlight LineNr                    ctermfg=7 ctermbg=236
highlight SignColumn                ctermbg=236
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

nnoremap <Leader>b :buffers<CR>:buffer<Space>
 
" Close all buffers except the active one
command BufOnly silent! execute "%bd|e#|bd#"
nnoremap <silent> <leader>cb :BufOnly<CR>

" Cycle through buffers
nnoremap <silent> <C-N> :bnext<CR>
nnoremap <silent> <C-P> :bprev<CR>

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

:map <Home> <esc>0a
:imap <Home> <Esc>^i

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

" Source the ~/.vimrc file after writing the buffer to file
if has("autocmd")
    autocmd BufWritePost .vimrc source $MYVIMRC
endif

" Markdown Preview Vivify
nnoremap <C-F4> :Vivify<CR>

" Toggle Hexokinase
map <C-S-h> :HexokinaseToggle<CR>

" Copy & Paste to/from external sources
map <leader>c "+y
map <leader>p "+p
vmap <leader>c "+yi
vmap <leader>x "+x

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
nnoremap <leader>/ :set cursorcolumn! cursorcolumn?<CR>

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

" FERN Initialisation and keybindings

" Custom settings, mappings and highlights
let g:fern#disable_default_mappings = 1
let g:fern#renderer = "nerdfont"
highlight FernRootText                  cterm=none ctermfg=202 ctermbg=236
highlight FernMarkedText                cterm=none ctermfg=196 ctermbg=236
highlight FernLeafText                  cterm=none ctermfg=15  ctermbg=236
highlight FernBranchText                cterm=none ctermfg=15  ctermbg=236
highlight FernWindowSelectStatusLine    cterm=none ctermfg=15  ctermbg=36
highlight FernWindowSelectIndicator     cterm=none ctermfg=15  ctermbg=36

noremap <silent> <leader>f :Fern . -drawer -reveal=% -width=30 -toggle<CR>

function! FernInit() abort
    nmap <buffer><expr>
                \ <Plug>(fern-my-open-expand-collapse)
                \ fern#smart#leaf(
                \ "<Plug>(fern-action-open:select)",
                \ "\<Plug>(fern-action-expand)",
                \ "\<Plug>(fern-action-collapse)"
                \ )

    nmap <buffer> <CR> <Plug>(fern-my-open-expand-collapse)
    nmap <buffer> <2-LeftMouse> <Plug>(fern-my-open-expand-collapse)
    nmap <buffer> < <Plug>(fern-action-leave)
    nmap <buffer> > <Plug>(fern-action-enter)
    nmap <buffer> <left> <Plug>(fern-action-leave)
    nmap <buffer> <right> <Plug>(fern-action-enter)
    nmap <buffer> R <Plug>(fern-action-rename)
    nmap <buffer> H <Plug>(fern-action-open:split)
    nmap <buffer> V <Plug>(fern-action-open:vsplit)
    nmap <buffer> f <Plug>(fern-action-new-file)
    nmap <buffer> D <Plug>(fern-action-new-dir)
    nmap <buffer> h <Plug>(fern-action-hidden:toggle)
    nmap <buffer> k <Plug>(fern-action-mark:toggle)
    nmap <buffer> m <Plug>(fern-action-move)
    nmap <buffer> c <Plug>(fern-action-copy)
    nmap <buffer> o <Plug>(fern-action-open)
    nmap <buffer> r <Plug>(fern-action-reload)
    nmap <buffer> y <Plug>(fern-action-yank:path)
    nmap <buffer> <space> <Plug>(fern-action-mark)
    nmap <buffer> dd <Plug>(fern-action-trash)
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

nnoremap <Plug>(fern-close-drawer) :<C-u>FernDo close -drawer -stay<CR>
nmap <buffer><silent> <Plug>(fern-action-open-and-close)
      \ <Plug>(fern-action-open)
      \ <Plug>(fern-close-drawer)

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

" Sudu - Sudo for vim
let g:suda#prompt = 'Your password please: '

" Abbreviations
ab ph Patrick Heffernan
ab em Patrick Heffernan <patrick4370@bigpond.com>

command! -nargs=* Wrap set wrap linebreak nolist
