" vim: fileencoding=utf8 foldmethod=marker
"{{{ License header: MIT
" Copyright (c) 2014 Till Maas <opensource@till.name>
"
" Permission is hereby granted, free of charge, to any person obtaining a copy
" of this software and associated documentation files (the "Software"), to deal
" in the Software without restriction, including without limitation the rights
" to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
" copies of the Software, and to permit persons to whom the Software is
" furnished to do so, subject to the following conditions:
"
" The above copyright notice and this permission notice shall be included in
" all copies or substantial portions of the Software.
"
" THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
" IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
" FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
" AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
" LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
" OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
" THE SOFTWARE.
"}}}
" enable neobundle {{{1
if has('vim_starting')
   set nocompatible

   set runtimepath+=~/.vim/bundle/neobundle/
endif
call neobundle#begin(expand('~/.vim/bundle/'))

" Bundles {{{1
" Nobundle itself
NeoBundleFetch 'Shougo/neobundle.vim', {'name': 'neobundle'}

" For ansible
NeoBundle 'stephpy/vim-yaml'
NeoBundle 'chase/vim-ansible-yaml'


NeoBundle 'junegunn/vim-easy-align'

let g:easy_align_delimiters = {
\ '&': { 'pattern': '&',
\        'left_margin': 1,
\        'right_margin': 1,
\      }
\}

NeoBundle 'tpope/vim-fugitive'
NeoBundle 'airblade/vim-gitgutter'
" Bundle 'scrooloose/syntastic'
NeoBundle 'vimwiki/vimwiki'
NeoBundle 'scrooloose/nerdtree'
" configure NERDtree
" ignore files
let NERDTreeIgnore=['\.sw[po]$', '\.o$', '\.lst$', '\.elf$', '\.hex$', '\.py[co]$']

NeoBundle 'vim-scripts/VOoM'
NeoBundle 'vim-scripts/taglist.vim'
NeoBundle 'vim-latex/vim-latex'

NeoBundle 'fatih/vim-go'
let g:go_fmt_command = "goimports"
let g:go_fmt_autosave = 1

" Colorscheme
" NeoBundle 'tomasr/molokai'

" Python IDE {{{2
" http://unlogic.co.uk/posts/vim-python-ide.html
" Font Problems:
" https://powerline.readthedocs.org/en/latest/installation/linux.html#font-installation
" NeoBundle 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}

NeoBundle 'klen/python-mode'
" Python-mode
" Activate rope
" Keys:
" K             Show python docs
" <Ctrl-Space>  Rope autocomplete
" <Ctrl-c>g     Rope goto definition
" <Ctrl-c>d     Rope show documentation
" <Ctrl-c>f     Rope find occurrences
" <Leader>b     Set, unset breakpoint (g:pymode_breakpoint enabled)
" [[            Jump on previous class or function (normal, visual, operator modes)
" ]]            Jump on next class or function (normal, visual, operator modes)
" [M            Jump on previous class or method (normal, visual, operator modes)
" ]M            Jump on next class or method (normal, visual, operator modes)
let g:pymode_rope = 0

" Documentation
let g:pymode_doc = 1
let g:pymode_doc_key = 'K'

"Linting
let g:pymode_lint = 1
" let g:pymode_lint_checker = "pyflakes,pep8"
let g:pymode_lint_checker = "pyflakes,pep8"
" let g:pymode_lint_checker = "pyflakes,pep8,pylint"
" let g:pymode_lint_checker = "pyflakes,pep8,mccabe,pylint,pep257"
" Auto check on save
let g:pymode_lint_write = 1
" Run linter on the fly
let g:pymode_lint_onfly = 1
" Do not fix whitespace automatically
let g:pymode_utils_whitespaces = 0

" Support virtualenv
let g:pymode_virtualenv = 1

" Enable breakpoints plugin
let g:pymode_breakpoint = 1
let g:pymode_breakpoint_key = '<leader>b'

" syntax highlighting
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all

" Do not set sys.path
" let g:pymode_path = 0

" Don't autofold code
" let g:pymode_folding = 0

" Bundle 'davidhalter/jedi-vim'
let g:pymode_rope = 0

if filereadable(expand('~/.vimrc-neobundle-local'))
    source ~/.vimrc-neobundle-local
endif

call neobundle#end()
filetype plugin indent on
NeoBundleCheck

" settings {{{1
" automatically change window's cwd to file's dir
" set autochdir
" set fileencodings=utf-16,utf-8,latin1

set termencoding=utf8
set viewoptions=cursor,folds,slash,unix,options

"" Movement
" Allow backspacing over autoindent, line breaks, start of insert
set backspace=indent,eol,start
" move to next/previous line with curors and h/l
set whichwrap+=<,>,h,l
" keep a few lines above and below the cursor
set scrolloff=3
" keep a few chars left and right of the cursor (when nowrap is set)
set sidescrolloff=5

"" Searching
" case insensitve search except when searchterm contains upper-case characters
set ignorecase smartcase
" Highlight search
set hlsearch


