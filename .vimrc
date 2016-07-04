set nocompatible              " We want the latest Vim Settings/Option
set wrap
set linebreak
set guifont=Monospace\ 10
set showbreak=------->>>>>
let mapleader=","


filetype plugin indent on
" show existing tab with 4 spaces width
set tabstop=4
set linespace=2
" when indenting with '>', use 4 spaces width
set shiftwidth=1
" On pressing tab, insert 4 spaces
set expandtab                    
set softtabstop=4

set noerrorbells visualbell t_vb=    "Hilangkan suara error Bell
so /etc/vim/plugins.vim
syntax enable
set backspace=indent,eol,start						"Make backspace works like other editor
set number								"aktifkan line number
set linespace=1							"khusus untuk mac vim line space jadi 15
set virtualedit=onemore							"ketika insert masuk karakter selanjutnya
set smarttab
set ignorecase                   "ketika search jangan perhatikan Case
set mouse=a "aktikan mouse saat berada dalam terminal vim"
set autowriteall "secara otomatis save file ketika pindah buffer"

" ------------- Searching ---------------"
"Buat highlight item yang dicari
set hlsearch
set incsearch
" ------------- Visuals ---------------"
"let g:solarized_termcolors=256
set background=dark
colorscheme solarized
set guifont=Lucida_Console:h11
set guifont=Monospace\ 10
set guioptions-=e "Jangan munculkan GUI tabs
" Hilangkan scroll bar di kanan dan di kiri
set guioptions-=l
set guioptions-=l
set guioptions-=r
set guioptions-=R

" ------------- PowerLine ---------------"
let g:Powerline_symbols = 'fancy'
set laststatus=2 "Selalu tunjukkan status line"
set encoding=utf-8 "Selalu tunjukkan encoding"

" Buat singkatn untuk generate model / controller 
abbrev gm !php artisan make:model
abbrev gc !php artisan make:controller
abbrev gmig !php artisan make:migration



"Bikin supaya gampang mengedit vimrc
" ------------- Mtabedit $MYVIMRCapping ---------------"
map <silent> <F11>
\    :call system("wmctrl -ir " . v:windowid . " -b toggle,fullscreen")<CR>
vmap <C-c> "+yi
vmap <C-x> "+c
vmap <C-v> c<ESC>"+p
imap <C-v> <C-r><C-o>+

nmap <Leader>ev :tabedit $MYVIMRC<cr>
"Bikin supaya gampang menghilangkan highlight di pencarian
nmap ,<space> :nohlsearch<cr>
"Buat supaya toggle NERDTree lebih mudah
nmap <C-1> :NERDTreeToggle<cr>
"Buat BufTag Lebih mudah
nmap <C-r> :CtrlPBufTag<cr>
"Ke File yang baru2 ini dilihat
nmap <C-e> :CtrlPMRUFiles<cr>
"Buat CtrlP sama 
"Buat supaya bisa save file saat insert mode
noremap <C-P> <Esc>:CtrlP /var/www/kje<cr>
"Buat CtrlS untuk ngesave
nmap <C-s> :w!<cr>
"Buat supaya lebih mudah save smua file
nmap <Leader>ss :wa<cr>
"Buat supaya bisa insert line tanpa masuk insert mode
nmap <Leader>O o<Esc>k
"Pengganti Command + Shift + Find di Vim
nmap ,ff :GitGrep<Space>
"Align Seperti Sublim
nmap ga <Plug>(EasyAlign)
xmap ga <Plug>(EasyAlign)
map <Leader>w H<Plug>(easymotion-w)
" Buat supaya tekan tombol escape lebih mudah
imap jj <esc><esc><esc>
" Buat supaya membuka Plugin lebih mudah
nmap <Leader>ep :e /etc/vim/plugins.vim<cr>
"buat supaya melebarkan kolom window split lebih mudah
nmap <C-v> :vertical resize +5<cr>
"buka file yang aktif ini di Google Chrome berguna untuk ngetes file html
"static
nmap ,o :!open -a Google\ Chrome<cr> 
" ke buffer berikutnya aatau buffer sebelumnya
nmap :bp :BufSurfBack<cr>
nmap :bn :BufSurfForward<cr>
" Buat supaya buffer delete lebih mudah
nmap <Leader>qq :bd<cr>
" Tutup semua buffer
nmap <Leader>qa :bufdo bd!<cr>
" buat supaya gampang edit td tabel
nmap <Leader>nn yypwwwcit
" Buat supaya td di laravel bisa langsung fokus di {{ $variable ->(fokus) }}
nmap <Leader>nd yypwwwwwwcw
nmap <Leader>bl :set ft=blade.html<cr>

"Aktifkan snippet javascript
nmap <Leader>js :set ft=.js<cr>

"delete tanpa menghapus registry di yank
vmap <Leader>d "_d
nmap <Leader>d "_d

