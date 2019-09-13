" An example for a vimrc file.
"
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last change:	2002 Sep 19
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc
"	      for Amiga:  s:.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc
"	    for OpenVMS:  sys$login:.vimrc

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" 显示行号
set number
" 自动对齐
set smartindent

" 编辑时制表符占用空格数
set tabstop=4
" 连续数量的空格视为一个制表符
set softtabstop=4
" 格式化时制表符占用空格数
set shiftwidth=4
" 将制表符扩展为空格
set expandtab
" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" 基于缩进或语法进行代码折叠
"set foldmethod=indent
set foldmethod=syntax
" 启动 vim 时关闭折叠代码
set nofoldenable

" 开启实时搜索功能
set incsearch
" 搜索时大小写不敏感
"set ignorecase
" vim 自身命令行模式智能补全
set wildmenu

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file
endif
set history=50		" keep 50 lines of command line history
set showcmd		" display incomplete commands
"set incsearch		" do incremental searching

" 显示光标当前位置
set ruler		" show the cursor position all the time
" 高亮显示当前行/列
set cursorline
"set cursorcolumn

" Don't use Ex mode, use Q for formatting
map Q gq


" This is an alternative that also works in block mode, but the deleted
" text is lost and it only works for putting the current register.
"vnoremap p "_dp

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax enable
  syntax on
  " 搜索结果高亮显示
  set hlsearch
endif

if has("autocmd")

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

  augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

let &termencoding = &encoding
set fileencodings=utf-8,gbk,ucs-bom,cp936,gb2312

"let g:XkbSwitchEnabled = 1
"let g:XkbSwitchLib = '/usr/local/lib/libxkbswitch.so'

" 关闭兼容模式
set nocompatible
" 关闭filetype, 后面会打开
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'Valloric/YouCompleteMe'

Plugin 'lilydjwg/fcitx.vim'
Plugin 'derekwyatt/vim-fswitch'

" Colorschemes
Plugin 'flazz/vim-colorschemes'
Plugin 'tomasiser/vim-code-dark'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'yosiat/oceanic-next-vim'

Plugin 'dracula/vim'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'kshenoy/vim-signature'
Plugin 'majutsushi/tagbar'

Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'

Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'

" Nerdtree
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'fholgado/minibufexpl.vim'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'scrooloose/nerdcommenter'


Plugin 'heavenshell/vim-pydocstring'

" Ale and Ariline
Plugin 'w0rp/ale'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'powerline/powerline'
Plugin 'tpope/vim-fugitive'

Plugin 'tpope/vim-surround'
Plugin 'arrufat/vala.vim'

"Plugin 'lyokha/vim-xkbswitch'
"Plugin 'vim-scripts/BOOKMARKS--Mark-and-Highlight-Full-Lines'
"Plugin 'vim-scripts/indexer.tar.gz'
"Plugin 'vim-scripts/DfrankUtil'
"Plugin 'vim-scripts/vimprj'
"Plugin 'dyng/ctrlsf.vim'
"Plugin 'terryma/vim-multiple-cursors'
"Plugin 'gcmt/wildfire.vim'
"Plugin 'sjl/gundo.vim'
"Plugin 'Lokaltog/vim-easymotion'
"Plugin 'suan/vim-instant-markdown'
"Plugin 'vim-scripts/DrawIt'
"Plugin 'derekwyatt/vim-protodef'
call vundle#end()            " required
filetype plugin indent on
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
" see :h vundle for more details or wiki for FAQ

" 配色方案 colorscheme
"set background=dark
"colorscheme molokai
"colorscheme dracula
"colorscheme gruvbox
"colorscheme monokain
colorscheme lilypink
"colorscheme OceanicNext
"colorscheme ayu
"colorscheme codedark

