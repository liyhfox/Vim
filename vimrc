"======================================
"Last change : 2017-10-31 10:31
"
"======================================

if filereadable(expand("~/.vim/vimrc.bundles"))
source ~/.vim/vimrc.bundles
endif

execute pathogen#infect()
syntax enable
syntax on
filetype plugin indent on


" kill all buffers when :q
au bufenter * if 0 == len(filter(range(1, winnr('$')), 'empty(getbufvar(winbufnr(v:val), "&bt"))')) | qa! | endif
autocmd BufReadPost,BufNewFile *.cpp,*.c,*.h,*.hpp,*.cc,*.cxx autocmd VimEnter * UpdateTypesFile

" always show the file name
set laststatus=2
" function! CurDir()
"     let curdir = substitute(getcwd(), $HOME, "~", "g")
"     return curdir
" endfunction
" set statusline=\ %f%m%r%h\ %=\|\ %l,%c\ %p%%\ \|\ ascii=%b,hex=%b%{((&fenc==\"\")?\"\":\"\ \|\ \".&fenc)}\ 
" set background=light
" colorscheme solarized
"highlight CursorLine cterm=NONE ctermbg=NONE ctermfg=NONE guibg=red guifg=white

set autoindent "自动对齐
set autoread "auto update file in vim when it is updated outside
set backspace=2 "more powerful backspacing
set cursorline
set expandtab
"set foldmethod=indent
set hlsearch "高亮显示搜索找到的文本
set hidden "required for vim-ctrlspace
set ignorecase smartcase "搜索忽略大小写，但有大写时还是敏感
set incsearch "输入搜索内容就显示结果
set mouse=a "设置可用鼠标"
set nocompatible "Use Vim defaults instead of 100% vi compatibility
set nocscopeverbose
set number "显示行号
set selection=exclusive
set selectmode=key,mouse
set ruler
set showmatch
set shiftwidth=4
set tabstop=4 "tab长度为4
set tags+=~/.vim/tags/cpp_src_tags

"
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" key mapping
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
let mapleader=","
noremap <F2> :NERDTreeToggle<CR>
noremap <F3> :TagbarToggle<CR>
" noremap <F3> :TlistToggle<CR>
" noremap <F4> :WMToggle<CR>
noremap <F6> :!ctags -R --sort=yes --c++-kinds=+p --field=+iaS --extra=+q --language-force=C++ .<CR><CR> :TlistUpdate<CR>
imap <F6><ESC> :!ctags -R --sort=yes --c++-kinds=+p --field=+iaS --extra=+q --language-force=C++ .<CR><CR> :TlistUpdate<CR>
noremap <silent> <F8> :WMToggle<CR>
noremap <leader>l :IndentLinesToggle<CR>

"
"======================================
" nerdTree
"======================================
let NERDTreeMinimalUI=1
let NERDTreeAutoDeleteBuffer=1
let NERDTreeWinPos='left'
let NERDTreeWinSize = 30
let NEWDTreeShowBookmarks=1
autocmd VimEnter * NERDTreeToggle
wincmd w
autocmd VimEnter * wincmd w

"
"======================================
" taglist
"======================================
" let Tlist_Show_One_File=1  
" let Tlist_Exit_OnlyWindow=1
" let Tlist_Sort_type="name"

"
"======================================
" tagbar
"======================================
let g:tagbar_ctags_bin='ctags'
" let g:tagbar_autopreview=1
let g:tagbar_width=30
let g:tagbar_sort=0
autocmd BufReadPost *.cpp,*.c,*.h,*.hpp,*.cc,*.cxx call tagbar#autoopen()

"======================================
" omnicppcomplete
"======================================
set completeopt=longest,menu
let OmniCpp_NamespaceSearch=2
let OmniCpp_ShowPrototypeInAbbr=1
let OmniCpp_MayCompleteScope=1
let OmniCpp_MayCompleteDot=1
let OmniCpp_MayCompleteArrow=1
let OmniCpp_DefaultNamespaces=["std", "_GLIBCXX_STD"]

