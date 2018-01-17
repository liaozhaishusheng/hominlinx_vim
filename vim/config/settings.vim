"=============================================
"Author:hominlinx
"Version:1.1
"Email:hominlinx@gmail.com
"=============================================
"winpos 5 5             " 设定窗口位置  
"set lines=40 columns=150    " 设定窗口大小  
"set go=                " 不要图形按钮  
set guifont=Courier_New:h10:cANSI   " 设置字体  
set ruler               " 打开状态栏标尺
"set whichwrap+=<,>,h,l   " 允许backspace和光标键跨越行边界(不建议)  
"set scrolloff=3        " 光标移动到buffer的顶部和底部时保持3行距离  
set novisualbell        " 不要闪烁(不明白)  
set cmdheight=2         " 命令行（在状态行下）的高度，默认为1，这里是2
set noeb                " 去掉输入错误的提示声音
set clipboard+=unnamed      " 共享剪贴板 
"make 运行
:set makeprg=g++\ -Wall\ \ %
set autoread                " 设置当文件被改动时自动载入
set autowrite               " 自动保存
set magic                   " 设置魔术
set guioptions-=T           " 隐藏工具栏
set guioptions-=m           " 隐藏菜单栏
set autochdir               " 切换当前目录为当前文件所在目录
set smarttab                " 在行和段开始处使用制表符

set viminfo+=!               " 保存全局变量
set iskeyword+=_,$,@,%,#,-   " 带有如下符号的单词不要被换行分割
set linespace=0              " 字符间插入的像素行数目
" 增强模式中的命令行自动完成操作
set wildmenu
set report=0                              " 通过使用: commands命令，告诉我们文件的哪一行被改变过
set fillchars=vert:\ ,stl:\ ,stlnc:\      " 在被分割的窗口间显示空白，便于阅读

"开启语法高亮
syntax enable
syntax on
autocmd InsertEnter * se cul              " 用浅色高亮当前行
au BufRead,BufNewFile *  setfiletype txt  " 高亮显示普通txt文件（需要txt.vim脚本）

filetype plugin indent on   " 文件类型检测/允许加载文件类型插件/为不同类型的文件定义不同的缩进格式
"字体 
"if (has("gui_running")) 
"   set guifont=Bitstream\ Vera\ Sans\ Mono\ 10 
"endif 
"编码设置 " encoding dectection
set encoding=utf-8
set fencs=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936
set fileencodings=utf-8,gb2312,gb18030,gbk,ucs-bom,cp936,latin1
set termencoding=utf-8
"语言设置
set langmenu=zh_CN.UTF-8
set helplang=cn   " 显示中文帮助

set nobackup     " 取消备份。
set noswapfile   " 禁止生成临时文件

" 突出显示当前行等
set cursorcolumn
set cursorline              " 突出显示当前行

" 可以在buffer的任何地方使用鼠标（类似office中在工作区双击鼠标定位）
set mouse=a   " -=a "鼠标暂不启动 点击光标不会换,用于复制
set selection=exclusive
set selectmode=mouse,key
set backspace=2             " 使回格键正常处理indent, eol, start等
set hlsearch                " 高亮search命中的文本,搜索逐字符高亮
set incsearch               " 随着键入实时匹配
set ignorecase              " 搜索忽略大小写
" 有一个或以上大写字母时仍大小写敏感
set smartcase " ignore case if search pattern is all lowercase, case-sensitive otherwise
set history=100             " 历史记录数     
set nocompatible        " 去掉讨厌的有关vi一致性模式，避免以前版本的一些bug和局限
set confirm                 " 在处理未保存或只读文件的时候，弹出确认
set backspace=indent,eol,start " More powerful backspacing
set report=0 " always report number of lines changed 
set wrap " do wrap lines
set scrolloff=3                      " 光标移动到buffer的顶部和底部时保持3行距离 3 lines above/below cursor when scrolling

set number                            " show line numbers 显示行号  
set showmatch       " 高亮显示匹配的括号
set showmode  " set showmode
set showcmd " show typed command in status bar 在终端显示输入的命令 
set title " show file in titlebar
set laststatus=2 " use 2 lines for the status bar" 启动显示状态行(1),总是显示状态行(2)  
set matchtime=2 " show matching bracket for 0.2 seconds 匹配括号高亮的时间（单位是十分之一秒）
" Python 文件的一般设置，比如不要 tab 等
autocmd FileType python set tabstop=4 shiftwidth=4 expandtab ai

set smartindent                  " 为C程序提供自动缩进
set autoindent                   " 自动缩进
set cindent
set tabstop=4                    " Tab键的宽度
set shiftwidth=4
set softtabstop=4                " 统一缩进为4
set noexpandtab                  " 不要用空格代替制表符
set gdefault                     " 全局收缩替换
set foldenable                   " 允许折叠  
set foldcolumn=0
set foldmethod=indent            " marker 折叠方式
set foldlevel=3 

set cino=:0g0t0(sus

"""""新文件标题""""""""""""""""""""""""
"新建.c,.h,.sh文件，自动插入文件头 
autocmd BufNewFile *.cpp,*.[ch],*.sh,*.java exec ":call SetTitle()" 
""定义函数SetTitle，自动插入文件头 
func SetTitle() 
    "如果文件类型为.sh文件 
    if &filetype == 'sh' 
        call setline(1,"\#####################") 
        call append(line("."), "\# File Name: ".expand("%")) 
        call append(line(".")+1, "\# Author: Xinhuang Tang") 
        call append(line(".")+2, "\# mail: tangxinhuang@live.com") 
        call append(line(".")+3, "\# Created Time: ".strftime("%c")) 
        call append(line(".")+4, "\###########################") 
        call append(line(".")+5, "\#!/bin/bash") 
        call append(line(".")+6, "") 
    else 
        call setline(1, "/***********************") 
        call append(line("."), "    > File Name: ".expand("%")) 
        call append(line(".")+1, "    > Author: Xinhuang Tang") 
        call append(line(".")+2, "    > Mail: tangxinhuang@live.com ") 
        call append(line(".")+3, "    > Created Time: ".strftime("%c")) 
        call append(line(".")+4, " **************************/") 
        call append(line(".")+5, "")
    endif
    if &filetype == 'cpp'
        call append(line(".")+6, "#include<iostream>")
        call append(line(".")+7, "using namespace std;")
        call append(line(".")+8, "")
    endif
    if &filetype == 'c'
        call append(line(".")+6, "#include<stdio.h>")
        call append(line(".")+7, "")
    endif
    "新建文件后，自动定位到文件末尾
    autocmd BufNewFile * normal G
endfunc 
