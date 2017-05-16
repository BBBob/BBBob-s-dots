" All system-wide defaults are set in $VIMRUNTIME/archlinux.vim (usually just
" /usr/share/vim/vimfiles/archlinux.vim) and sourced by the call to :runtime
" you can find below.  If you wish to change any of those settings, you should
" do it in this file (/etc/vimrc), since archlinux.vim will be overwritten
" everytime an upgrade of the vim packages is performed.  It is recommended to
" make changes after sourcing archlinux.vim since it alters the value of the
" 'compatible' option.

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages.
runtime! archlinux.vim

"autocmd BufNewFile,BufRead *.tex source ~/.vim/ftplugin/tex.vim
"autocmd FileType tex source ~/.vim/ftplugin/tex.vim

" If you prefer the old-style vim functionalty, add 'runtime! vimrc_example.vim'
" Or better yet, read /usr/share/vim/vim80/vimrc_example.vim or the vim manual
" and configure vim to your own liking!

" do not load defaults if ~/.vimrc is missing
"let skip_defaults_vim=1



set nocompatible              " 去除VI一致性,必须
filetype off                  " 必须
filetype plugin on " 根据侦测到的不同类型加载对应的插件
" 设置包括vundle和初始化相关的runtime path
set rtp+=~/.vim/bundle/Vundle.vim




call vundle#begin()
" 另一种选择, 指定一个vundle安装插件的路径
"call vundle#begin('~/some/path/here')

" 让vundle管理插件版本,必须
Plugin 'VundleVim/Vundle.vim'

Plugin 'https://github.com/vim-airline/vim-airline.git'
Plugin 'pthrasher/conqueterm-vim'
""Plugin 'altercation/vim-colors-solarized'
Plugin 'tomasr/molokai'
"Plugin 'vim-scripts/phd'
"Plugin 'Lokaltog/vim-powerline'

"old
Plugin 'octol/vim-cpp-enhanced-highlight'
"Plugin 'nathanaelkane/vim-indent-guides'
"Plugin 'derekwyatt/vim-fswitch'
"Plugin 'kshenoy/vim-signature'
"Plugin 'vim-scripts/BOOKMARKS--Mark-and-Highlight-Full-Lines'
"Plugin 'majutsushi/tagbar'
"Plugin 'vim-scripts/indexer.tar.gz'
"Plugin 'vim-scripts/DfrankUtil'
"Plugin 'vim-scripts/vimprj'
"Plugin 'dyng/ctrlsf.vim'
"Plugin 'terryma/vim-multiple-cursors'
Plugin 'scrooloose/nerdcommenter'
"Plugin 'vim-scripts/DrawIt'
"Plugin 'SirVer/ultisnips'
"Plugin 'derekwyatt/vim-protodef'
Plugin 'vim-latex/vim-latex'
Plugin 'xuhdev/vim-latex-live-preview'
Plugin 'scrooloose/nerdtree'
"Plugin 'fholgado/minibufexpl.vim'
"Plugin 'gcmt/wildfire.vim'
"Plugin 'sjl/gundo.vim'
"Plugin 'Lokaltog/vim-easymotion'
"Plugin 'suan/vim-instant-markdown'
Plugin 'lilydjwg/fcitx.vim'
""Plugin 'jaywilliams/vim-vwilight'
""Plugin 'kpachnis/vim-twilight'
Plugin 'Valloric/YouCompleteMe'

call vundle#end()            " 必须
filetype plugin indent on    " 必须 加载vim自带和插件相应的语法和文件类型相关脚本
" 忽视插件改变缩进,可以使用以下替代:
"filetype plugin on
"
" 简要帮助文档
" :PluginList       - 列出所有已配置的插件
" :PluginInstall    - 安装插件,追加 `!` 用以更新或使用 :PluginUpdate
" :PluginSearch foo - 搜索 foo ; 追加 `!` 清除本地缓存
" :PluginClean      - 清除未使用插件,需要确认; 追加 `!` 自动批准移除未使用插件
"
" 查阅 :h vundle 获取更多细节和wiki以及FAQ
" 将你自己对非插件片段放在这行之后
"
syntax enable
set background=light
colorscheme molokai 
""let g:molokai_original = 1

