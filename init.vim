" COMPATIBILITY?
" if &compatible
"  set nocompatible
" endif

set runtimepath+=~/Applications/dein/repos/github.com/Shougo/dein.vim

" LOAD PLUGINS
if dein#load_state('~/.config/nvim/dein/')
  call dein#begin('~/.config/nvim/dein/')

  call dein#add('scrooloose/nerdcommenter')
  call dein#add('vim-scripts/vim-auto-save')
  call dein#add('nathanaelkane/vim-indent-guides')
  call dein#add('airblade/vim-gitgutter')
  call dein#add('cloudhead/neovim-fuzzy')
  call dein#add('rhysd/nyaovim-tree-view')
  call dein#add('spolu/dwm.vim')
  call dein#add('easymotion/vim-easymotion')
  "call dein#add('jalvesaq/Nvim-R')
  call dein#add('~/Core/code/R/ad-hoc/Nvim-R/')

  call dein#add('joshdick/onedark.vim')
  "call dein#add('itchyny/lightline.vim')
  call dein#add('vim-airline/vim-airline')
  call dein#add('sheerun/vim-polyglot')
  call dein#add('Shougo/deoplete.nvim')
  call dein#add('SirVer/ultisnips')
  call dein#add('chrisbra/csv.vim')

  " Python stuff
  call dein#add('tmhedberg/SimpylFold')
  "call dein#add('vim-scripts/indentpython.vim')
  "call dein#add('vim-syntastic/syntastic')
  call dein#add('Konfekt/FastFold')
  "call dein#add('nvie/vim-flake8')
  call dein#add('thinca/vim-quickrun')
  call dein#add('zchee/deoplete-jedi')

  " My plugin stuff
  call dein#add("~/Core/code/python/vim-plugins/1-magrittr-chain-run/")

  "Previously used plugins
  "call dein#add('pangloss/vim-javascript')
  "call dein#add('Valloric/YouCompleteMe')
  "call dein#add('marijnh/tern_for_vim')
  "call dein#add('elzr/vim-json')
  "call dein#add('ntpeters/vim-better-whitespace')
  "call dein#add('mxw/vim-jsx')
  "call dein#add('Chiel92/vim-autoformat')
  "call dein#add('altercation/vim-colors-solarized')
  "call dein#add('jelera/vim-javascript-syntax')
  "call dein#add('dhruvasagar/vim-table-mode')

  call dein#remote_plugins()
  call dein#end()
  call dein#save_state()
endif

" BASE VIM
" Super global options - enable core things
filetype plugin indent on
syntax enable
inoremap <CapsLock> <Esc>
au BufNew,BufNewFile,BufRead * set shiftwidth=2 softtabstop=2 shiftwidth=2 expandtab
let mapleader=","
let maplocalleader=" "
set ignorecase

" Syntax stuff
let python_highlight_all=1
let g:r_syntax_folding = 1
set foldlevelstart=20

" colors
"let g:onedark_termcolors=256
"let g:lightline = {
  "\ 'colorscheme': 'onedark',
  "\ }
colorscheme onedark
"set t_Co=256
"set background=dark
"colorscheme industry

" Relative numbering
function! NumberToggle()
  if(&relativenumber == 1)
    set nornu
    set number
  else
    set rnu
  endif
endfunc

call NumberToggle()

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

"function! Smart_TabComplete()
  "let line = getine('.') " current line
  "let substr = strpart(line, -1, col('.') + 1) " from the start of the current line to on character right of the cursor
  "matchstr(substr, "[^ \t]*$") " word till cursor
  "if (strlen(substr)==0) " nothing to match on empty string
    "return "\<tab>"
  "endif
  "let has_period = match(substr, '\.') != -1 " position of period, if any
  "let has_slash = match(substr, '\/') != -1 " position of slash, if any
  "if(!has_period && !has_slash)
    "return "\<C-X><C-P>" " existing text matching
  "elseif ( has_slash )
      "return "\<C-X>\<C-F>" " file matching
  "else     return "\<C-X>\<C-O>" " plugin matching
  "endif
"endfunction

" PLUGIN CUSTOMIZATION

" Autosave plugin
let g:auto_save=1

" deoplete - intellisense completion stuff
let g:deoplete#enable_at_startup = 1

" deoplete tab-complete
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
let g:deoplete#sources#jedi#python_path = "/usr/local/bin/python3"

" NVIM R - assign shortcut
let R_assign = 2
let g:R_csv_app = "open-with-excel"

" Set up syntastic config
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0

"let g:syntastic_mode_map = {
  "\ "mode": "passive",
  "\ "active_filetypes": [],
  "\ "passive_filetypes": [] }


" Python config
"au BufNewFile,BufRead *.py 
au BufNewFile,BufRead,BufEnter *.py 
      \ set tabstop=4 softtabstop=4 shiftwidth=4 textwidth=79 expandtab autoindent fileformat=unix |
      \ nnoremap <leader>y :0,$!yapf<cr>
au CompleteDone * pclose " close preview window when completion finishes :'D
let g:quickrun_config = {}
let g:quickrun_config.python = {'command' : 'python3' }
nmap <silent> <leader>x <Plug>(quickrun-op)
set splitright

" For neovim-fuzzy
nnoremap <C-p> :FuzzyOpen<CR>

function! FzyCommand(choice_command, vim_command)
  try
    let output = system(a:choice_command . " | fzy ")
  catch /Vim:Interrupt/
    " Swallow errors from ^C, allow redraw! below
  endtry
  redraw!
  if v:shell_error == 0 && !empty(output)
    exec a:vim_command . ' ' . output
  endif
endfunction

" SHORTCUTS
vnoremap // y/<C-R>"<CR>
nnoremap <LocalLeader>sc :SyntasticCheck<CR>
nnoremap <LocalLeader>e :call FzyCommand("ag . --silent -l -g ''", ":e")<cr>

" Toggle between normal and relative numbering.
nnoremap <LocalLeader>nt :call NumberToggle()<cr>

"Previously tied to plugin?
"noremap <F3> :Autoformat<CR>
nnoremap <LocalLeader>j :set filetype=json <bar> execute '%!python -m json.tool'<CR>
nnoremap <LocalLeader>jm :execute '%!json-minify'<CR>
nnoremap <LocalLeader>jj "*p:set filetype=json <bar> execute '%!python -m json.tool'<CR>
nnoremap <LocalLeader>yy gg"*yG<C-o><C-o>
vnoremap <LocalLeader>y "*y
vnoremap <LocalLeader>p "*p
nnoremap <LocalLeader>hd :!(cd ~/IdeaProjects/jarvis-singleview-frontend; gulp deploy:hot)<CR>
nnoremap <LocalLeader>f :FuzzyGrep<CR>
nnoremap <LocalLeader>m :call RunMagrittrChain()<CR>
nnoremap <LocalLeader>M :call RunFullMagrittrChain()<CR>
"nnoremap <LocalLeader>nt :!npm test<CR>
inoremap >> <Space>%>%<CR>
nnoremap <CR> za
let g:UltiSnipsExpandTrigger="<s-tab>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
let g:SuperTabDefaultCompletionType="<c-n>"

"inoremap <Tab> :call Smart_TabComplete()<CR>