"
"======================================
" easyGrep 
"======================================
let g:EasyGrepFileAssociations="/home/liyehua/.vim/bundle/easygrep/plugin/EasyGrepFileAssociations" "指定同步类型
let g:EasyGrepMode = 2  "跟踪当前扩展  
let g:EasyGrepCommand = 0 "选择cmd为vimgrep，但是测试使用Grep也可以  
let g:EasyGrepRecursive = 1 "启动递归搜索  
let g:EasyGrepHidden = 1 "搜索隐藏文件  
let g:EasyGrepFilesToExclude = "*.bak, *~, cscope.*, *.a, *.o, *.pyc, *.bak"   "排除不想搜索的file类型  
let g:EasyGrepAllOptionsInExplorer = 1 "在使用GrepOption是是否显示所有配置项， 1 是显示  
let g:EasyGrepWindow = 1 "默认情况下也为0  就是Quickfix窗口  
let g:EasyGrepJumpToMatch = 1 "跳转第一个..  
let g:EasyGrepInvertWholeWord = 1 "搜索整个单词  
let g:EasyGrepFileAssociationsInExplorer = 1 "文件中显示关系表  
let g:EasyGrepReplaceWindowMode = 1 "全局代替时，执行当前窗口与下一个窗口拆分  

"
"======================================
" winManager
"======================================
let g:winManageWindowLayout = 'NERDTree|Tagbar'
let g:winManagerWidth = 40
" let g:AutoOpenWinManager=1

" let g:NERDTree_title = "[NERDTree]"
" function! NERDTree_Start()
"     exe 'q' "执行一个退出命令，关闭自动出现的窗口"
"     exe 'NERDTree'
" endfunction

" function! NERDTree_IsValid()
"     return 1
" endfunction

" " noremap  :NERDTreeFind

" let g:Tagbar_title = "[Tagbar]"
" function! Tagbar_Start()
"     exe 'q' "执行一个退出命令，关闭自动出现的窗口"
"     exe 'TagbarOpen'
" endfunction

" function! Tagbar_IsValid()
"     return 1
" endfunction
" let g:tagbar_vertical = 30

"
"======================================
" indentLine
"======================================
let g:indentLine_char = '¦'
let g:indentLine_color_term = 239 
let g:indentLine_setColors = 0
let g:indentLine_bgcolor_term = 202
let g:indentLine_bgcolor_gui = '#FF3030'

"
"======================================
" vim-commentary
"======================================
au FileType python,shell set commentstring=#\ %s
au FileType c,cpp set commentstring=//\ %s

"
"======================================
" vim-commentary
"======================================
let g:bufExplorerDefaultHelp=0
let g:bufExplorerShowRelativePath=1  " Show relative paths.
let g:bufExplorerSortBy='mru'        " Sort by most recently used.
let g:bufExplorerSplitRight=0        " Split left.
let g:bufExplorerSplitVertical=1     " Split vertically.
let g:bufExplorerSplitVertSize = 30  " Split width
let g:bufExplorerUseCurrentWindow=1  " Open in new window.
autocmd BufWinEnter \[Buf\ List\] setl nonumber

"
"======================================
" syntastic
"======================================
"let g:syntastic_enable_signs = 1
"let g:syntastic_error_symbol='✗'
"let g:syntastic_warning_symbol='►'
"let g:syntastic_always_populate_loc_list=1 "总是打开Location List（相当于QuickFix）窗口，如果你发现syntastic因为与其他插件冲突而经常崩溃，将选项置0
"let g:syntastic_auto_loc_list=1 "自动打开Locaton List，默认值为2，表示发现错误时不自动打开，当修正以后没有再发现错误时自动关闭，置1表示自动打开自动关闭，0表示关闭自动打开和自动关闭，3表示自动打开，但不自动关闭
"let g:syntastic_loc_list_height=5
""let g:syntastic_check_on_open=1 "打开文件时自动进行检查
""let g:syntastic_check_on_wq=0 "进行实时检查，如果觉得卡顿，将选项置为1
"let g:syntastic_enable_highlighting=1 "高亮错误
"let g:syntastic_cpp_checkers=['gcc']
"let g:syntastic_cpp_compiler='gcc'
"let g:syntastic_cpp_compiler_options='-std=c++11'
"let g:syntastic_python_checkers=['pyflakes'] "设置pyflakes为默认的python语法检查工具

