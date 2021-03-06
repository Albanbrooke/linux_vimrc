"定义快捷键的前缀
let mapleader=";"

"文件类型侦测
"开启文件类型侦测
filetype on
"根据侦测到的不同类型加载对于的插件
filetype plugin on

set number
set nocompatible
"设置backspace可以删除缩进，换行等
set backspace=indent,eol,start
"vim自身（非插件）快捷键
"定义快捷键到行首和行尾
nmap lb 0
nmap le $

"设置快捷键将选中文本块复制至系统剪贴板
vnoremap <Leader>y "+y
"设置快捷键将系统剪贴板内容粘贴至vim
nmap <Leader>p "+p

"定义快捷键关闭当前分割窗口
nmap <Leader>q :q<CR>
"定义快捷键保存当前窗口内容
nmap <Leader>w :w<CR>
"定义快捷键保存所有窗口内容并退出 vim
nmap <Leader>WQ :wa<CR>:q<CR>
"不做任何保存，直接退出 vim
nmap <Leader>Q :qa!<CR>

"设置快捷键遍历子窗口
"依次遍历
nnoremap nw <C-W><C-W>
"跳转至右方的窗口
nnoremap <Leader>lw <C-W>l
"跳转至方的窗口
nnoremap <Leader>hw <C-W>h
"跳转至上方的子窗口
nnoremap <Leader>kw <C-W>k
"跳转至下方的子窗口
nnoremap <Leader>jw <C-W>j

"定义快捷键在结对符之间跳转
nmap <Leader>M %


"让配置变更立即生效
autocmd BufWritePost $MYVIMRC source $MYVIMRC

"开启实时搜索功能
set incsearch

"搜索时大小写不敏感
set ignorecase

"关闭兼容模式
set nocompatible

"vim 自身命令行模式智能补全
set wildmenu

"vundle 环境设置
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
"vundle 管理的插件列表必须位于 vundle#begin() 和 vundle#end() 之间
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'tomasr/molokai'
Plugin 'vim-scripts/phd'
Plugin 'Lokaltog/vim-powerline'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'derekwyatt/vim-fswitch'
Plugin 'kshenoy/vim-signature'
Plugin 'vim-scripts/BOOKMARKS--Mark-and-Highlight-Full-Lines'
Plugin 'majutsushi/tagbar'
Plugin 'vim-scripts/indexer.tar.gz'
Plugin 'vim-scripts/DfrankUtil'
Plugin 'vim-scripts/vimprj'
Plugin 'dyng/ctrlsf.vim'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'scrooloose/nerdcommenter'
Plugin 'vim-scripts/DrawIt'
"Plugin 'ervandew/supertab'
Plugin 'SirVer/ultisnips'
Plugin 'Valloric/YouCompleteMe'
Plugin 'derekwyatt/vim-protodef'
Plugin 'scrooloose/nerdtree'
Plugin 'fholgado/minibufexpl.vim'
Plugin 'gcmt/wildfire.vim'
Plugin 'sjl/gundo.vim'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'suan/vim-instant-markdown'
Plugin 'lilydjwg/fcitx.vim'
"插件列表结束
call vundle#end()
filetype plugin indent on

" 配色方案
set background=dark
"colorscheme solarized
"colorscheme molokai
colorscheme phd


"禁止光标闪烁
set gcr=a:block-blinkon0

"禁止显示滚动条
set guioptions-=l
set guioptions-=L
set guioptions-=r
set guioptions-=R

"禁止显示菜单和工具条
set guioptions-=m
set guioptions-=T

fun! ToggleFullscreen()
	call system("wmctrl -ir " . v:windowid . " -b toggle,fullscreen")
endf

"全屏开/关快捷键
map <silent> <F11> :call ToggleFullscreen()<CR>
"启动 vim 时自动全屏
"autocmd VimEnter * call ToggleFullscreen()


"总是显示状态栏
set laststatus=2
"显示光标当前位置
set ruler
"开启行号显示
set number
"高亮显示当前行/列，这个是用来显示光标的行列位置
set cursorline
"set cursorcolumn
"高亮显示搜索结果
set hlsearch
"禁止折行
set nowrap

"设置状态栏主题风格
"let g:Powerline_colorscheme='solarized256'
" 开启语法高亮功能
syntax enable
" 允许用指定语法高亮配色方案替换默认方案
syntax on

">>
"缩进

