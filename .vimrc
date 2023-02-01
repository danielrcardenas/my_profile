" ----------------------------------------------
" https://missing.csail.mit.edu/2020/files/vimrc
" ----------------------------------------------

" Comments in Vimscript start with a `"`.

" If you open this file in Vim, it'll be syntax highlighted for you.

" Vim is based on Vi. Setting `nocompatible` switches from the default
" Vi-compatibility mode and enables useful Vim functionality. This
" configuration option turns out not to be necessary for the file named
" '~/.vimrc', because Vim automatically enters nocompatible mode if that file
" is present. But we're including it here just in case this config file is
" loaded some other way (e.g. saved as `foo`, and then Vim started with
" `vim -u foo`).
set nocompatible " <mgw>Default setting in Vim 8</>

" Turn on syntax highlighting.
syntax on

" Disable the default Vim startup message.
set shortmess+=I

" Show line numbers.
set number

" This enables relative line numbering mode. With both number and
" relativenumber enabled, the current line shows the true line number, while
" all other lines (above and below) are numbered relative to the current line.
" This is useful because you can tell, at a glance, what count is needed to
" jump up or down to a particular line, by {count}k to go up or {count}j to go
" down.
" set relativenumber

" Always show the status line at the bottom, even if you only have one window open.
set laststatus=2

" The backspace key has slightly unintuitive behavior by default. For example,
" by default, you can't backspace before the insertion point set with 'i'.
" This configuration makes backspace behave more reasonably, in that you can
" backspace over anything.
set backspace=indent,eol,start

" By default, Vim doesn't let you hide a buffer (i.e. have a buffer that isn't
" shown in any window) that has unsaved changes. This is to prevent you from "
" forgetting about unsaved changes and then quitting e.g. via `:qa!`. We find
" hidden buffers helpful enough to disable this protection. See `:help hidden`
" for more information on this.
set hidden

" This setting makes search case-insensitive when all characters in the string
" being searched are lowercase. However, the search becomes case-sensitive if
" it contains any capital letters. This makes searching more convenient.
set ignorecase
set smartcase

" Enable searching as you type, rather than waiting till you press enter.
set incsearch

" Unbind some useless/annoying default key bindings.
nmap Q <Nop> " 'Q' in normal mode enters Ex mode. You almost never want this.

" Disable audible bell because it's annoying.
set noerrorbells visualbell t_vb=

" Enable mouse support. You should avoid relying on this too much, but it can
" sometimes be convenient.
set mouse+=a

" Try to prevent bad habits like using the arrow keys for movement. This is
" not the only possible bad habit. For example, holding down the h/j/k/l keys
" for movement, rather than using more efficient movement commands, is also a
" bad habit. The former is enforceable through a .vimrc, while we don't know
" how to prevent the latter.
" Do this in normal mode...
nnoremap <Left>  :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up>    :echoe "Use k"<CR>
nnoremap <Down>  :echoe "Use j"<CR>
" ...and in insert mode
inoremap <Left>  <ESC>:echoe "Use h"<CR>
inoremap <Right> <ESC>:echoe "Use l"<CR>
inoremap <Up>    <ESC>:echoe "Use k"<CR>
inoremap <Down>  <ESC>:echoe "Use j"<CR>

" -------------
" Practical Vim
" -------------

" Tip 22 - Repeat Line-Wise Visual Commands
set shiftwidth=4 softtabstop=4 expandtab
set tabstop=4 " <mgw>+</>

" Tip 32 - Tab-Complete Your Ex Commands
" If you're used to working with the bash shell
set wildmode=longest,list
" If you're used to the autocomplete menu provided by zsh
"set wildmenu
"set wildmode=full

" Tip 34 - Recall Commands from History
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>

" Tip 41 - Open a File by Its Filepath Using 'edit'
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'

" Tip 43 - Explore the File System with netrw
filetype plugin on

" Tip 54 - Jump Between Matching Parentheses
runtime macros/matchit.vim

" Tip 92 - Repeat the Previous Substitute Command
nnoremap & :&&<CR>
xnoremap & :&&<CR>

" Tip 102 - Configure Vim to Work with ctags
"autocmd BufWritePost * call system("ctags -R --exclude=.git")

" Tip 111 - Meet Vim's Keyword Autocompletion
set infercase

" Tip 113 - Understand the Source of Keywords
set complete+=k

" ------------
" vimcasts.org
" ------------

" http://vimcasts.org/episodes/whitespace-preferences-and-filetypes/
" Only do this part when compiled with support for autocommands
if has("autocmd")
  " Enable file type detection
  filetype on " <mgw>Default setting in Vim 8</>

  " Syntax of these languages is fussy over tabs Vs spaces
  autocmd FileType make setlocal ts=8 sts=8 sw=8 noexpandtab
  autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

  " Customisations based on house-style (arbitrary)
  autocmd FileType html setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType css setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType javascript setlocal ts=4 sts=4 sw=4 noexpandtab
  autocmd FileType c setlocal ts=4 sts=4 sw=4 noexpandtab " <mgw>+</>
  autocmd FileType java setlocal ts=2 sts=2 sw=2 noexpandtab " <mgw>+</>
  autocmd FileType python setlocal ts=4 sts=4 sw=4 noexpandtab " <mgw>+</>

  " Treat .rss files as XML
  autocmd BufNewFile,BufRead *.rss setfiletype xml
endif

" http://vimcasts.org/episodes/working-with-windows/
" Changing focus between windows
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
" Switching tabs
" For mac users (using the 'apple' key)
map <D-S-]> gt
map <D-S-[> gT
map <D-1> 1gt
map <D-2> 2gt
map <D-3> 3gt
map <D-4> 4gt
map <D-5> 5gt
map <D-6> 6gt
map <D-7> 7gt
map <D-8> 8gt
map <D-9> 9gt
map <D-0> :tablast<CR>
" for linux and windows users (using the control key)
map <C-S-]> gt
map <C-S-[> gT
map <C-1> 1gt
map <C-2> 2gt
map <C-3> 3gt
map <C-4> 4gt
map <C-5> 5gt
map <C-6> 6gt
map <C-7> 7gt
map <C-8> 8gt
map <C-9> 9gt
map <C-0> :tablast<CR>
" highlight current line, but only in active window
augroup CursorLineOnlyInActiveWindow
    autocmd!
    autocmd VimEnter,WinEnter,BufWinEnter * setlocal cursorline
    autocmd WinLeave * setlocal nocursorline
augroup END
" nerdtree
nnoremap <Leader>n :NERDTreeToggle<CR>
nnoremap <Leader>f :NERDTreeFind<CR>

" http://vimcasts.org/episodes/the-edit-command/
cnoremap %% <C-R>=fnameescape(expand('%:h')).'/'<cr>
map <leader>ew :e %%
map <leader>es :sp %%
map <leader>ev :vsp %%
map <leader>et :tabe %%

" http://vimcasts.org/episodes/soft-wrapping-text/
" Moving around through wrapped lines
vmap <D-j> gj
vmap <D-k> gk
vmap <D-4> g$
vmap <D-6> g^
vmap <D-0> g^
nmap <D-j> gj
nmap <D-k> gk
nmap <D-4> g$
nmap <D-6> g^
nmap <D-0> g^

" http://vimcasts.org/episodes/spell-checking/
" Toggle spell checking on and off with `,s`
let mapleader = ","
nmap <silent> <leader>s :set spell!<CR>

" http://vimcasts.org/episodes/updating-your-vimrc-file-on-the-fly/
" Updating your vimrc file on the fly
" Source the vimrc file after saving it
if has("autocmd")
  autocmd bufwritepost .vimrc source $MYVIMRC
endif
" Editing the vimrc file
let mapleader = ","
nmap <leader>v :tabedit $MYVIMRC<CR>

" http://vimcasts.org/episodes/project-wide-find-and-replace/
" Project-wide find and replace
" The :Qargs helper command
command! -nargs=0 -bar Qargs execute 'args' QuickfixFilenames()
function! QuickfixFilenames()
  " Building a hash ensures we get each buffer only once
  let buffer_numbers = {}
  for quickfix_item in getqflist()
    let buffer_numbers[quickfix_item['bufnr']] = bufname(quickfix_item['bufnr'])
  endfor
  return join(map(values(buffer_numbers), 'fnameescape(v:val)'))
endfunction

" https://github.com/nelstrom/dotfiles/blob/master/vimrc#L55
"set termguicolors
"set background=dark
"silent! colorscheme solarized8_light
"autocmd vimenter * ++nested colorscheme solarized8