" show matching brackets
set showmatch
" show INSERT/REPLACE/...
set showmode
" show line numbers
set number
" helpful statusline for split windows
set statusline=%(%f%1*%m%*%r%h%w\%)%=%(%q[%Y]\ [%04l/%04L:%04v\ %obytes\ (%p%%)]\ %)
syntax on
set background=light

"" indentation
set autoindent
set shiftwidth=4
set softtabstop=4
set tabstop=4
set expandtab

" Do not use two spaces when joining lines ending with .?!
set nojoinspaces

" line length
"set textwidth=80

" begin vim-latex:
" Make :grep work with a single file
set grepprg=grep\ -nH\ $*
" Already set for neobundle
"filetype plugin on
"filetype indent on
" end vim-latex

" whitespace highlights
set list
" listchars: .\u00b7 (·, centered dot)
" trail: \u2591 (░)
" Other potential values:
" \u21e5 (⇥, tabulator sign)
" \u21c7 (⇇, double arrow left)
" \u21c9 (⇉, double arrow right)
" set listchars=tab:.·,trail:░
let &listchars = "tab:.\u00b7,trail:\u2591"
" show unprintable characters as hex codes
set display+=uhex

" mouse support
set mouse=a

" use the unnamed buffer for mouse paste buffer
" instead of \"* fixes  \"* corruption when opening
" tex files
set clipboard=unnamed

"" spellchecking
" zg to add word to word list
" zw to reverse
" zug to remove word from word list
" z= to get list of possibilities
" set spell
set spelllang=en,de_20
" set spelllang=de_20
set spellfile=~/.vim/spellfile.add
highlight clear SpellBad
highlight SpellBad term=standout ctermfg=1 term=underline cterm=underline
highlight clear SpellCap
highlight SpellCap term=underline cterm=underline ctermbg=7
highlight clear SpellRare
highlight SpellRare term=italic cterm=italic
highlight clear SpellLocal
highlight SpellLocal term=underline cterm=underline ctermfg=4

" Spellchecking for mutt
autocmd FileType mail set spell

" Spellchecking in git commits
autocmd FileType gitcommit set spell

" automatically store and update the file
set autoread
set autowrite
" Do not store undo history accross reloads
set undoreload=0
" disable undofile storage
if exists('+undofile')
  set noundofile
endif
" viminfo
set viminfo=!,%,'100,<50,s10,h

" Define <Leader> as , instead of backslash
let mapleader = ","

" For vim-latex
let g:tex_flavor='latex'
" disable spellcheck in latex comments
let g:tex_comment_nospell= 1
if exists("Tlist_Ctags_Cmd")
    let s:tex_ctags = Tlist_Ctags_Cmd
else
    let s:tex_ctags = 'ctags' " Configurable in texrc?
endif
let g:Tex_InternalTagsDefinitions = 0
let Tlist_Ctags_Cmd = s:tex_ctags .""
\.' --regex-tex="/\\\\FIXME\{[a-zA-Z]*}\{([^}]*)\}/\1/s,FIXME/"'

" Specfile editing, used with <leader>c in command modus
let spec_chglog_format = "%a %b %d %Y Till Maas <opensource@till.name> -"
" macros {{{1
" Fix HTML umlauts
vnoremap <Leader>html-umlauts :%s/ü/\&uuml;/g<CR>:%s/ö/\&ouml;/g<CR>:%s/ä/\&auml;/g<CR>:%s/ß/\&szlig;/g<CR>:%s/Ü/\&Uuml;/g<CR>:%s/Ö/\&Ouml;/g<CR>:%s/Ä/\&auml;/g<CR>

" visual blame
" vnoremap <Leader>gl :<C-U>!svn blame <C-R>=expand("%:p") <CR> \| sed -n <C-R>=line("'<") <CR>,<C-R>=line("'>") <CR>p <CR>
vnoremap <Leader>gl :<C-U>!git blame <C-R>=expand("%:p") <CR> \| sed -n <C-R>=line("'<") <CR>,<C-R>=line("'>") <CR>p <CR>

" insert [...]
vnoremap ... c[.<C-v>.<C-v>.]<ESC>
" Change texttt to verbatim
vnoremap <Leader>tvb :s,\\texttt{\([^}]*\)},\\verb^\1^,<CR>
" Include selection into verbatim
vnoremap <Leader>vb c\verb^<ESC>pa^<ESC>
" alternative making selection to verbatim
" vnoremap <Leader>vb <Esc>`>a^<Esc>`<i\verb^<Esc>
vnoremap <Leader>hyp :s,-,\\hyp{},cg<CR>

" toggle spellchecking
" map <C-i> :setlocal invspell<CR>

" toggle NERDtree and Tagbar
nnoremap <silent> ,nt :NERDTreeToggle<CR>
nnoremap <silent> ,tb :TagbarToggle<CR>

