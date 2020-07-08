"关闭兼容模式
set nocompatible 

call plug#begin('$HOME/vimfiles/plugged')
  Plug 'mhinz/vim-startify'
  Plug 'yianwillis/vimcdoc'

  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
    let g:airline#extensions#tabline#enabled=1
    let g:airline#extensions#tabline#show_close_button=0
    let g:airline_theme='solarized'
    " let g:airline_solarized_bg='light'
    let g:airline_powerline_fonts=1
  Plug 'altercation/vim-colors-solarized'   
    " let g:solarized_termcolors=256
    " let g:solarized_termtrans=1
    " let g:solarized_italic=0

  Plug 'haya14busa/incsearch.vim'
    let g:incsearch#auto_nohlsearch = 1
		map /  <Plug>(incsearch-forward)
		map ?  <Plug>(incsearch-backward)
    map g/ <Plug>(incsearch-stay)
    map n  <Plug>(incsearch-nohl-n)
    map N  <Plug>(incsearch-nohl-N)
    map *  <Plug>(incsearch-nohl-*)
    map #  <Plug>(incsearch-nohl-#)
    map g* <Plug>(incsearch-nohl-g*)
    map g# <Plug>(incsearch-nohl-g#)
 
  Plug 'preservim/nerdtree', { 'on':  'NERDTreeToggle' }
    let NERDTreeShowHidden = 1
    let NERDTreeIgnore = ['\.git$', '\.idea$', '\~$']
  Plug 'xuyuanp/nerdtree-git-plugin', { 'on':  'NERDTreeToggle' }
    map ,nt :NERDTreeToggle<CR>
    map ,nf :NERDTreeFind<CR>
  Plug 'tpope/vim-fugitive'
  Plug 'airblade/vim-gitgutter'
    let g:gitgutter_map_keys = 0
    nmap ghp <Plug>(GitGutterPreviewHunk)
    nmap ghs <Plug>(GitGutterStageHunk)
    nmap ghu <Plug>(GitGutterUndoHunk)
    nmap ght <Plug>(GitGutterToggle)
    nmap [c <Plug>(GitGutterPrevHunk)
    nmap ]c <Plug>(GitGutterNextHunk)
    omap ih <Plug>(GitGutterTextObjectInnerPending)
    omap ah <Plug>(GitGutterTextObjectOuterPending)
    xmap ih <Plug>(GitGutterTextObjectInnerVisual)
    xmap ah <Plug>(GitGutterTextObjectOuterVisual)
    nnoremap ghf :GitGutterFold<CR>

  Plug 'preservim/nerdcommenter'
    let g:NERDCommentEmptyLines=1
    let g:NERDSpaceDelims=1
    let g:NERDDefaultNesting=0

  Plug 'jiangmiao/auto-pairs'
  Plug 'tpope/vim-surround'
  Plug 'mhinz/vim-grepper'
    let g:grepper={}
    let g:grepper.operator={}
    runtime plugin/grepper.vim
    let g:grepper.highlight=1
    let g:grepper.operator.tools=['rg']
    nmap gs <Plug>(GrepperOperator)
    xmap gs <Plug>(GrepperOperator)
    nnoremap <Leader>* :Grepper -tool rg -cword<CR>
    nnoremap <Leader>gf :Grepper -tool rg<CR>
  Plug 'brooth/far.vim'
  Plug 'junegunn/fzf'
  Plug 'junegunn/fzf.vim'
  Plug 'junegunn/gv.vim'
  Plug 'yssl/QFEnter'

  " 引入编程相关插件
  Plug 'editorconfig/editorconfig-vim'
    let g:EditorConfig_exclude_patterns=['fugitive://.*', 'scp://.*']
  Plug 'alvan/vim-closetag'
  Plug 'mattn/emmet-vim'
  Plug 'heavenshell/vim-jsdoc'
    let g:jsdoc_lehre_path = 'C:\Users\liubo\AppData\Roaming\npm\lehre.cmd'
  " 引入语法文件
  " let g:polyglot_disabled = ['less']
  Plug 'sheerun/vim-polyglot'
    let g:vue_pre_processors='detect_on_enter'
    " 解决在vue文件中不同模块间的注释问题
    let g:ft = ''
    function! NERDCommenter_before()
      if &ft == 'vue'
        let g:ft = 'vue'
        let stack = synstack(line('.'), col('.'))
        if len(stack) > 0
          let syn = synIDattr((stack)[0], 'name')
          if len(syn) > 0
            exe 'setf ' . substitute(tolower(syn), '^vue_', '', '')
          endif
        endif
      endif
    endfunction
    function! NERDCommenter_after()
      if g:ft == 'vue'
        setf vue
        let g:ft = ''
      endif
    endfunction    
  " Plug 'hail2u/vim-css3-syntax'
    " https://github.com/hail2u/vim-css3-syntax#highlighting-problems-on-vertical-align-box-shadow-and-others
    " This setting have side effects. So, use it at your own risk.
    " augroup VimCSS3Syntax
      " autocmd!
      " autocmd FileType css setlocal iskeyword+=-
    " augroup END

  Plug 'honza/vim-snippets'
  Plug 'dense-analysis/ale'
    let g:ale_linters_explicit = 1
    let g:ale_sign_column_always = 1
    let g:ale_echo_msg_format = '[%linter%][%code%] %s [%severity%]'
    let g:ale_pattern_options_enabled = 1
    let g:ale_sign_highlight_linenrs = 1
    let g:ale_pattern_options = {
          \'\.min\.js$': {'ale_linters': [], 'ale_fixers': []},
          \'\.min\.css$': {'ale_linters': [], 'ale_fixers': []},
          \}
    let g:ale_linter_aliases = {
          \'vue': ['vue', 'javascript', 'less'],
          \'javascriptreact': ['javascript', 'jsx'],
          \'typescript': ['typescript', 'tsx']
          \}

    let g:ale_linters = {
        \'javascript': ['eslint'],
        \'vue': ['eslint', 'stylelint'],
        \'less': ['stylelint'],
        \'css': ['stylelint']
        \  }
    let g:ale_fixers = {
        \'javascript': ['eslint'],
        \'vue': ['eslint', 'stylelint'],
        \'less': ['stylelint'],
        \'css': ['stylelint']
        \}
    nmap <silent> <C-k> <Plug>(ale_previous_wrap)
    nmap <silent> <C-j> <Plug>(ale_next_wrap)

  Plug 'neoclide/coc.nvim', {'branch': 'release'}
    let g:markdown_fenced_languages = ['html', 'css', 'js=javascript']
    let g:coc_global_extensions=[
      \'coc-css',
      \'coc-snippets',
      \'coc-html',
      \'coc-json',
      \'coc-translator',
      \'coc-tsserver',
      \'coc-vetur',
      \'coc-yaml',
      \'coc-tabnine',
      \'coc-tailwindcss'
      \]
       " coc-eslint 由其他组件实现
       " coc-tabnine 一种智能补全方案
       " coc-tailwindcss class名补全

    " Use tab for trigger completion with characters ahead and navigate.
    " NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
    " other plugin before putting this into your config.
    " inoremap <silent><expr> <TAB>
          " \ pumvisible() ? "\<C-n>" :
          " \ <SID>check_back_space() ? "\<TAB>" :
    "       \ coc#refresh()

    " Make <tab> used for trigger completion, completion confirm, snippet expand and jump like VSCode.
    let g:coc_snippet_next = '<tab>'
    inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

    function! s:check_back_space() abort
      let col = col('.') - 1
      return !col || getline('.')[col - 1]  =~# '\s'
    endfunction

    " Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
    " position. Coc only does snippet and additional edit on confirm.
    if exists('*complete_info')
      inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
    else
      imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
    endif

    " Use `[g` and `]g` to navigate diagnostics
    nmap <silent> [g <Plug>(coc-diagnostic-prev)
    nmap <silent> ]g <Plug>(coc-diagnostic-next)

    " GoTo code navigation.
    nmap <silent> gd <Plug>(coc-definition)
    nmap <silent> gy <Plug>(coc-type-definition)
    nmap <silent> gi <Plug>(coc-implementation)
    nmap <silent> gr <Plug>(coc-references)

    " Use K to show documentation in preview window.
    nnoremap <silent> K :call <SID>show_documentation()<CR>

    function! s:show_documentation()
      if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
      else
        call CocAction('doHover')
      endif
    endfunction

    " Symbol renaming.
    nmap <leader>rn <Plug>(coc-rename)

    " Formatting selected code.
    xmap <silent> <leader>f  <Plug>(coc-format-selected)
    nmap <silent> <leader>f  <Plug>(coc-format-selected)

    augroup mygroup
      autocmd!
      " Setup formatexpr specified filetype(s).
      autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
      " Update signature help on jump placeholder.
      autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
      " Highlight the symbol and its references when holding the cursor.
      autocmd CursorHold * silent call CocActionAsync('highlight')
    augroup end

    " Apply AutoFix to problem on the current line.
    nmap <leader>qf  <Plug>(coc-fix-current)

    " Map function and class text objects
    " NOTE: Requires 'textDocument.documentSymbol' support from the language server.
    xmap if <Plug>(coc-funcobj-i)
    xmap af <Plug>(coc-funcobj-a)
    omap if <Plug>(coc-funcobj-i)
    omap af <Plug>(coc-funcobj-a)
    xmap ic <Plug>(coc-classobj-i)
    omap ic <Plug>(coc-classobj-i)
    xmap ac <Plug>(coc-classobj-a)
    omap ac <Plug>(coc-classobj-a)

    " Use CTRL-S for selections ranges.
    " Requires 'textDocument/selectionRange' support of LS, ex: coc-tsserver
    nmap <silent> <C-s> <Plug>(coc-range-select)
    xmap <silent> <C-s> <Plug>(coc-range-select)

    " Add (Neo)Vim's native statusline support.
    " NOTE: Please see `:h coc-status` for integrations with external plugins that
    " provide custom statusline: lightline.vim, vim-airline.
    " set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

    " coc-translate 
    nmap <Leader>t <Plug>(coc-translator-e)
    vmap <Leader>t <Plug>(coc-translator-ev)
    
