"=============================================
"Author:hominlinx
"Version:1.1
"Email:hominlinx@gmail.com
"=============================================

"按键映射：  cnoremap 在命令行中非递归键盘映射
"          inoremap 在插入模式下生效
"          vnoremap 在visual下生效
"          nnoremap 在normal下生效
"better command line editing
"在命令行模式下使用了类似emace的快捷键
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
cnoremap <C-B>        <Left>   " 后退一个字符
cnoremap <C-D>        <Del>    " 删除光标所在的字符
cnoremap <C-F>        <Right>  " 前进一个字符
cnoremap <C-N>        <Down>   " 取回较新的命令行
cnoremap <C-P>        <Up>     " 取回以前 (较旧的) 命令行

"smart way to move between windows 多窗口移动
nnoremap <C-j> <C-W>j
nnoremap <C-k> <C-W>k
nnoremap <C-h> <C-W>h
nnoremap <C-l> <C-W>l

nmap <leader>w :w!<cr>
nmap <leader>f :find<cr>

" go to beign and end using capitalized derections
noremap H 0
noremap L $
map 0 ^

" speed up scrolling of the viewport slightly
nnoremap <C-e> 4<C-e>
nnoremap <C-y> 4<C-y>

map <F1> :call CompileRunGcc()<CR>   " C，C++ 按F1编译运行
func! CompileRunGcc()
    exec "w"
    if &filetype == 'c'
        exec "!gcc % -o %<"
        exec "! ./%<"
    elseif &filetype == 'cpp'
        exec "!g++ % -o %<"
        exec "! ./%<"
    elseif &filetype == 'sh'
        :!./%
    endif
endfunc
"C,C++的调试

nnoremap <F2> :g/^\s*$/d<CR>         " 去空行  
nnoremap <C-F2> :vert diffsplit      " 比较文件  
map <M-F2> :tabnew<CR>               " 新建标签  

map <F3> :tabnew .<CR>               " 列出当前目录文件  
map <C-F3> \be                       " 打开树状文件目录  

nnoremap <F6> :set mouse=a<CR>
nnoremap <F7> :set mouse=v<CR>

map <F8> :call Rungdb()<CR>
func! Rungdb()
    exec "w"
    exec "!g++ % -g -o %<"
    exec "!gdb ./%<"
endfunc


""Jump to start and end of line using the home row keys
nmap t o<ESC>k
nmap T O<ESC>j

"nmap <leader>t :CtrlPBufTag<CR>
"nmap <leader>r :CtrlPMRUFiles<CR>
"nmap <leader>f :CtrlP .<CR>
"nmap <leader>T :CtrlPTag<CR>
"nmap <leader>e :CtrlPBuffer<CR>

