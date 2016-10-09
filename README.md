# linux_vimrc
linuc vimrc
第一步：
先下载管理插件的插件vundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
第二步：
如果vundle下载YCM出现错误还需要手动下载YCM
下载llvm+clang，并编译YCM
第三步：
设置C/C++的tags
cd /usr/include/c++/4.8
ctags -R --c++-kinds=+l+x+p --fields=+iaSl --extra=+q --language-force=c++ -f stdcpp.tags

cd /usr/include/
ctags -R --c-kinds=+l+x+p --fields=+lS -I __THROW,__nonnull -f sys.tags
