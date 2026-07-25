" Prevent Vim from emulating the old Vi (Best practice)
set nocompatible

" -- Global --
" Establishes the Spacebar as the primary prefix for custom mappings
let mapleader = "\<Space>"

" -- Appearance & UI --
set number             " Show line numbers
set relativenumber     " Show relative line numbers (useful for movements like 5j, 10k)
set cursorline         " Highlight current line
" set cursorcolumn     " Highlight current column
set termguicolors      " Enable 24-bit RGB colors
set signcolumn=yes     " Always show sign column (prevents text shifting)
set scrolloff=10       " Keep 10 lines visible above/below cursor

" -- Indentation & Formatting --
set shiftwidth=2       " Number of spaces for each indentation level
set tabstop=2          " Number of spaces a tab counts for
set autoindent         " Copy indent from current line when starting new line
set smartindent        " Smart autoindenting when starting new line
set wrap               " Wrap long lines
set linebreak          " Prevent words from being cut in half (word wrap)

" -- Search Behavior --
set incsearch          " Show search matches as you type
set hlsearch           " Highlight all search matches
set ignorecase         " Ignore case in search patterns
set smartcase          " Override ignorecase if search contains uppercase

" -- Syntax & Highlighting --
syntax on              " Enable syntax highlighting

" -- Editor Behavior --
set updatetime=250     " Faster completion and better plugin responsiveness
set clipboard=unnamedplus " Use system clipboard for copy/paste
set virtualedit=onemore   " Allows the cursor to move one column beyond the end of the line

" -- Encoding --
set encoding=utf-8     " Set file encoding to UTF-8

" -----------------------------------------------------------
" ------------------------ KEYMAPS --------------------------
" -----------------------------------------------------------

" -- Auto-Pairs (Insert Mode) --
" Automatically close parentheses, brackets, braces, and quotes.
" Mechanics: Types both characters (e.g., '()'), escapes to Normal mode ('<Esc>'),
" then re-enters Insert mode ('i') to place the cursor exactly in the middle.

" Left side (Standard opening)
inoremap ( ()<Esc>i
inoremap [ []<Esc>i
inoremap { {}<Esc>i
inoremap ' ''<Esc>i
inoremap " ""<Esc>i

" Right side (Fallback if the user types the closing character first)
inoremap ) ()<Esc>i
inoremap ] []<Esc>i
inoremap } {}<Esc>i

" -- Wrap Visual Selection (Visual Mode) --
" Wraps the currently selected text in parentheses, brackets, braces, or quotes.
" Mechanics: Cuts the selection ('c'), types the wrapper (e.g., '()'),
" escapes to Normal mode ('<Esc>'), and pastes the cut text inside ('P').

vnoremap ( c()<Esc>P
vnoremap ) c()<Esc>P
vnoremap [ c[]<Esc>P
vnoremap ] c[]<Esc>P
vnoremap { c{}<Esc>P
vnoremap } c{}<Esc>P
vnoremap ' c''<Esc>P
vnoremap " c""<Esc>P

" -- Move Lines (Normal Mode) --
" Moves the current line up or down while keeping the correct indentation.
" Mechanics: Uses the command-line command ':m' to move the current line ('.')
" down (+1) or up (-2). '<CR>' executes the command, and '==' re-indents the line.

nnoremap <C-j> :m .+1<CR>==
nnoremap <C-k> :m .-2<CR>==

" Allow a fast and ergonomic exit from insert mode by mapping the 'jk' 
" sequence to the Escape key, keeping hands positioned on the home row.
inoremap jk <Esc>
