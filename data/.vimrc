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

execute pathogen#infect()
syntax on
filetype off
filetype plugin indent on


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
set background=dark
colorscheme gruvbox


let $NVIM_TUI_ENABLE_TRUE_COLOR=1

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
hi StatusLine guifg=#282828 guibg=#fabd30 ctermbg=yellow ctermfg=black
hi StatusLineNC guifg=#282828 guibg=#fabd30 ctermbg=yellow ctermfg=black
hi VertSplit guibg=#3c3836 ctermbg=black ctermfg=black
hi ColorColumn guibg=#013037 ctermbg=black
hi TabLine guibg=#3c3836 ctermbg=black ctermfg=black
hi TabLineSel guibg=#3c3836 ctermfg=none ctermbg=none


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
"""""""""""""
" React JSX "
"""""""""""""
let g:jsx_ext_required = 0

""""""""""""
" NerdTree "
""""""""""""
" NerdTree toggle
map <Leader>f :NERDTreeToggle<CR>
let NERDTreeMinimalUI=1
let NERDTreeHijackNetrw=1

"""""""""
" CtrlP "
"""""""""
" Ignore some folders and files for CtrlP indexing
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git$\|\.yardoc\|public$|log\|tmp\|node_modules$',
  \ 'file': '\.so$\|\.dat$|\.DS_Store$'
  \ }

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
autocmd! BufWritePost * Neomake
let g:neomake_javascript_enabled_makers = ['eslint']
let g:neomake_verbose = 0
let g:neomake_open_list = 0
map <Leader>c :copen<CR>


"""""""""""
" Ack.vim "
"""""""""""
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

let g:ack_autoclose=1
cnoreabbrev Ack Ack!
nnoremap <Leader>a :Ack!<Space>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