"YCM	
let g:ycm_global_ycm_extra_conf = '/home/xuzhenan/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py' 

"打开一个文件自动定位到上一次退出的位置
if has("autocmd")
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

"默认右侧打开新buffer
set splitright
"---------------------------- airline 设置 start ------------------------------

" 显示颜色
set t_Co=256
set laststatus=2
" 使用powerline打过补丁的字体
let g:airline_powerline_fonts = 1
" 开启tabline
let g:airline#extensions#tabline#enabled = 1
" tabline中当前buffer两端的分隔字符
let g:airline#extensions#tabline#left_sep = ' '
" tabline中未激活buffer两端的分隔字符
let g:airline#extensions#tabline#left_alt_sep = '|'
" tabline中buffer显示编号
let g:airline#extensions#tabline#buffer_nr_show = 1
" 映射切换buffer的键位
nnoremap [b :bp<CR>
nnoremap ]b :bn<CR>

let mapleader = ";"
" 映射<leader>num到num buffer
map <leader>1 :b 1<CR>
map <leader>2 :b 2<CR>
map <leader>3 :b 3<CR>
map <leader>4 :b 4<CR>
map <leader>5 :b 5<CR>
map <leader>6 :b 6<CR>
map <leader>7 :b 7<CR>
map <leader>8 :b 8<CR>
map <leader>9 :b 9<CR>
" ----------------------------airline 设置 end ------------------------------

" ----------------------------让配置变更立即生效 start ----------------------
autocmd BufWritePost $MYVIMRC source $MYVIMRC
" ----------------------------让配置变更立即生效 stop  ----------------------



"---------------------------- map 设置 start ------------------------------
"删除空行"
map <F8> <Esc>:g/^\s*$/d<CR>
map <C-q> <Esc>:bd<CR>
imap <C-q> <Esc>:bd<CR>
map QQ <Esc>:q!<CR>
"map Q <Esc>QQ
map ZQ <Esc>ZZ
imap <F1> <Esc>
map <F1> <Esc>
map <C-s> <Esc>:w<enter>
map <C-d> <Esc>:w !sudo tee % > /dev/null<enter>
inoremap  <C-s> <Esc>:w<enter>
inoremap <C-d> <Esc>:w !sudo tee % > /dev/null<enter>
vmap <C-c> "+y 
map <c-z> <Esc>ui
inoremap <c-z> <Esc>ui
vmap <C-v> "+p
map <C-a> ggvG$
imap <C-a> <Esc>ggvG$
nmap t<Enter> :bel vnew\|:e term://zsh<CR>
" ----------------------------map 设置 end ------------------------------
"

" ----------------------------营造专注氛围 start ---------------------------
" 禁止光标闪烁
set gcr=a:block-blinkon0
" 禁止显示滚动条
set guioptions-=l
set guioptions-=L
set guioptions-=r
set guioptions-=R
" 禁止显示菜单和工具条
set guioptions-=m
set guioptions-=T

" 总是显示状态栏
set laststatus=2
" 显示光标当前位置
set ruler
" 显示相对行号
set relativenumber
" 开启行号显示
set number
" 开启实时搜索功能
set incsearch
" " 搜索时大小写不敏感
set ignorecase
" " 关闭兼容模式
set nocompatible
" " vim 自身命令行模式智能补全
set wildmenu



" ----------------------------营造专注氛围 end ------------------------------
"

" ----------------------------营造专注氛围 bigen -----------------------------
" 自适应不同语言的智能缩进
filetype indent on
" 将制表符扩展为空格
set expandtab
" 设置编辑时制表符占用空格数
set tabstop=4
" 设置格式化时制表符占用空格数
set shiftwidth=4
" 让 vim 把连续数量的空格视为一个制表符
set softtabstop=4
" ----------------------------营造专注氛围 end ------------------------------
"
"
"
"
"
"
"
"
"
"
"
"编译和运行
"编译系统

func! CompileRunGcc()  
let mycppname=expand("%<")
    exec "w"
    exec "vsplit"
    let mycppname=expand("%<")
    exec "terminal Ccc "mycppname""
endfunc 

