"leader键设置
let mapleader=" "
"显示行号
set nu 
"自动补全
set wildmenu
"缩进
set tabstop=4
set shiftwidth=4
set softtabstop=4
"高亮
syntax on
"显示输入命令
set showcmd
"下划线光标行
set cursorline
"高亮搜索
set hlsearch
exec "nohlsearch"
set incsearch
"搜索不区分大小写/智能大小写
set ignorecase
set smartcase
"esc->jj
imap jj <Esc>
"转到上/下个搜索结果并居中
noremap = nzz
noremap - Nzz
"取消搜索高亮
noremap p :nohlsearch<CR>

"快速移动行
noremap , 5k
noremap . 5j

noremap j h
noremap l j
noremap ; l

map w :w<CR>
map W :w<space>
map q :q<CR>
map Q :q!<CR>

"分屏
map s <nop>
map s<Left> :set nosplitright<CR>:vsplit<CR>
map s<Right> :set splitright<CR>:vsplit<CR>
map s<Up> :set nosplitbelow<CR>:split<CR>
map s<Down> :set splitbelow<CR>:split<CR>
map <LEADER><Left> <C-w>h
map <LEADER><Right> <C-w>l
map <LEADER><Up> <C-w>k
map <LEADER><Down> <C-w>j

map sj :set nosplitright<CR>:vsplit<CR>
map s; :set splitright<CR>:vsplit<CR>
map sk :set nosplitbelow<CR>:split<CR>
map sl :set splitbelow<CR>:split<CR>
map <LEADER>j <C-w>h
map <LEADER>; <C-w>l
map <LEADER>k <C-w>k
map <LEADER>l <C-w>j

"兼容性
set nocompatible
filetype on
filetype indent on
filetype plugin on
filetype plugin indent on
set encoding=utf-8
"显示行尾空格
set list
set listchars=tab:▸\ ,trail:▫
"不同模式光标设置
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"
"执行命令处于当前目录
set autochdir
"能看到光标所在行附近的内容
set scrolloff=5

"root保存
map ss :w !sudo tee %<CR>




"插件
call plug#begin()

Plug 'vim-airline/vim-airline'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'Raimondi/delimitMate'
Plug 'preservim/nerdcommenter'
Plug 'puremourning/vimspector'
call plug#end()

"coc.nvim
set hidden
set updatetime=100
set signcolumn=yes

inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#confirm() :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()

inoremap <silent><expr> <S-TAB>
      \ coc#pum#visible() ? coc#pum#cancel() : "\<S-TAB>"

"inoremap <silent><expr> <TAB>
"      \ coc#pum#visible() ? coc#pum#cancel() :
"      \ CheckBackspace() ? "\<Tab>" :
"      \ coc#refresh()

"inoremap <silent><expr> <Space>
"      \ coc#pum#visible() ? coc#pum#confirm() : "\<Space>"
      
"inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
"        \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" 跳转定义
nmap <silent> gd <Plug>(coc-definition)
" 查看文档
nnoremap <silent> K :call CocActionAsync('doHover')<CR>
" 查找引用
nmap <silent> gr <Plug>(coc-references)
" 重命名
nmap <leader>rn <Plug>(coc-rename)
" 格式化
nmap <leader>f  <Plug>(coc-format)
" 代码修复
nmap <leader>a  <Plug>(coc-codeaction)

" 高亮
autocmd CursorHold * silent call CocActionAsync('highlight')

"NERDTreeToggle
map <LEADER><LEADER> :NERDTreeToggle<CR>
autocmd VimEnter * NERDTree | wincmd p
autocmd bufenter * if (winnr("$") == 1 && &filetype == "nerdtree") | q | endif

" python
inoremap <C-[> <Esc><<
inoremap <C-]> <Esc>>>
nnoremap <C-[> <<
nnoremap <C-]> >>
vnoremap <C-[> <
vnoremap <C-]> >

nmap <C-_> <Plug>NERDCommenterToggle

" python 调试
nnoremap <F1> :w<CR>:!python3 %<CR>
inoremap <F1> <Esc>:w<CR>:!python3 %<CR>
nnoremap <F2> :VimspectorReset<CR>
let g:vimspector_enable_mappings = 'HUMAN'
let g:vimspector_install_gadgets = [ 'debugpy']
