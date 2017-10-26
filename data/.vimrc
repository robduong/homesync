""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""
" VIMRC "
"""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Syntax Highlighting
" Dockerfile
" elm.vim
" javascript
" vim-javascript
" vim-jsx
" vim-markdown
" vim-rails
" vim-ruby

" File/Buffer finder
" ctrlp.vim
" nerdtree - File directory sidebar
" vim-buffergator
" ack.vim

" Autocomplete
" supertab
" deoplete.nvim
" deoplete-ruby
" deoplete-ternjs
" tern_for_vim

" Linting
" neomake
" syntastic

" Git
" vim-fugitive
" vim-gitgutter

" Other
" goyo.vim
" node
" pbcopy
" vim-bundler
" vim-numbertoggle
" vim-surround

set nocompatible

syntax on
filetype off

set rtp+=~/.vim/bundle/Vundle
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'junegunn/fzf.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'morhetz/gruvbox'
Plugin 'ervandew/supertab'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'jparise/vim-graphql'
Plugin 'sbdchd/neoformat'
Plugin 'derekwyatt/vim-scala'
Plugin 'w0rp/ale'
Plugin 'joshdick/onedark.vim'
Plugin 'sheerun/vim-polyglot'
Plugin 'alvan/vim-closetag'
Plugin 'itchyny/lightline.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'ryanoasis/vim-devicons'

call vundle#end()
filetype plugin indent on


set rtp+=/usr/local/opt/fzf
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim default "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Improve vim's scrolling speed
set ttyfast
set lazyredraw
set tabstop=2 "Two space tab
set shiftwidth=2 "Two space tab 
set wrap
set expandtab
set smartindent
set autoindent
set ruler
set ignorecase
set laststatus=2
set nofoldenable "no code folding
set hidden "buffer
set history=100
set relativenumber
set number
set updatetime=250 " GitGutter file check time(ms)
set tags=tags; " ctags


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Theme "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let $NVIM_TUI_ENABLE_TRUE_COLOR=1

"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif

"TODO: Move to solarized theme files
"These are solarized dark specific configurations
"hi StatusLine guibg=#586e75 guifg=#073642 ctermbg=yellow ctermfg=black
"hi StatusLineNC guibg=#586e75 guifg=#002b36 ctermbg=yellow ctermfg=black
"hi VertSplit guibg=#002b36 ctermbg=black ctermfg=black
"hi ColorColumn guibg=#013037 ctermbg=black
"hi TabLine ctermbg=black ctermfg=black
"hi TabLineSel ctermfg=none ctermbg=none
set fillchars=""
"let &colorcolumn=join(range(101,999),",") "Highlight 100+ column onwards

"TODO: Move to gruvbox theme files
"These are gruvbox dark specific configurations
"hi StatusLine guifg=#282828 guibg=#fabd30 ctermbg=yellow ctermfg=black
"hi StatusLineNC guifg=#282828 guibg=#fabd30 ctermbg=yellow ctermfg=black
"hi VertSplit guibg=#3c3836 ctermbg=black ctermfg=black
"hi ColorColumn guibg=#013037 ctermbg=black
"hi TabLine guibg=#3c3836 ctermbg=black ctermfg=black
"hi TabLineSel guibg=#3c3836 ctermfg=none ctermbg=none

let g:lightline = {
      \ 'colorscheme': 'onedark',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch' ], [ 'filename' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head',
      \   'filetype': 'MyFiletype',
      \   'fileformat': 'MyFileformat',
      \ },
      \ 'separator': { 'left': "\ue0b0", 'right': "\ue0b2" },
      \ 'subseparator': { 'left': "\ue0b1", 'right': "\ue0b3" },
      \ }

function! MyFiletype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype . ' ' . WebDevIconsGetFileTypeSymbol() : 'no ft') : ''
endfunction

function! MyFileformat()
  return winwidth(0) > 70 ? (&fileformat . ' ' . WebDevIconsGetFileFormatSymbol()) : ''
endfunction

set background=dark
colorscheme onedark


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Key Mappings "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader=","
inoremap jj <Esc> 
" Easier way to copy and paste from the global clipboard
map <Leader>p "+p
map <Leader>y "+y
" Y should act like C and D!
map Y y$ 
" Highlight trailing spaces
map <Leader>mt /^\t\+\\|\s\+$<CR> 
" json beautifier
nnoremap <Leader>z :%!jq '.'<CR><Paste>

" cycle through buffers
":nnoremap <Tab> :bnext<CR>:redraw<CR>:ls<CR>
":nnoremap <S-Tab> :bnext<CR>:redraw<CR>:ls<CR>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin Config "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""
" Ale "
"""""""
let g:ale_echo_msg_format = '%linter% >> %s'
let g:ale_sign_warning = '?' " could use emoji
let g:ale_statusline_format = ['X %d', '? %d', '']

let g:ale_linters = {'javascript': ['flow']}
let g:ale_lint_on_save = 1
let g:ale_fixers = {'javascript': ['prettier']}
let g:ale_fix_on_save = 1
let g:ale_set_highlights = 1

let g:ale_javascript_standard_use_global = 0
let g:ale_javascript_prettier_options = '--no-semi'
"""""""""""""
" React JSX "
"""""""""""""
let g:jsx_ext_required = 0

""""""""""""
" NerdTree "
""""""""""""
" NerdTree toggle
map <Leader>f :NERDTreeToggle<CR>
nmap <leader>F :NERDTreeFind<CR>
let NERDTreeMinimalUI=1
let NERDTreeQuitOnOpen = 1
let NERDTreeHijackNetrw=1
let NERDTreeDirArrows = 1

"""""""""
" CtrlP "
"""""""""
" Ignore some folders and files for CtrlP indexing
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git$\|\.yardoc\|public$|log\|tmp\|node_modules$',
  \ 'file': '\.so$\|\.dat$|\.DS_Store$'
  \ }

nmap <Leader>b :Buffers<CR>
nmap <Leader>o :Files<CR>
nmap <Leader>a :Ag<CR>
""""""""""""
" Deoplete "
""""""""""""
let g:deoplete#enable_at_startup = 1
if !exists('g:deoplete#omni#input_patterns')
  let g:deoplete#omni#input_patterns = {}
endif
" let g:deoplete#disable_auto_complete = 1
if has('nvim')
  autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
endif

"autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS

""""""""
" Tern "
""""""""
if exists('g:plugs["tern_for_vim"]')
  "let g:tern_show_argument_hints = 'on_hold'
  let g:tern_show_argument_hints = 1
  let g:tern_show_signature_in_pum = 1
  let g:tern_map_keys=1
  autocmd FileType javascript setlocal omnifunc=tern#Complete
endif

"autocmd FileType javascript nnoremap <silent> <buffer> <Leader>gb :TernDef<CR>
"autocmd FileType javascript nnoremap <silent> <buffer> <Leader>gt :TernType<CR>
"autocmd FileType javascript nnoremap <silent> <buffer> <Leader>gr :TernRef<CR>
"
"""""""""""
" Neomake "
"""""""""""
"autocmd! BufWritePost * Neomake
"let g:neomake_javascript_enabled_makers = ['eslint']
"let g:neomake_verbose = 0
"let g:neomake_open_list = 0
"map <Leader>c :copen<CR>


"""""""""""
" Ack.vim "
"""""""""""
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

let g:ack_autoclose=1
cnoreabbrev Ack Ack!
"nnoremap <Leader>a :Ack!<Space>

"""""""""""
" FZF.vim "
"""""""""""
" Augmenting Ag command using fzf#vim#with_preview function
"   * fzf#vim#with_preview([[options], preview window, [toggle keys...]])
"     * For syntax-highlighting, Ruby and any of the following tools are required:
"       - Highlight: http://www.andre-simon.de/doku/highlight/en/highlight.php
"       - CodeRay: http://coderay.rubychan.de/
"       - Rouge: https://github.com/jneen/rouge
"
"   :Ag  - Start fzf with hidden preview window that can be enabled with "?" key
"   :Ag! - Start fzf in fullscreen and display the preview window above
command! -bang -nargs=* Ag
  \ call fzf#vim#ag(<q-args>,
  \                 <bang>0 ? fzf#vim#with_preview('up:60%')
  \                         : fzf#vim#with_preview('right:50%:hidden', '?'),
  \                 <bang>0)

" Likewise, Files command with preview window
command! -bang -nargs=? -complete=dir Files
  \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