func! CompileRunGpp()
    exec "w"
    exec "vsplit"
    let mycppname=expand("%<")
    exec "terminal cpp "mycppname""
endfunc

func! CompileRunCode()
        exec "w"
        if &filetype == "cpp"
                exec "call CompileRunGpp()"
        elseif &filetype == "c"
                exec "call CompileRunGcc()"
        elseif &filetype == "tex"
                exec "call CompileLatex()"
        endif
endfunc

func! GDB()
    let mycppname=expand("%<")
    exec "vsplit"
    exec "terminal gdb "mycppname" "
endfunc 

"map <F5> :call CompileR()<CR>
map <c-b> :call CompileRunCode()<CR>
imap <c-b> <ESC>:call CompileRunCode()<CR>
vmap <c-b> <ESC>:call CompileRunCode()<CR>
nmap gdb<enter> :call GDB()<CR>
"括号补全系统
"open"
inoremap ( ()<Esc>i
inoremap [ []<Esc>i
autocmd Syntax c,cpp inoremap { {<CR>}<Esc>O
autocmd Syntax html,vim inoremap < <lt>><Esc>i| inoremap > <c-r>=ClosePair('>')<CR>
autocmd Syntax tex nnoremap dcode<enter> <Esc>o\begin{multicols}{2}<Esc>o<backspace>\begin{lstlisting}[caption={}]<Esc>o<Esc>i<Esc>o<Esc>i\end{lstlisting}<Esc>o<Esc>i\end{multicols}<Esc>2ki
autocmd Syntax tex nnoremap code<enter> <Esc>o\begin{lstlisting}[caption={}]<Esc>o\end{lstlisting}<Esc>ko
inoremap { {}<Esc>i
"close"
inoremap ) <c-r>=ClosePair(')')<CR>
inoremap } <c-r>=ClosePair('}')<CR>
inoremap ] <c-r>=ClosePair(']')<CR>
autocmd Syntax c,cpp inoremap } <c-r>=CloseBracket()<CR>
inoremap " <c-r>=QuoteDelim('"')<CR>
inoremap ' <c-r>=QuoteDelim("'")<CR>

function ClosePair(char)
 if getline('.')[col('.') - 1] == a:char
 return "\<Right>"
 else
 return a:char
 endif
endf

function CloseBracket()
 if match(getline(line('.') + 1), '\s*}') < 0
 return "\<CR>}"
 else
 return "\<Esc>j0f}a"
 endif
endf

function QuoteDelim(char)
 let line = getline('.')
 let col = col('.')
 if line[col - 2] == "\\"
 return a:char
 elseif line[col - 1] == a:char
 return "\<Right>"
 else
 return a:char.a:char."\<Esc>i"
 endif
endf

"vim-cpp-enhanced-highlight
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_experimental_template_highlight = 1
let g:cpp_concepts_highlight = 1



"Nerdtree
map <F3> : NERDTreeMirror<CR>
map <F3> : NERDTreeToggle<CR>
map <F4> : NERDTree<CR>




" terminal emulator
"""""""""""""""
tnoremap <Esc> <C-\><C-n>
tnoremap <C-q> <C-\><C-n>:q<CR>

autocmd BufWinEnter,WinEnter term://* startinsert
autocmd BufLeave term://* stopinsert
tnoremap <F5> cpp %<<CR> 
" Move between windows
tnoremap <A-h> <C-\><C-n><C-w>h
tnoremap <A-j> <C-\><C-n><C-w>j
tnoremap <A-k> <C-\><C-n><C-w>k
tnoremap <A-l> <C-\><C-n><C-w>l
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l

" 下面是添加F4热键自动加入文件头注释信息
"map <F4> ms:call AddAuthor()<cr>'S
 
"function AddAuthor()
    "let n=1
    "while n < 11
        "let line = getline(n)
        "if line=~'[#]*\s*\*\s*\S*Last\s*modified\s*:\s*\S*.*$'
        "call UpdateTitle()
        "return
    "endif
    "let n = n + 1
    "endwhile
    "if &filetype == 'sh'
        "call AddTitleForShell()
    "elseif &filetype == 'python'
        "call AddTitleForPython()
    "else
        "call AddTitleForC()
    "endif
 
"endfunction
 
""" add comment for Python
"function AddTitleForPython()
    "call append(0,"#!/usr/bin/env python")
    "call append(1,"#coding:utf-8")
    "call append(2,"")
    "call append(3,"# **********************************************************")
    "call append(4,"# * Author        : fujinzhou")
    "call append(5,"# * Email         : 1445675350@qq.com")
    "call append(6,"# * Create time   : ".strftime("%Y-%m-%d %H:%M"))
    "call append(7,"# * Last modified : ".strftime("%Y-%m-%d %H:%M"))
    "call append(8,"# * Filename      : ".expand("%:t"))
    "call append(9,"# * Description   : ")
    "call append(10,"# **********************************************************")
    "echohl WarningMsg | echo "Successful in adding the copyright." | echohl None