" 定义快捷键的前缀，即<Leader>
let mapleader=";"
" C/C++头文件切换
nmap <silent> <Leader>sw :FSHere<cr>
" 行首和行尾
nmap LB 0
nmap LE $
" 复制至系统剪贴板
vnoremap <Leader>y "+y
" 系统剪贴板内容粘贴至 vim
nmap <Leader>p "+p
" 关闭当前分割窗口
map <leader>q :bp<bar>sp<bar>bn<bar>bd<CR>
" 保存当前窗口内容
nmap <Leader>w :w<CR>
" 所有窗口内容并退出 vim
nmap <Leader>WQ :wa<CR>:q<CR>
" 不做任何保存，直接退出 vim
nmap <Leader>Q :qa!<CR>
" 依次遍历子窗口
nnoremap <Leader>nw <C-W><C-W>
" 跳转至右方的窗口
nnoremap <Leader>lw <C-W>l
" 跳转至左方的窗口
nnoremap <Leader>hw <C-W>h
" 跳转至上方的子窗口
nnoremap <Leader>kw <C-W>k
" 跳转至下方的子窗口
nnoremap <Leader>jw <C-W>j
" 定义快捷键在结对符之间跳转
nmap <Leader>M %

" 显示/隐藏 MiniBufExplorer 窗口
map <Leader>bl :MBEToggle<cr>
" buffer 切换快捷键
map <C-Tab> :MBEbn<cr>
map <C-S-Tab> :MBEbp<cr>

" 使用 NERDTree 插件查看工程文件。设置快捷键，速记：file list
nmap <Leader>fl :NERDTreeToggle<CR>

" 设置NERDTree子窗口宽度
let NERDTreeWinSize=32
" 设置NERDTree子窗口位置
let NERDTreeWinPos="left"
" 显示隐藏文件
let NERDTreeShowHidden=1
" NERDTree 子窗口中不显示冗余帮助信息
let NERDTreeMinimalUI=1
" 删除文件时自动删除文件对应 buffer
let NERDTreeAutoDeleteBuffer=1
" 忽略一些文件的显示
let NERDTreeIgnore=['\.vim$', '\~$', '\.pyc$', '\.o$', '\.out', '\.a$', '\.so$', '\.*\.swp$', '\.git', '\.sqlite3']

" UltiSnips 的 tab 键与 YCM 冲突，重新设定
let g:UltiSnipsExpandTrigger="<leader><tab>"
let g:UltiSnipsJumpForwardTrigger="<leader><tab>"
let g:UltiSnipsJumpBackwardTrigger="<leader><s-tab>"

" Javascript
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_ngdoc = 1
let g:javascript_plugin_flow = 1

" Ale
" 始终开启标志列
let g:ale_sign_column_always = 1
let g:ale_set_highlights = 0
" 自定义error和warning图标
let g:ale_sign_error = '✗'
let g:ale_sign_warning = '⚡'
" 在vim自带的状态栏中整合ale
let g:ale_statusline_format = ['✗ %d', '⚡ %d', '✔ OK']
" 在airline中整合ale
let g:ale_airline_format = ['✗ %d', '⚡ %d', '✔ OK']
" 显示Linter名称,出错或警告等相关信息
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
" 使用clang对c和c++进行语法检查，对python使用flake8进行语法检查
let g:ale_linters = {
\   'c++': ['clang'],
\   'c': ['clang'],
\   'python': ['flake8'],
\}
" flake8 的参数
let g:ale_python_flake8_options = '--ignore=E501'
" 普通模式下，sp前往上一个错误或警告，sn前往下一个错误或警告
nmap sp <Plug>(ale_previous_wrap)
nmap sn <Plug>(ale_next_wrap)
" <Leader>s触发/关闭语法检查
nmap <Leader>s :ALEToggle<CR>
" <Leader>d查看错误或警告的详细信息
nmap <Leader>d :ALEDetail<CR>

" Airline
" let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'default'
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline_theme = 'light' "powerlineish'
let g:airline_powerline_fonts = 1
