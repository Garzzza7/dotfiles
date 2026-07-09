{ pkgs, ... }:
{
  environment.variables = {
    EDITOR = "vim";
  };

  environment.systemPackages = with pkgs; [
    ((vim_configurable.override { }).customize {
      name = "vim";
      vimrcConfig.packages.myVimPackage = with pkgs.vimPlugins; {
        start = [
          bclose-vim
          fzf-vim
          fzfWrapper
          undotree
          vim-commentary
          vim-dispatch
          vim-eunuch
          vim-fugitive
          vim-grepper
          vim-gutentags
          vim-polyglot
          vim-solarized8
          vim-surround
          vim-vinegar
          zig
        ];
        opt = [ ];
      };
      vimrcConfig.customRC = ''
        function! RunCtags()
            ! ctags --recurse .
        endfunction

        syntax on
        set nocompatible

        let g:fzf_vim = {}
        let g:fzf_vim.buffers_options = '--no-header --info default'

        set laststatus=2
        set statusline=
        set statusline +=%f
        set statusline +=%1*%=%5l%*
        set statusline +=%2*/%L%*

        set ttimeout
        set ttimeoutlen=10
        set scrolloff=8
        set mouse=a
        set autoread

        set noswapfile

        set wildmenu
        set wildmode=full
        set wildoptions=pum

        set ignorecase

        let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
        let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

        set nocursorcolumn
        set nocursorline
        syntax sync minlines=256
        let g:netrw_liststyle=3
        colo default
        set background=dark
        set hlsearch
        set is hls
        set incsearch

        filetype plugin indent on

        vnoremap J :m '>+1<cr>gv=gv
        vnoremap K :m '<-2<cr>gv=gv

        nnoremap <C-s><C-d> :GrepperGrep <C-r><C-w>
        nnoremap <C-s><C-a> :%s/<C-r><C-w>//g<Left><Left>
        nnoremap <C-s><C-s> :%s/<C-r><C-w>//gc<Left><Left><Left>
        vnoremap <C-s><C-s> "ay:%s/<C-r>a//gc<Left><Left><Left>

        nnoremap <silent> <UP> <cmd>echo "xdd"<cr>
        nnoremap <silent> <DOWN> <cmd>echo "xdd"<cr>
        nnoremap <silent> <RIGHT> <cmd>echo "xdd"<cr>
        nnoremap <silent> <LEFT> <cmd>echo "xdd"<cr>
        nnoremap <silent> <A-C-w> <cmd>wa<cr>
        nnoremap <silent> <A-C-q> <cmd>qa!<cr>
        nnoremap <silent> <C-r> <cmd>source $HOME/.vimrc<cr>
        tnoremap <Esc> <C-\><C-n>
        nnoremap <A-n> :bn<cr>
        nnoremap <ESC>n :bn<cr>
        nnoremap <silent> <A-d> :Bclose<CR>
        " it is set for the sake of st
        nnoremap <silent> <Esc>d :Bclose<CR>
        noremap <A-p> :bp<cr>
        noremap <A-w> :bw<cr>
        noremap <ESC>p :bp<cr>
        noremap <ESC>w :bw<cr>
        noremap <Esc><Esc> :nohlsearch<CR>
        noremap <A><A> :nohlsearch<CR>
        noremap <F8> <esc> :w <cr> :!comp.sh $(echo %)<cr>
        noremap <F9> <esc> :w <cr> :!python3<cr>
        noremap <silent> <space>sf :FZF<cr>
        noremap <silent> <space>sa  :RG<cr>
        noremap <silent> <space><space> :Buffers<cr>
        noremap <silent> <space>/ :BLines<cr>
        noremap <silent> <space>ss :Lines<cr>
        noremap <silent> <space>mn :Marks<cr>
        noremap <silent> <space>al :FZF! $HOME/zadania/Algos<cr>
        noremap <C-j> <C-W>j
        noremap <C-k> <C-W>k
        noremap <C-h> <C-W>h
        noremap <C-l> <C-W>l
        let &t_SI .= "\e[6 q"  " Line cursor in insert mode
        let &t_EI .= "\e[2 q"  " Block cursor in normal mode
        let &t_SR .= "\e[4 q"  " replace mode
        let g:fzf_history_dir = '~/.local/share/fzf-history'

        set encoding=utf-8

        set shiftwidth=4
        set tabstop=4
        set expandtab
        let g:fzf_layout = { 'window': { 'width': 0.95 , 'height': 0.95 , 'relative':v:false} }
        let g:fzf_preview_window = ['up:70%', 'ctrl-/']
      '';
    })
  ];
}
