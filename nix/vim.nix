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
        ];
        opt = [ ];
      };
      vimrcConfig.customRC = ''
        syntax on
        syntax sync minlines=256

        set autoread
        set encoding=utf-8
        set expandtab
        set hidden
        set hlsearch
        set ignorecase
        set incsearch
        set is hls
        set mouse=a
        set nocompatible
        set nocursorcolumn
        set nocursorline
        set noswapfile
        set scrolloff=16
        set shiftwidth=4
        set tabstop=4
        set ttimeout
        set ttimeoutlen=10

        set laststatus=2
        set statusline=%f\ %m\ %l/%L\ %c\ %=%y

        set wildmenu
        set wildmode=full
        set wildoptions=pum

        packadd cfilter

        au ColorScheme * hi Error NONE
        au ColorScheme * hi ErrorMsg NONE
        au GuiEnter * hi Error NONE
        au GuiEnter * hi ErrorMsg NONE

        let g:fzf_vim = {}
        let g:fzf_vim.buffers_options = '--no-header --info default'
        let g:fzf_history_dir = '~/.local/share/fzf-history'
        let g:fzf_layout = { 'window': { 'width': 1.00 , 'height': 1.00 , 'relative':v:false} }
        let g:fzf_preview_window = ['up:70%', 'ctrl-/']

        set rtp^="$HOME/.opam/default/share/ocp-indent/vim"

        let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
        let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
        let &t_EI .= "\e[2 q"  " Block cursor in normal mode
        let &t_SI .= "\e[6 q"  " Line cursor in insert mode
        let &t_SR .= "\e[4 q"  " replace mode

        let g:netrw_liststyle=3

        colo default
        set background=dark

        filetype plugin indent on

        vnoremap            J               :m '>+1<cr>gv=gv
        vnoremap            K               :m '<-2<cr>gv=gv
        nnoremap            <C-s><C-d>      :GrepperGrep <C-r><C-w>
        nnoremap            <C-s><C-a>      :%s/<C-r><C-w>//g<Left><Left>
        nnoremap            <C-s><C-s>      :%s/<C-r><C-w>//gc<Left><Left><Left>
        vnoremap            <C-s><C-s>      "ay:%s/<C-r>a//gc<Left><Left><Left>
        nnoremap            <UP>            <cmd>echo "xdd"<cr>
        nnoremap            <DOWN>          <cmd>echo "xdd"<cr>
        nnoremap            <RIGHT>         <cmd>echo "xdd"<cr>
        nnoremap            <LEFT>          <cmd>echo "xdd"<cr>
        nnoremap            <A-C-w>         <cmd>wa<cr>
        nnoremap            <A-C-q>         <cmd>qa!<cr>
        nnoremap            <C-r>           <cmd>source $HOME/.vimrc<cr>
        tnoremap            <Esc>           <C-\><C-n>
        nnoremap            <A-n>           :bn<cr>
        nnoremap            <ESC>n          :bn<cr>
        nnoremap            <A-d>           :Bclose<CR>
        " it is set for the sake of st
        nnoremap            <Esc>d          :Bclose<CR>
        noremap             <A-p>           :bp<cr>
        noremap             <A-w>           :bw<cr>
        noremap             <ESC>p          :bp<cr>
        noremap             <ESC>w          :bw<cr>
        noremap             <Esc><Esc>      :nohlsearch<CR>
        noremap             <A><A>          :nohlsearch<CR>
        noremap             <F8>            <esc>:w<cr> :Dispatch comp.sh $(echo %)<cr>
        noremap             <F9>            <esc>:w<cr> :!python3<cr>
        noremap             <F10>           <esc>:w<cr> :Dispatch! comp.sh $(echo %)<cr>
        noremap             <space>sf      :FZF<cr>
        noremap             <space>sa      :RG<cr>
        noremap             <space><space> :Buffers<cr>
        noremap             <space>/       :BLines<cr>
        noremap             <space>ss      :Lines<cr>
        noremap             <space>mn      :Marks<cr>
        noremap             <space>al      :FZF $HOME/zadania/Algos<cr>
        noremap             <C-j>          <C-W>j
        noremap             <C-k>          <C-W>k
        noremap             <C-h>          <C-W>h
        noremap             <C-l>          <C-W>l
      '';
    })
  ];
}
