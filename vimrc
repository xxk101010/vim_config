" 代码高亮

syntax on

" 显示行号
set number
" 显示tab键
set list
" 搜索时高亮显示被找到的文本
set hlsearch

" 自动缩进
set autoindent
set smartindent

set tabstop=4
set softtabstop=4
set shiftwidth=4
" 缩进用空格表示
set expandtab
"设置和vi一致
set nocompatible
set backspace=indent,eol,start


" 突出当前行 列
"au WinEnter * set cursorline cursorcolumn
"au WinEnter * set cursorcolumn cursorcolumn

"开启光亮光标行
set cursorline
set cursorcolumn

"开启高亮光标列
"set cursorcolumn

" vundle配置
set nocompatible              " be iMproved, required
filetype off                  " required
set rtp+=~/.vim/bundle/vundle.vim/
call vundle#begin()
Plugin 'tomasr/molokai'
Plugin 'VundleVim/Vundle.vim'
Plugin 'mileszs/ack.vim'
Plugin 'git://github.com/scrooloose/nerdtree.git'
Plugin 'git://github.com/petRUShka/vim-opencl.git'
Plugin 'git://github.com/kien/ctrlp.vim.git'
"Plugin 'git://github.com/xolox/vim-misc.git'
"Plugin 'git://github.com/mbbill/code_complete'
Plugin 'Valloric/YouCompleteMe'
Plugin 'taglist.vim'
Plugin 'vim-scripts/a.vim'
Plugin 'vim-scripts/DoxygenToolkit.vim'
"Bundle 'scrooloose/syntastic'
Plugin 'tacahiroy/ctrlp-funky'
Plugin 'echofunc.vim'
Plugin 'rhysd/vim-clang-format'
Plugin 'iamcco/markdown-preview.vim'
Plugin 'godlygeek/tabular'
"Bundle 'git@github.com:aperezdc/vim-template.git'
"Bundle 'autoproto.vim'
"Bundle 'vim-template'
Plugin 'bronson/vim-trailing-whitespace'
map <leader><space> :FixWhitespace<cr>
Plugin 'plasticboy/vim-markdown'
Plugin 'Chiel92/vim-autoformat'
Plugin 'suan/vim-instant-markdown'
Plugin 'Xuyuanp/nerdtree-git-plugin'
call vundle#end()            " required
filetype plugin indent on    " required

" Taglist
let Tlist_Show_One_File=1    "只显示当前文件的tags
let Tlist_WinWidth=30        "设置taglist宽度
let Tlist_Exit_OnlyWindow=1  "tagList窗口是最后一个窗口，则退出Vim
let Tlist_Use_Right_Window=1 "在Vim窗口右侧显示taglist窗口
let NERDTreeShowHidden=1
map <F4> :NERDTreeToggle<CR>
map <F3> :Tlist<CR>

" 配色设置
colorscheme molokai

" 函数自动提示
set tags+=~/.vim/systags
set tags+=./tags,tags;$HOME

" 粘贴不自动缩进
set pastetoggle=<F9>
" 记住光标位置
set viminfo='10,\"100,:20,%,n~/.viminfo
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif

"自动注释
let g:DoxygenToolkit_authorName="xtg"

"YouCompleteMe

let g:ycm_global_ycm_extra_conf='~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
"let g:ycm_global_ycm_extra_conf='~/.vim/.ycm_extra_conf.py'
let g:ycm_confirm_extra_conf=0
set completeopt=longest,menu
let g:ycm_key_list_previous_completion=['<Down>']
let g:ycm_key_list_previous_completion=['<Up>']
let g:ycm_semantic_triggers = {}
let g:ycm_collect_identifiers_from_tags_files=1
"let g:ycm_min_num_of_chars_for_completion=2
let g:ycm_seed_identifiers_with_syntax=1
let g:ycm_complete_in_comments=1
let g:ycm_complete_in_strings=1
let g:ycm_collect_identifiers_from_comments_and_strings=0
let g:ycm_semantic_triggers.c = ['->', '.', ' ', '(', '[', '&']
let g:ycm_show_diagnostics_ui = 0

"自动折叠
"set foldmethod=syntax " 设置语法折叠
set foldmethod=manual "设置手动折叠
set foldlevelstart=99
set foldcolumn=0 " 设置折叠区域的宽度
" 用空格键来开关折叠
nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>

autocmd vimenter * NERDTree
let g:NERDTreeWinSize = 35

set mouse=a

inoremap ( ()<ESC>i

inoremap [ []<ESC>i

inoremap { {}<ESC>i


" 让NERDTree 光标在右边
if argc()>0
wincmd w
autocmd VimEnter * wincmd w
endif

"在打开文件的时候检查
"let g:syntastic_check_on_open=0
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open =0
let g:syntastic_check_on_wq = 0
"let g:syntastic_c_compiler =['gcc']
"let g:syntastic_c_checkers=['gcc']

" Tlist_Refresh_Folds
function! s:Tlist_Refresh_Folds()

	if g:Tlist_Show_One_File
		return
	endif

	let winnum = bufwinnr(g:TagList_title)
	if winnum == -1
		return
	endif
endfunction

" 注释颜色
" highlight Comment ctermfg=green guifg=green
"
"
" clang format
let g:clang_format#command = "/usr/bin/clang-format"
" clang-format -style=mozilla -dump-config > .clang-format
map <F5> :ClangFormat<CR>
map <F2> :!ctags -R --c-kinds=+p --fields=+iaS --extra=+q --language-force=C++ . <CR> <CR>

"git
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
    \ }

map <F7> :set wrap<CR>
map <F8> :set nowrap<CR>
