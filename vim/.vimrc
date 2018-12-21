  1 set nocompatible
  2
  3 set magic
  4 set ru "标尺信息
  5 set ai
  6 set nowrap
  7 set sw=4
  8 set ts=4
  9 set dy=lastline "显示最多行，不用@@
 10 "以上是缩进相关
 11 set backspace=indent,eol,start
 12 colo evening
 13 sy on
 14 set go= "无菜单、工具栏
 15 set nobackup
 16 set noswapfile
 17 set hlsearch
 18 set showmatch
 19 set expandtab
 20 set number
 21 colorscheme desert
 22
 23 set fileencodings=ucs-bom,utf-8,default,gb2312
 24
 25 set cscopetag
 26 set cscopeprg=gtags-cscope
 27 set cscopequickfix=s-,c-,d-,e-,g-,i-,s-,t-
 28 nmap <F9>  :cnext<CR>
 29 nmap <F10> :cprev<CR>
 30 "copen 5
 31 if filereadable("GTAGS")
 32     cs add GTAGS
 33 endif
 34
 35 let Tlist_Show_One_File=1     "不同时显示多个文件的tag，只显示当前文件的
 36 let Tlist_Exit_OnlyWindow=1   "如果taglist窗口是最后一个窗口，则退出vim
 37 "let Tlist_Use_Right_Window=1
 38 let Tlist_Ctags_Cmd="/usr/bin/ctags" "将taglist与ctags关联
 39 "let Tlist_Auto_Open=1
 40
 41 let NERDTreeWinPos=1
 42 map <F3> :NERDTreeMirror<CR>
 43 map <F3> :NERDTreeToggle<CR>
 44
 45 function s:killCs()
 46 cs reset
 47 endfunction
