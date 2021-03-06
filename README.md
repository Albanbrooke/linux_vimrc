# linux_vimrc
linuc vimrc
第零步：
编译源码包，要安装这些包
python-devel、python3-devel、ruby-devel、lua-devel、libX11-devel、gtk-devel、gtk2-devel、gtk3-devel、ncurses-devel
另外其他步骤也有可能需要以下包
玩 C/C++ 你肯定要用到标准库。概念上，GCC 配套的标准库涉及 libstdc++ 和 libsupc++ 两个子库，前者是接口层（即，上层的封装），后者是实现层（即，底层的具体实现），对应实物文件，你得需要两个子库的头文件和动态链接库（*.so）。openSUSE 的安装源中有，直接安装头文件

zypper in libstdc++47-devel
位于 /usr/include/c++/4.7/，接着安装链接库

zypper in libstdc++6
位于 /usr/lib/libstdc++.so.6。呃，是滴，libstdc++、libsupc++ 两个子库的相关文件是合并一起安装的。
安装的 GNU C++ 标准库头文件，openSUSE 可用如下命令：
zypper install libstdc++48-devel。
安装成功后，在 /usr/include/c++/4.8/ 可见到所有头文件。
获取 linux 系统 API 头文件。openSUSE 可用如下命令：
zypper install linux-glibc-devel。
编译 YCM 共享库之前要安装这些：
zypper --no-refresh se python-devel python3-devel boost-devel llvm-clang-devel
第一步：
先下载管理插件的插件vundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
第二步：
如果vundle下载YCM出现错误还需要手动下载YCM
下载llvm+clang预编译二进制包，并编译YCM。llvm+clang一定要是64位的
第三步：
设置C/C++的tags
cd /usr/include/c++/4.8
ctags -R --c++-kinds=+l+x+p --fields=+iaSl --extra=+q --language-force=c++ -f stdcpp.tags

cd /usr/include/
ctags -R --c-kinds=+l+x+p --fields=+lS -I __THROW,__nonnull -f sys.tags
第四步：
设置UltiSnips，自定义UltiSnips的模板文件，我自定义的代码模板文件 cpp.snippets（如果是编辑.cpp文件，一定要写成cpp.snippets。安装官方文档解释，编辑某种类型的文件如：.c文件，会先去变量UltiSnipsSnippetsDir指定的文件夹下搜索c.snippets文件模板，文件名后缀必须和模板前缀一致，这也是UltiSnips工作的原理），路径必须设置为~/.vim/mysnippets/cpp.snippets，
有的教程设置路径为 ~/.vim/bundle/ultisnips/mysnippets/cpp.snippets，
对应设置如下： let g:UltiSnipsSnippetDirectories=["mysnippets"] 其中，目录名切勿取为 snippets，这是 UltiSnips 内部保留关键字；另外，目录一定要是 ~/.vim/ 下的子目录，也就是 vim 的运行时目录。（这个地方一定要注意，UltiSnipsSnippetDirectories设置为目录名称，不是绝对路径名称）

在vim中输入:UltiSnipsEdit，可以查看all.snippets，这个就是模板文件，会显示模板文件的路径，这个路径是let g:UltiSnipsSnippetsDir='~/.vim/mysnippets'设置的，不是let g:UltiSnipsSnippetDirectories=["mysnippets"]。
（最重要的一点：自定义的文件夹一定不能放到插件管理插件bundle所在的文件夹下，也就是~/.vim/bundle/文件夹下，因为在执行:PluginClean的时候会自动清除没有在~/.vimrc里注册的文件夹）
设置UltiSnips和YouCompleteMe快捷键<tab>不兼容问题：
let g:UltiSnipsSnippetDirectories=["mysnippets"]                                
let g:UltiSnipsSnippetsDir='~/.vim/mysnippets'
let g:UltiSnipsExpandTrigger="<leader><tab>"
let g:UltiSnipsJumpForwardTrigger="<leader><tab>"
let g:UltiSnipsJumpBackwardTrigger="<leader><s-tab>"
其中<leader>是：
"定义快捷键的前缀
let mapleader=";" 

第五步：
将YCM的配置文件.ycm_extra_conf.py放到~/目录下
第六步：
设置indexer的配置文件，indexer 还有个自己的配置文件，用于设定各个工程的根目录路径，配置文件位于 ~/.indexer_files，内容可以设定为：

--------------- ~/.indexer_files ---------------  
[foo] 
/data/workplace/foo/src/
[bar] 
/data/workplace/bar/src/
上例设定了两个工程的根目录，方括号内是对应工程名，路径为工程的代码目录，不要包含构建目录、文档目录，以避免将产生非代码文件的标签信息。
这样，从以上目录打开任何代码文件时，indexer 便对整个目录创建标签文件，若代码文件有更新，那么在文件保存时，indexer 将自动调用 ctags 更新标签文件，indexer 生成的标签文件以工程名命名，位于 ~/.indexer_files_tags/，并自动引入进 vim 中

第七步：
llvm+clang一定要是64位的
到LLVM官网（http://llvm.org/releases/download.html#3.7.0）下载ubuntu预编译包（Pre-Built Binaries）——Clang for x86_64 Ubuntu 14.04 (.sig)。然后解压，进入到解压的文件夹里（里面有四个文件夹bin，include，lib，share），将这四个文件夹拷到/usr/local下（命令行是$sudo cp -r ～/放解压文件的目录名/clang+llvm-3.7.0-x86_64-linux-gnu-ubuntu-14.04/* /usr/local）即可。在终端输入 clang –v ，就能看见安装好的 clang 编译器版本了。 libc++和libc++abi已经配置好，直接使用即可（以前的3.6版本的是没有配置好的，需要自己配置）。