"endfunction
 
""" add conment for shell
"function AddTitleForShell()
    "call append(0,"#!/bin/bash")
    "call append(1,"# **********************************************************")
    "call append(2,"# * Author        : fujinzhou")
    "call append(3,"# * Email         : 1445675350@qq.com")
    "call append(4,"# * Create time   : ".strftime("%Y-%m-%d %H:%M"))
    "call append(5,"# * Last modified : ".strftime("%Y-%m-%d %H:%M"))
    "call append(6,"# * Filename      : ".expand("%:t"))
    "call append(7,"# * Description   : ")
    "call append(8,"# **********************************************************")
"endfunction




" 下面是添加F4热键自动加入文件头注释信息
map <F5> ms:call AddHeaders()<cr>'S

function AddHeaders()
    if &filetype == 'sh'
        call AddTitleForShell()
    elseif &filetype == 'python'
        call AddTitleForPython()
    elseif &filetype == 'cpp'
        call AddTitleForCpp()
    endif
 
endfunction
 
"" add comment for Python
function AddTitleForPython()
    call append(0,"#!/usr/bin/env python")
    call append(1,"#coding:utf-8")
    call append(2,"")
    call append(3,"# **********************************************************")
    call append(4,"# * Author        : fujinzhou")
    call append(5,"# * Email         : 1445675350@qq.com")
    call append(6,"# * Create time   : ".strftime("%Y-%m-%d %H:%M"))
    call append(7,"# * Last modified : ".strftime("%Y-%m-%d %H:%M"))
    call append(8,"# * Filename      : ".expand("%:t"))
    call append(9,"# * Description   : ")
    call append(10,"# **********************************************************")
    echohl WarningMsg | echo "Successful in adding the copyright." | echohl None
endfunction
"" add headers for cpp
function AddTitleForCpp()
    call append(0,"#include <cstdio>") 
    call append(1,"#include <algorithm>")
    call append(2,"#include <cstring>")
    call append(3,"#include <cmath>")
    call append(4,"#include <vector>")
    call append(5,"#include <queue>")
    call append(6,"#include <iostream>")
    call append(7,"#include <map>")
    call append(8,"#include <set>")
    call append(9,"//#define test")
    call append(10,"using namespace std;")
    call append(11,"const int Nmax=1e6+7;")
    call append(12,"int main()")
    call append(13,"{")
    call append(14,"    #ifdef test")
    call append(15,"    #endif")
    call append(16," ")
    call append(17,"    return 0;")
    call append(18,"}")
    call append(19,"")
endfunction
"" add conment for shell
function AddTitleForShell()
    call append(0,"#!/bin/bash")
    call append(1,"# **********************************************************")
    call append(2,"# * Author        : fujinzhou")
    call append(3,"# * Email         : 1445675350@qq.com")
    call append(4,"# * Create time   : ".strftime("%Y-%m-%d %H:%M"))
    call append(5,"# * Last modified : ".strftime("%Y-%m-%d %H:%M"))
    call append(6,"# * Filename      : ".expand("%:t"))
    call append(7,"# * Description   : ")
    call append(8,"# **********************************************************")
endfunction

"tex 设置"
"
func! CompileLatex()
   exec "LLPStartPreview"
endfunc
autocmd Filetype tex setl updatetime=1
nmap <F12> :LLPStartPreview<cr>
"let g:livepreview_previewer = 'zathura'