call plug#end()
" map
nnoremap ,w <C-W>
nnoremap ,s :w<CR>
nnoremap ,doc :JsDoc<CR>
nnoremap ,tb :botright terminal ++rows=10 bash<CR>
" 调用GV查看git历史时使用自定义参数
nnoremap ,gv :GV --all --date-order<CR> 
" terminal switch to normal model
tnoremap <Esc> <C-W>N

" 设置terminal语言
let $LANG = 'zh_CN.utf-8'

" 主题色
set background=dark
colorscheme solarized
set t_Co=256

" 显示语法高亮
syntax enable

" 显示输入命令
set showcmd
" 显示行号
set number
" 开启自动缩进
set autoindent
" 智能缩进
set smartindent
set smarttab
set expandtab
" 插入模式允许删除
set backspace=indent,eol,start
" 将tab转为空格
set expandtab
" 高亮搜索模式
set hlsearch
" 动态高亮显示搜索内容
set incsearch
" 搜索忽略大小写
set ignorecase
" 设置折叠方式
set foldmethod=indent
set foldlevel=3
" 设置滚动时上下两侧保留的最小行数
set scrolloff=5
" 设置缩进的空白数目
set shiftwidth=2
" 设置tab代表的空格数
set tabstop=2

" 设置vim内部编码
set encoding=utf-8
" 设置编辑文件时的编码
set fileencoding=utf-8
" 设置vim能识别的编码
set fileencodings=ucs-bom,utf-8,chinese,latin1
" 设置终端模式下的编码
set termencoding=utf-8
" 读入外部命令输出编码
set makeencoding=char

