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
			require('noice').setup {
				lsp = {
					override = {
						["vim.lsp.util.convert_input_to_markdown_lines"] = true,
						["vim.lsp.util.stylize_markdown"] = true,
						["cmp.entry.get_documentation"] = true,
					},
				},
				presets = {
					bottom_search = true, -- use a classic bottom cmdline for search
					command_palette = true, -- position the cmdline and popupmenu together
					long_message_to_split = true, -- long messages will be sent to a split
					inc_rename = false, -- enables an input dialog for inc-rename.nvim
					lsp_doc_border = false, -- add a border to hover docs and signature help
				}
			}
		end
	}

	use {
		'nvim-treesitter/nvim-treesitter',
		run = function()
		local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
			ts_update()
		end,
		config = function ()
			require("nvim-treesitter.configs").setup {
				ensure_installed = "all",
				auto_install = true,
				highlight = {
					enable = true,
				},
				additional_vim_regex_highlighting = false,
			}

		end
	}

	use {
		'nvim-lualine/lualine.nvim',
		requires = { 'kyazdani42/nvim-web-devicons', opt = true },
		config = function ()
			require('lualine').setup {
				options = {
--					theme = 'gruvbox-material',
					theme = 'kanagawa',
					section_separators = '',
					component_separators = ''
				}
			}
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
			require("mason-lspconfig").setup {
				ensure_installed = { "lua_ls" }
			}
			require("mason-lspconfig").setup_handlers {
				function (server_name)
					require("lspconfig")[server_name].setup {}
				end
			}
		end
	}

	if packer_bootstrap then
		require('packer').sync()
	end
end)
