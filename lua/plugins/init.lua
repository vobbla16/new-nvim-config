local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
		vim.cmd [[packadd packer.nvim]]
		return true
	end
	return false
end

local packer_bootstrap = ensure_packer()
return require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'

	--[[	use {
		'sainnhe/gruvbox-material',
		config = function ()
			vim.g.gruvbox_material_background = 'medium'
			vim.g.gruvbox_material_foreground = 'material'
			vim.cmd 'colorscheme gruvbox-material'
		end
	}
	--]]
	use {
		'rebelot/kanagawa.nvim',
		config = function()
			vim.cmd 'colorscheme kanagawa'
		end
	}

	use {
		'folke/noice.nvim',
		requires = {
			'MunifTanjim/nui.nvim',
			'rcarriga/nvim-notify'
		},
		config = function ()
			require("plugins/noice")
		end
	}

	use {
		'nvim-treesitter/nvim-treesitter',
		run = function()
			local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
			ts_update()
		end,
		config = function ()
			require("plugins/treesitter")
		end
	}

	use {
		'nvim-lualine/lualine.nvim',
		requires = { 'kyazdani42/nvim-web-devicons', opt = true },
		config = function ()
			require("plugins/lualine")
		end
	}

	use {
		'nvim-tree/nvim-tree.lua',
		requires = {
			'nvim-tree/nvim-web-devicons'
		},
		tag = 'nightly',
		config = function ()
			require('nvim-tree').setup()
		end
	}

	use {
		'voldikss/vim-floaterm',
		setup = function ()
			vim.g.floaterm_borderchars = '─│─│╭╮╯╰'
		end
	}

	use {
		'akinsho/bufferline.nvim',
		tag = "v3.*",
		requires = 'nvim-tree/nvim-web-devicons',
		config = function ()
			require("bufferline").setup()
		end
	}

	use {
		"folke/which-key.nvim",
		config = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 10
			require("which-key").setup()
		end
	}

	use 'neovim/nvim-lspconfig'

	use {
		"williamboman/mason.nvim",
		run = ":MasonUpdate",
		config = function ()
			require('mason').setup()
		end
	}

	use {
		'williamboman/mason-lspconfig.nvim',
		after = 'mason.nvim',
		config = function ()
			require("plugins/lsp")
		end
	}

	use 'hrsh7th/cmp-nvim-lsp'
	use 'hrsh7th/cmp-buffer'
	use 'hrsh7th/cmp-path'
	use 'hrsh7th/cmp-cmdline'
	use 'FelipeLema/cmp-async-path'
	use {
		'hrsh7th/nvim-cmp',
		config = function()
			require("plugins/cmp")
		end
	}

	use 'L3MON4D3/LuaSnip'
	use 'saadparwaiz1/cmp_luasnip'

	use {
		"windwp/nvim-autopairs",
		config = function()
			require("nvim-autopairs").setup {}
		end
	}

	use {
		'numToStr/Comment.nvim',
		config = function()
			require('Comment').setup()
		end
	}

	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.1',
		requires = {
			'nvim-lua/plenary.nvim'
		}
	}

	use {
		'norcalli/nvim-colorizer.lua',
		config = function ()
			require('colorizer').setup()
		end
	}

	use {
		"lukas-reineke/indent-blankline.nvim",
		config = function ()
			require("plugins/indentBlankline")
		end
	}

	use 'nvim-treesitter/nvim-treesitter-context'

	if packer_bootstrap then
		require('packer').sync()
	end
end)