set hidden
set nobackup
set nowritebackup
set updatetime=1000
set shortmess+=c
" 文件外部改动后自动加载
set autoread
" 不生成备份文件
set nobackup
" 不生成临时文件
set noswapfile
" 不生成undo文件
set noundofile

" 自动检测文件类型，并根据文件类型显示代码高亮，设置缩进格式，加载对应插件
filetype plugin indent on
if has('gui_running')
  " 关闭工具栏	
  set guioptions-=T	
  " 关闭菜单
  set guioptions-=m
  " 关闭左侧滚动条
  set guioptions-=L
  " 关闭右侧滚动条
  set guioptions-=r
  set guifont=Powerline_Consolas:h12:cANSI:qDRAFT
  " 解决菜单乱码
  source $VIMRUNTIME/delmenu.vim
  source $VIMRUNTIME/menu.vim
  " 解决consle输出乱码
  lang messages zh_CN.utf-8
endif

augroup custom
  autocmd!
  " 设置GV文件的折叠方式为手动
  autocmd FileType GV setlocal foldmethod=manual
  " 解决vue文件滑动过快导致高亮失效
  autocmd FileType vue syntax sync fromstart
  " 设置.wpy文件的高亮
  autocmd BufRead,BufNewFile *.{wpy} setlocal filetype=vue.html.javascript.css
  " 适配signcolumn高亮
  highlight! link SignColumn LineNr
augroup end