"自适应不同语言的智能缩进
filetype indent on

"将制表符扩展为空格
"set expandtab
"设置编辑时制表符占用空格数
set tabstop=4
"设置格式化时制表符占用空格数
set shiftwidth=4
"让 vim 把连续数量的空格视为一个制表符
set softtabstop=4

"缩进可视化插件 Indent Guides
"随 vim 自启动
let g:indent_guides_enable_on_vim_startup=1
"从第二层开始可视化显示缩进
let g:indent_guides_start_level=2
"色块宽度
let g:indent_guides_guide_size=1
"快捷键 i 开/关缩进可视化
nmap <silent> <Leader>i <Plug>IndentGuidesToggle
" <<

" >>
"代码折叠

"基于缩进或语法进行代码折叠
set foldmethod=indent
set foldmethod=syntax
"启动 vim 时关闭折叠代码
set nofoldenable

" <<



" >>
" 插件vim-fswitch实现
" 接口与实现快速切换，即类头文件和实现文件切换
" *.cpp 和 *.h 间切换
nmap <silent> <Leader>sw :FSHere<cr>
" <<

" >>
" 自定义vim-signature 快捷键
let g:SignatureMap = {
        \ 'Leader'             :  "m",
        \ 'PlaceNextMark'      :  "m,",
        \ 'ToggleMarkAtLine'   :  "m.",
        \ 'PurgeMarksAtLine'   :  "m-",
        \ 'DeleteMark'         :  "dm",
        \ 'PurgeMarks'         :  "mda",
        \ 'PurgeMarkers'       :  "m<BS>",
        \ 'GotoNextLineAlpha'  :  "']",
        \ 'GotoPrevLineAlpha'  :  "'[",
        \ 'GotoNextSpotAlpha'  :  "`]",
        \ 'GotoPrevSpotAlpha'  :  "`[",
        \ 'GotoNextLineByPos'  :  "]'",
        \ 'GotoPrevLineByPos'  :  "['",
        \ 'GotoNextSpotByPos'  :  "mn",
        \ 'GotoPrevSpotByPos'  :  "mp",
        \ 'GotoNextMarker'     :  "[+",
        \ 'GotoPrevMarker'     :  "[-",
        \ 'GotoNextMarkerAny'  :  "]=",
        \ 'GotoPrevMarkerAny'  :  "[=",
        \ 'ListLocalMarks'     :  "ms",
        \ 'ListLocalMarkers'   :  "m?"
        \ }

" <<

" >>
" 标签列表

" 设置 tagbar 子窗口的位置出现在主编辑区的左边
let tagbar_left=1
" 设置显示／隐藏标签列表子窗口的快捷键。速记：identifier list by tag
nnoremap <Leader>ilt :TagbarToggle<CR>
" 设置标签子窗口的宽度
let tagbar_width=32
" tagbar 子窗口中不显示冗余帮助信息
let g:tagbar_compact=1
" 设置 ctags 对哪些代码标识符生成标签
let g:tagbar_type_cpp = {
     \ 'ctagstype' : 'c++',
     \ 'kinds'     : [
         \ 'c:classes:0:1',
         \ 'd:macros:0:1',
         \ 'e:enumerators:0:0', 
         \ 'f:functions:0:1',
         \ 'g:enumeration:0:1',
         \ 'l:local:0:1',
         \ 'm:members:0:1',
         \ 'n:namespaces:0:1',
         \ 'p:functions_prototypes:0:1',
         \ 's:structs:0:1',
         \ 't:typedefs:0:1',
         \ 'u:unions:0:1',
         \ 'v:global:0:1',
         \ 'x:external:0:1'
     \ ],
     \ 'sro'        : '::',
     \ 'kind2scope' : {
         \ 'g' : 'enum',
         \ 'n' : 'namespace',
         \ 'c' : 'class',
         \ 's' : 'struct',
         \ 'u' : 'union'
     \ },
     \ 'scope2kind' : {
         \ 'enum'      : 'g',
         \ 'namespace' : 'n',
         \ 'class'     : 'c',
         \ 'struct'    : 's',
         \ 'union'     : 'u'
     \ }
	 \ }

" <<


" >>
" 代码导航（声明/定义跳转）

