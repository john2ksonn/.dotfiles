return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    use {
        'neoclide/coc.nvim', branch = 'release'
    }
    -- use 'scrooloose/nerdtree'
    -- use 'Xuyuanp/nerdtree-git-plugin'
    -- use 'ryanoasis/vim-devicons'
    use {
        'nvim-tree/nvim-tree.lua',
        requires = {
            'nvim-tree/nvim-web-devicons',
        },
    }
    use 'morhetz/gruvbox'
    use 'tpope/vim-fugitive'
    use 'junegunn/fzf.vim'
    use {
        'vim-pandoc/vim-pandoc',
        ft = {'markdown'}
    }
    use {
        'vim-pandoc/vim-pandoc-syntax',
        ft = {'markdown'}
    }
    use 'lervag/vimtex'
    use 'vimwiki/vimwiki'
end)
