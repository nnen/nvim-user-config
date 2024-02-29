-- nnen/init.lua
--
-- ThePrimeagen YT tutorial: https://youtu.be/w7i4amO_zaE?si=1fJ1L5E2QvJIh71s
--

vim.g.mapleader = " "

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.autoindent = true

vim.opt.number = true -- add line numbers
vim.opt.cc = "80"     -- set an 80 column border

vim.opt.scrolloff = 8 -- scroll offset (there will always be minimal number of lines before cursor when scrolling)

-- vim.opt.updatetime = 50

vim.cmd("filetype plugin indent on")
vim.cmd("syntax on")
-- vim.opt.termguicolors = true

vim.opt.cursorline = true

vim.cmd("command! OpenConfigDir edit ~/AppData/Local/nvim")
vim.cmd("command! EditConfig edit ~/AppData/Local/nvim/lua/nnen/init.lua")
vim.cmd("command! EditGConfig edit ~/AppData/Local/nvim/ginit.vim")
vim.cmd("command! QuickRef edit ~/AppData/Local/nvim/lua/nnen/QuickReference.md")

require("nnen.bootstrap_lazy")

require("lazy").setup({
    {
        "sainnhe/sonokai",
        lazy = false,
        priority = 1000,
        config = function()
            vim.cmd([[colorscheme sonokai]])
        end,
    },
    -- "sainnhe/edge",
    -- "RRethy/nvim-base16",
    -- "joshdick/onedark.vim",
    -- "folke/tokyonight.nvim",
    
    -- "vim-airline/vim-airline",
    -- "vim-airline/vim-airline-themes",
    
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        init = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
        end,
        opts = {}
    },

    {
        "nvim-telescope/telescope.nvim", tag = "0.1.5",
        dependencies = { "nvim-lua/plenary.nvim" }
    },

    "nvim-treesitter/nvim-treesitter",
    require("nnen.lsp_zero"),
    {
        "neovim/nvim-lspconfig",
        dependencies = { { "hrsh7th/cmp-nvim-lsp" } }
    },
    require("nnen.nvim_cmp"),
    { "saadparwaiz1/cmp_luasnip", },
    require("nnen.luasnip"),
    --{
    --    "hrsh7th/nvim-cmp",
    --    dependencies = { { "L3MON4D3/LuaSnip" } }
    --},
    
    "tpope/vim-fugitive",
    -- "Civitasv/cmake-tools.nvim",
    require("nnen.cmake_tools"),

    require("nnen.lualine"),
    require("nnen.neo_tree"),
    require("nnen.dashboard"),
})

-- vim.cmd.colorscheme("sonokai")

vim.g.airline_powerline_fonts = 1

local builtin = require("telescope.builtin")

local wk = require("which-key")
wk.register({
	p = {
		name = "file",
		v = { "<cmd>Ex<CR>", "View Files" },
		f = { "<cmd>Telescope find_files<CR>", "Find File" },
		g = { "<cmd>Telescope git_files<CR>", "Find Git File" },
		s = { function() builtin.grep_string({ search = vim.fn.input("Grep > ") }) end, "Grep Files" },
		p = { "<cmd>Telescope lsp_document_symbols<CR>", "Document Symbols" },
		w = { "<cmd>Telescope lsp_workspace_symbols<CR>", "Workspace Symbols" },
	},
    g = {
        s = { "<cmd>Git<CR>", "Git Status" },
        v = { "<cmd>vertical Git<CR>", "Git Status (vertical)" },
    },
}, { prefix = "<leader>" })

require("nvim-treesitter.install").compilers = { "clang" }

require("nvim-treesitter.configs").setup({
	ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "cpp", "python", "markdown" },
	sync_install = false,
	auto_install = true,
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},
})

require("cmake-tools").setup({
})