" indexer自动生成项目的ctags，YCM调用ctags，indexer自动生成标签tags，vim有标签栈（tags stack）机制，从而实现声明/定义跳转， 只需先键入 ctrl-]，若没跳转至需要的标签，再键入 tn 往后或者 tp 往前遍历即可
" 基于标签的代码导航
" indexer 自动生成项目的ctags，YCM调用ctags
" 设置插件 indexer 调用 ctags 的参数
" 默认 --c++-kinds=+p+l，重新设置为 --c++-kinds=+l+p+x+c+d+e+f+g+m+n+s+t+u+v
" 默认 --fields=+iaS 不满足 YCM 要求，需改为 --fields=+iaSl
let g:indexer_ctagsCommandLineOptions="--c++-kinds=+l+p+x+c+d+e+f+g+m+n+s+t+u+v --fields=+iaSl --extra=+q"

" 正向遍历同名标签
nmap <Leader>tn :tnext<CR>
" 反向遍历同名标签
nmap <Leader>tp :tprevious<CR>

" 基于语义的代码导航
nnoremap <leader>jc :YcmCompleter GoToDeclaration<CR>
" 只能是 #include 或已打开的文件
nnoremap <leader>jd :YcmCompleter GoToDefinition<CR>
" <<


" >>
" 查找
" 使用 ctrlsf.vim插件在工程内全局查找光标所在关键字，设置快捷键。快捷键速记法：search in project
" nnoremap <Leader>sp :CtrlSF<CR>
" <<


" >>
" 内容替换

" 快捷替换
let g:multi_cursor_next_key='<S-n>'
let g:multi_cursor_skip_key='<S-k>'

" 精准替换
" 替换函数。参数说明：
" confirm：是否替换前逐一确认
" wholeword：是否整词匹配
" replace：被替换字符串
function! Replace(confirm, wholeword, replace)
	wa
	let flag = ''
	if a:confirm
		let flag .= 'gec'
	else
		let flag .= 'ge'
	endif
	let search = ''
	if a:wholeword
		let search .= '\<' . escape(expand('<cword>'), '/\.*$^~[') . '\>'
	else
		let search .= expand('<cword>')
	endif
	let replace = escape(a:replace, '/\&~')
	execute 'argdo %s/' . search . '/' . replace . '/' . flag . '| update'
endfunction
" 不确认、非整词
nnoremap <Leader>R :call Replace(0, 0, input('Replace'.expand('<cword>').'with:'))<CR>
" 不确认、整词
nnoremap <Leader>rw :call Replace(0, 1, input('Replace'.expand('<cword>').'with:'))<CR>
" 确认、非整词
nnoremap <Leader>rc :call Replace(1, 0, input('Replace'.expand('<cword>').'with:'))<CR>
" 确认、整词
nnoremap <Leader>rcw :call Replace(1, 1, input('Replace'.expand('<cword>').'with:'))<CR>
nnoremap <Leader>rwc :call Replace(1, 1, input('Replace'.expand('<cword>').'with:'))<CR>
" <<



" 模板补全
" UltiSnips 的 tab 键与 YCM 冲突，重新设定，从品牌。snippets必须在.vim/文件夹下的子目录中，如果放到.vim/bundle下会被bundle在:PluginClean的时候自动删除，所以必须放到.vim/mysnippets/下。
let g:UltiSnipsSnippetDirectories=["mysnippets"]
let g:UltiSnipsSnippetsDir='~/.vim/mysnippets'
let g:UltiSnipsExpandTrigger="<leader><tab>"
let g:UltiSnipsJumpForwardTrigger="<leader><tab>"
let g:UltiSnipsJumpBackwardTrigger="<leader><s-tab>"


" >>
" YCM 补全
" YCM 补全菜单配色
" 菜单
highlight Pmenu ctermfg=2 ctermbg=3 guifg=#005f87 guibg=#EEE8D5

"指定路径                                                                                                                     
"let g:ycm_global_ycm_extra_conf='~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
let g:ycm_global_ycm_extra_conf='~/.ycm_extra_conf.py'

" 选中项
highlight PmenuSel ctermfg=2 ctermbg=3 guifg=#AFD700 guibg=#106900

" 补全功能在注释中同样有效
let g:ycm_complete_in_comments=1

" 允许 vim 加载 .ycm_extra_conf.py 文件，不再提示
let g:ycm_confirm_extra_conf=0

" 开启 YCM 标签补全引擎
let g:ycm_collect_identifiers_from_tags_files=0

