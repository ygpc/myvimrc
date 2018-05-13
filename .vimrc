" setting
"vi互換モードをoff
set nocompatible
"文字コードをUFT-8に設定
set fenc=utf-8
" バックアップファイルを作らない
set nobackup
" スワップファイルを作らない
set noswapfile
" 編集中のファイルが変更されたら自動で読み直す
set autoread
" バッファが編集中でもその他のファイルを開けるように
set hidden
" 入力中のコマンドをステータスに表示する
set showcmd


" 見た目系
" 行番号を表示
set number
" 構文ごとに色分け表示する
" 逆は [ syntax off ]
syntax on 
" 現在の行を強調表示
set cursorline
" 現在の行を強調表示（縦）
set cursorcolumn
" 行末の1文字先までカーソルを移動できるように
set virtualedit=onemore
" インデントはスマートインデント
"set smartindent
" ビープ音を可視化
set visualbell
" 括弧入力時の対応する括弧を表示
set showmatch
" ステータスラインを常に表示
set laststatus=2
" コマンドラインの補完
set wildmode=list:longest
" 折り返し時に表示行単位での移動できるようにする
nnoremap j gj
nnoremap k gk


" Tab系
" 不可視文字を可視化(タブが「▸-」と表示される)
set list listchars=tab:\▸\-
" Tab文字を半角スペースにする
"set expandtab
" 行頭以外のTab文字の表示幅（スペースいくつ分）
set tabstop=2
" 行頭でのTab文字の表示幅
set shiftwidth=2


" 検索系
" 検索文字列が小文字の場合は大文字小文字を区別なく検索する
set ignorecase
" 検索文字列に大文字が含まれている場合は区別して検索する
set smartcase
" 検索文字列入力時に順次対象文字列にヒットさせる
set incsearch
" 検索時に最後まで行ったら最初に戻る
set wrapscan
" 検索語をハイライト表示
set hlsearch
" ESC連打でハイライト解除
nmap <Esc><Esc> :nohlsearch<CR><Esc>
"インサートモードでEscをjjにバインド
inoremap <silent> jj <Esc>
 " Note: Skip initialization for vim-tiny or vim-small.
   if 0 | endif
 
if &compatible
      endif
 
     " Required:
      set runtimepath+=~/.vim/bundle/neobundle.vim/
 
          " Required:
            call neobundle#begin(expand('~/.vim/bundle/'))
 
          " Let NeoBundle manage NeoBundle
           " Required:
            NeoBundleFetch 'Shougo/neobundle.vim'
           " My Bundles here:
           " Refer to |:NeoBundle-examples|.
           " Note: You don't set neobundle setting in .gvimrc!
 
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'Shougo/vimproc', {
  \ 'build' : {
    \ 'windows' : 'make -f make_mingw32.mak',
    \ 'cygwin' : 'make -f make_cygwin.mak',
    \ 'mac' : 'make -f make_mac.mak',
    \ 'unix' : 'make -f make_unix.mak',
  \ },
  \ }
NeoBundle 'Shougo/neobundle.vim'
NeoBundle 'thinca/vim-quickrun'
						call neobundle#end()
 
           " Required:
           filetype plugin indent on
 
          " If there are uninstalled bundles found on startup,
         " this will conveniently prompt you to install them.
          NeoBundleCheck
let g:quickrun_config={}
let g:quickrun_config['tex'] = {
            \   'command' : 'latexmk',
            \   'outputter' : 'error',
            \   'outputter/error/error' : 'quickfix',
						\ 'hook/sweep/files' : [
						\                      '%S:p:r.aux',
						\                      '%S:p:r.bbl',
						\                      '%S:p:r.blg',
						\                      '%S:p:r.dvi',
						\                      '%S:p:r.fdb_latexmk',
						\                      '%S:p:r.fls',
						\                      '%S:p:r.log',
						\                      '%S:p:r.out'
						\                      ],
						\  'exec': ['%c -gg -pdfdvi %s', 'xdg-open %s:r.pdf']           
						\ }

if &term =~ "xterm"
    let &t_ti .= "\e[?2004h"
    let &t_te .= "\e[?2004l"
    let &pastetoggle = "\e[201~"

    function XTermPasteBegin(ret)
        set paste
        return a:ret
    endfunction

    noremap <special> <expr> <Esc>[200~ XTermPasteBegin("0i")
    inoremap <special> <expr> <Esc>[200~ XTermPasteBegin("")
    cnoremap <special> <Esc>[200~ <nop>
    cnoremap <special> <Esc>[201~ <nop>
endif
