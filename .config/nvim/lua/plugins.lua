local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data') ..
                             '/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({
            'git', 'clone', '--depth', '1',
            'https://github.com/wbthomason/packer.nvim', install_path
        })
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'
    use 'lukas-reineke/lsp-format.nvim'

    use 'nvim-lua/plenary.nvim'
    use 'nvim-telescope/telescope.nvim'

    use 'williamboman/mason.nvim'
    use 'williamboman/mason-lspconfig.nvim'
    use 'neovim/nvim-lspconfig'
    use 'ms-jpq/coq_nvim'

    use {'akinsho/bufferline.nvim', tag = "*", requires = 'nvim-tree/nvim-web-devicons'}
    use 'kyazdani42/nvim-tree.lua'

    use 'nvim-lualine/lualine.nvim'
    use 'sheerun/vim-polyglot'

    use 'folke/trouble.nvim'

    use 'folke/tokyonight.nvim'
    use 'kyazdani42/nvim-web-devicons'

    use 'kdheepak/lazygit.nvim'
    use 'tpope/vim-surround'
    use 'tpope/vim-endwise'
    use 'Raimondi/delimitMate'

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if packer_bootstrap then require('packer').sync() end
end)