"引入 C++ 标准库 tags
"引入c++ tags，cd /usr/include/c++/4.8
" ctags -R --c++-kinds=+l+x+p --fields=+iaSl --extra=+q --language-force=c++ -f stdcpp.tags
set tags+=/usr/include/c++/5/stdcpp.tags
"引入linux系统API
"生成tags，cd /usr/include/
"ctags -R --c-kinds=+l+x+p --fields=+lS -I __THROW,__nonnull -f sys.tags 
set tags+=/usr/include/sys.tags

" YCM 集成 OmniCppComplete 补全引擎，设置其快捷键
inoremap <leader>; <C-x><C-o>

" 补全内容不以分割子窗口形式出现，只显示补全列表
set completeopt-=preview

" 从第一个键入字符就开始罗列匹配项
let g:ycm_min_num_of_chars_for_completion=1

" 禁止缓存匹配项，每次都重新生成匹配项
let g:ycm_cache_omnifunc=0

" 语法关键字补全
let g:ycm_seed_identifiers_with_syntax=1

" <<


" >>
" 根据类声明自动生成类实现
" vim-protodef依赖vim-fswitch
" 由接口快速生成实现框架
" 成员函数的实现顺序与声明顺序一致
let g:disable_protodef_sorting=1
" <<


" >>
" 库信息参考
" 启用:Man命令查看各类man信息
source $VIMRUNTIME/ftplugin/man.vim
" 定义:Man命令查看各类man信息的快捷键
nmap <Leader>man :Man 3 <cword><CR>
" <<



" >>
" 工程文件浏览
" 使用 NERDTree 插件查看工程文件。设置快捷键，速记：file list
nmap <Leader>fl :NERDTreeToggle<CR>
" 设置 NERDTree 子窗口宽度
let NERDTreeWinSize=22
" 设置 NERDTree 子窗口位置
let NERDTreeWinPos="right"
" 显示隐藏文件
let NERDTreeShowHidden=1
" NERDTree 子窗口中不显示冗余帮助信息
let NERDTreeMinimalUI=1
" 删除文件时自动删除文件对应 buffer
let NERDTreeAutoDeleteBuffer=1
" <<


" >>
" 多文档编辑
" 显示/隐藏 MiniBufExplorer 窗口
map <Leader>bl :MBEToggle<cr>
" buffer 切换快捷键
" 实际应用中以下两行设定并没有起作用，修改映射快捷键后起作用
" map <C-Tab> :MBEbn<cr>
" map <C-S-Tab> :MBEbp<cr>
map <Leader>bn :MBEbn<cr>
map <Leader>bp :MBEbp<cr>
" <<


" >>
" 环境恢复
" 设置环境保存项
set sessionoptions="blank,globals,localoptions,tabpages,sesdir,folds,help,options,resize,winpos,winsize"

" 保存 undo 历史。必须先行创建 .undo_history/
set undodir=~/.undo_history/
set undofile

" 保存快捷键
map <leader>ss :mksession! my.vim<cr> :wviminfo! my.viminfo<cr>
map <leader>ss :mksession! my.vim<cr>

" 恢复快捷键
map <leader>rs :source my.vim<cr> :rviminfo my.viminfo<cr>
map <leader>rs :source my.vim<cr>
" <<


 
" 设置快捷键实现一键编译及运行
" 先删除老的可执行程序，再重新编译
" 如果编译错误，quickfix 窗口会固定在底部，罗列出所有编译过程中的所有错误，
" 如果编译正常（即便是存在链接错误），quickfix 窗口会出现“Press ENTER or type command to continue”的输入等待提示信息，
nmap <Leader>m :wa<CR> :cd build/<CR> :!rm -rf main<CR> :!cmake CMakeLists.txt<CR>:make<CR><CR> :cw<CR> :cd ..<CR>
nmap <Leader>g :wa<CR>:cd build/<CR>:!rm -rf main<CR>:!cmake CMakeLists.txt<CR>:make<CR><CR>:cw<CR>:cd ..<CR>:!build/main<CR>

" >>
" 快速选中结对符内的文本
 
" 快捷键
map <SPACE> <Plug>(wildfire-fuel)
vmap <S-SPACE> <Plug>(wildfire-water)

" 适用于哪些结对符
let g:wildfire_objects = ["i'", 'i"', "i)", "i]", "i}", "i>", "ip"]
" <<



" 调用 gundo 树
nnoremap <Leader>ud :GundoToggle<CR>