""修复syntastic使用:lnext和:lprev出现的跳转问题，同时修改键盘映射使用sn和sp进行跳转
"function! <SID>LocationPrevious()                       
"    try                                                   
"        lprev                                               
"    catch /^Vim\%((\a\+)\)\=:E553/                        
"        llast                                               
"    endtry                                                
"endfunction                                             

"function! <SID>LocationNext()                           
"    try                                                   
"        lnext                                               
"    catch /^Vim\%((\a\+)\)\=:E553/                        
"        lfirst                                              
"    endtry                                                
"endfunction 
"nnoremap <silent> <Plug>LocationPrevious    :<C-u>exe 'call <SID>LocationPrevious()'<CR>                                        
"nnoremap <silent> <Plug>LocationNext        :<C-u>exe 'call <SID>LocationNext()'<CR>
"nmap <silent> sp    <Plug>LocationPrevious              
"nmap <silent> sn    <Plug>LocationNext

""关闭syntastic语法检查, 鼠标复制代码时用到, 防止把错误标志给复制了
"nnoremap <silent> <Leader>ec :SyntasticToggleMode<CR>
"function! ToggleErrors()
"    let old_last_winnr = winnr('$')
"    lclose
"    if old_last_winnr == winnr('$')
"        " Nothing was closed, open syntastic error location panel
"        Errors
"    endif
"endfunction


"
"======================================
" airline
"======================================
let g:airline_powerline_fonts=1
" let g:airline_theme="solarized"
" let g:airline_solarized_bg="dark"

"
"======================================
" neocomplete
"======================================
" " Disable AutoComplPop.
" let g:acp_enableAtStartup = 0
" " " Use neocomplete.
" let g:neocomplete#enable_at_startup = 1
" " " Use smartcase.
" let g:neocomplete#enable_smart_case = 1
" " " Set minimum syntax keyword length.
" let g:neocomplete#sources#syntax#min_keyword_length = 3

" " Define dictionary.
" let g:neocomplete#sources#dictionary#dictionaries = {
"     \ 'default' : '',
"     \ 'vimshell' : $HOME.'/.vimshell_hist',
"     \ 'scheme' : $HOME.'/.gosh_completions'
"     \ }

" " Define keyword.
" if !exists('g:neocomplete#keyword_patterns')
"     let g:neocomplete#keyword_patterns = {}
" endif
" let g:neocomplete#keyword_patterns['default'] = '\h\w*'
" " Plugin key-mappings.
" inoremap <expr><C-g> neocomplete#undo_completion()
" inoremap <expr><C-l> neocomplete#complete_common_string()
" " Rneocomplete#undo_completion()ecommended key-mappings.
" " <CR>: close popup and save indent.
" inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
" function! s:my_cr_function()
"     return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
"     " For no inserting <CR> key.
"     "return pumvisible() ? "\<C-y>" : "\<CR>"
" endfunction
" " <TAB>: completion.
" inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" " <C-h>, <BS>: close popup and delete backword char.
" inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
" inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
" " Close popup by <Space>.
" inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"
  
" " AutoComplPop like behavior.
" let g:neocomplete#enable_auto_select = 1
  
" " Shell like behavior(not recommended).
" set completeopt+=longest
" let g:neocomplete#enable_auto_select = 1
" let g:neocomplete#disable_auto_complete = 1
" inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"
  
" " Enable omni completion.
" autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
" autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
" autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
" autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
" autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
  
" " Enable heavy omni completion.
" if !exists('g:neocomplete#sources#omni#input_patterns')
"    let g:neocomplete#sources#omni#input_patterns = {}
" endif
" let g:neocomplete#sources#omni#input_patterns.php = '[^.\t]->\h\w*\|\h\w*::'
" let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:]*\t]\%(\.\|->\)'
" let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:]*\t]\%(\.\|->\)\|\h\w*::'
  
" " For perlomni.vim setting.
" " https://github.com/c9s/perlomni.vim
" let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