"Ignore folder berikut dalam pencarian
set wildignore+=*/vendor/**
set wildignore+=*/public/forum/**
"Buat Ag hanya membaca dari root directory


"Buat file baru dalam folder yang memiliki file yang sekarang aktif
nmap <Leader>nf :edit %:p:h/
"Buat supaya gampang mengedit html snippets
nmap <Leader>eh :e ~/.vim/bundle/vim-snippets/snippets/html.snippets<cr>

"Perinta // untuk search kata / kalimat yang ada dalam visual
vnoremap // y/<C-R>"<CR>

" Jalankan PhpUnitTest
nmap <Leader>t :!phpunit %<cr>

"Buat langsung ke direktori project saat buka mvim
nmap <Leader>pp :cd ~/Code/kje/<cr>:Ag ''<Left>
"Ulangi Scan Folder Tree untuk Ctrl p
nmap <Leader>cp :CtrlPClearCache<cr>

" Biat gampang pindah line seperti ctrl shift up down di sublime
nnoremap <C-j> :m .+1<CR>==
nnoremap <C-k> :m .-2<CR>==
inoremap <C-j> <Esc>:m .+1<CR>==gi
inoremap <C-k> <Esc>:m .-2<CR>==gi
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv


" ------------- Plugins ---------------"
"  CtrlP supaya lebih mudah dibaca
let g:ctrlp_custom_ignore = 'node_modules\DS_Store\|git'
let g:ctrlp_match_window = 'top,order:ttb,min:1,max:30,result:30'

"NERDTree supaya jangan overide Vinegar

let NERDTreeHijackNetrw = 0

"Konfigurasi untuk Greplace vim

set grepprg=ag "kita akan menggunakan Ag untuk search multiple files
let g:grep_cmd_opts = '--line-numbers --noheading'

" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-c>'
 
"snipet biar kaya sublim :/
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsListSnippets="<c-l>"
"let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
"let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsSnippetDirectories=["plugged/vim-snippets/UltiSnips"]

" ------------- AutoCommand ---------------"
"Buat menympaimpan source secara otomatis ketika di save
augroup autosourcing
	autocmd!
	autocmd BufWritePost .vimrc source %
augroup END


" ------------- Konfigurasi untuk pdv ---------------"
let g:pdv_template_dir = $HOME ."/.vim/bundle/pdv/templates_snip"
nnoremap <Leader>d :call pdv#DocumentWithSnip()<CR>


"Notes perintah sederhana
" zz - untuk membuat cursor berada di tengah layar tanpa merubah line
"  di( - delete inside tanda kurung
"  di' - delete inside tanda '
"  $ - pergi ke akhir line
        "  o - buat dan insert line baru
        "  e - ke akhir kata di depan
        "  w - ke awal kata di depan
        "  b - ke awal kata di belakang
        "  0 - pindah ke awal line
"  gg - pinah ke karakter pertama dari file
"  G - pindah ke karakter terakhir dair file
"  Command + Control F -> keluar atau masuk ke full screen
"  control + ] -> pergi ke asal dipanggilnya function ini 
"  v -> untuk indent
"  Pindah ke baris nomo 42 -> 42gg
"  dash(-) untuk tujukkan folder
"  cw - change word, edit satu kata
" \w : easy motion
" C : mengganti satu kalimat di depan
" . (titik) digunakan untuk  mengulang perintah terakhir
" r pada saat normal mode, digunakan untuk replace 1 karakter
" cst = Change sorounding tag , ganti tag
" dst = Delete sorounding tag , hapus tag yang mengelilinginya
" S = tambahkan sesuatu diantaranya
" S = tambahkan tag diantaranya
" Ctrl + w + o => menutup semua window split kecuali yang aktif
" za membuka satu scrol 
" zO buka semua fold dalam satu file
" zo buka satu fold
" zc tutup satu fold
" ,ss untuk save semua file
" Cmd-S untuk save pada saat normal mode
" Cmd-P untuk melakukan search CtrlP
" H Pindah ke puncak layar 
" M Pindah ke tengah layar 
" L Pindah ke tengah layar 
" J hilangkan page break, buat beberapa baris dalam visual menjadi satu baris
" f pindah kursor ke huruf yang diketik setelah f, contof : fm -> pindah ke
" huruf m selanjutnya
" % -> pindah ke matching tag selanjutnya, 
" g% ->pindah ke matching tag sebelumnya
" viw -> block satu kata
" :ls melihat buffer mana saja yang aktif
" :sbuffer 3 split dengan buffer aktif nomor 3 yang dilihat dengan :ls
" : Ctrl-o maju ke file selanjutnya yang dibuka
" : Ctrl-p mundur ke file selanjutnya yang dibuka
" m + huruf apa saja dalam kapital, menandai daerah yang akan kita kembali
" ^ + huruf kapital yang sudah di mark, kembali ke mark
" v'm : visual di dalam line sampai mark
" d'm : delete di dalam line sampai mark
" c'm : change di dalam line sampai mark
" '0 : kembali ke baris terakhir file yang diedit
" ,d : membuat dokumentasi di file php
" ======================== di dalam nerd tree
" % membuat file baru
" d membuat directory baru
" D menghapus file / directory
" R me rename file
" ^d menghapus semua karakter di belakang cursor (kebalikan dari C);
" * mencari kata selanjutnya yang sama dengan kata di bawah kursor
" # mencari kata sebelumnya yang sama dengan kata di bawah kursor
" '. kembali ke terakhir kali teks diedit