" whitespace modes
nnoremap <Leader>t2 :set expandtab tabstop=2 shiftwidth=2 softtabstop=2<CR>
nnoremap <Leader>t4 :set expandtab tabstop=4 shiftwidth=4 softtabstop=4<CR>
nnoremap <Leader>t8 :set expandtab tabstop=8 shiftwidth=8 softtabstop=4<CR>
nnoremap <Leader>tt :set noexpandtab tabstop=8 softtabstop=4 shiftwidth=4<CR>

" Split commandline
vnoremap <Leader>sc :s, -,\\\r -,g<CR>

command -nargs=1 G silent lvimgrep "<args>" % | lopen
command -nargs=0 LFX silent lvimgrep "FIXME" % | lopen
" Copy and Paste with CTRL-C/CTRL-V
"noremap <C-V> "+gP
"cnoremap <C-V> <C-R>+
"vnoremap <C-C> "+y
" autocommand {{{1
" Default content for .py-files
" http://article.gmane.org/gmane.editors.vim/68159
au BufNewFile *.py,*.PY sil! 0put='#!/usr/bin/python3 -tt'
au BufNewFile *.py,*.PY sil! 1put='# vim: fileencoding=utf8'
au BufNewFile *.py,*.PY sil! 3
" Default content when writing .py files:
" au BufWrite *.py,*.PY if getline('1')!~'bin/python'|sil! 0put='#!/usr/bin/python -tt'|endif
" au BufWrite *.py,*.PY if getline('2')!~'vim:'|sil! 1put='# vim: fileencoding=utf8'|endif

" automagically load custom latex configuration
" - set filetype to tex
" - enable autocompletion for fig:foo references
" - enable spellcheck
augroup filetypedetect
    au! BufRead,BufNewFile *.tex        setlocal filetype=tex spell iskeyword+=_ iskeyword+=- spell formatexpr=No_verbatim_format()

augroup END

"set verbose=9
au BufRead * call Magic_expandtab()

" keep noexpandtab only if there is no line within the first 100 that starts
" with a tab.
" in the buffer within the first 100 lines
function Magic_expandtab()
    let &expandtab = match(getline(0, 100), "^\t") == -1 ? &expandtab * 1 : 0
endfunction

" Set .as to be syntax highlighted as actionscript instead of atlas
autocmd BufRead *.as set filetype=actionscript

" For TList
" actionscript language
let tlist_actionscript_settings = 'actionscript;c:class;f:method;p:property;v:variable'

" vim script examples {{{1
inoremap <F6> <C-R>=ListMonths()<CR>

func! ListMonths()
  call complete(col('.'), ['January', 'February', 'March',
  \ 'April', 'May', 'June', 'July', 'August', 'September',
  \ 'October', 'November', 'December'])
return ''
endfunc

function No_verbatim_format()
    " v:lnum -> line number of first line to be formatted
    " v:count -> number of lines to be formatted
    " v:char -> character to be inserted with automatic formating
    "
    " Check whether the previous check_previous lines begin or end a
    " verbatim-like environment. If one begins, do not wrap the current lines.
    " Short-circuit: If one ends, then the current lines are probably not in
    " such an environment.

    let check_previous = 100
    " return 1 to use internal formatting/wrapping
    let wrap = 1
    " return 0 to disable internal formatting/wrapping
    let no_wrap = 0

    let no_wrap_envs = 'lstlisting\|verbatim\|tabular\|tabularx\|comment'

    let lnum = prevnonblank(v:lnum - 1)
    let regex =  '^\\\(begin\|end\){\('.no_wrap_envs.'\)}'

    while (lnum > v:lnum - check_previous && lnum > 1)
        let line  = getline(lnum)
        let lnum = lnum - 1
        let match_list = matchlist(line, regex)
        if (empty(match_list))
            "echom "Empty match"
            continue
        endif

        let cmd_type = get(match_list, 1)
        " env_type is ignored
        let env_type = get(match_list, 2)
        if cmd_type == "end"
            "echo "end found"
            return wrap
        elseif cmd_type == "begin"
            "echo "begin found"
            return no_wrap
        endif
    endwhile
    return wrap
endfunction

"function! Filter_visual(type, ...)
"    let sel_save = &selection
"    let &selection = "inclusive"
"    let reg_save = @@
"
"    if a:0  " Invoked from Visual mode, use '< and '> marks.
"        d
"        "silent! 1,+1?\\item
"        "norm v | " use V for linewise visual mode
"        "" use V for linewise visual mode:
"        "norm V
"        "silent! /\\item\|\\end{itemize}
"    "elseif a:type == 'line'
"    "elseif a:type == 'block'
"    else
""        silent! 1,+1?\\item
""        norm v
""        silent! /\\item
"    endif
"
""    norm b$
"
"    let &selection = sel_save
"    let @@ = reg_save
"endfunction
"xnoremap <silent> ,filt :<C-U>call Filter_visual(visualmode(), 1)<CR>

" read local configuration{{{1
if filereadable(expand('~/.vimrc-local'))
    source ~/.vimrc-local
endif
