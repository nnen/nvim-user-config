return {
    "nvim-lualine/lualine.nvim",
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    event = "VeryLazy",
    init = function()
        vim.g.lualine_laststatus = vim.o.laststatus
        if vim.fn.argc(-1) > 0 then
            vim.o.statusline = " "
        else
            vim.o.laststatus = 0
        end
    end,
    opts = function()
        local lualine_require = require("lualine_require")
        lualine_require.require = require

        -- local icons = require("lazyvim.config").icons
        --
        vim.o.laststatus = vim.g.lualine_laststatus

        return {
            options = {
                theme = "auto",
                globalstatus = false, -- if tree, there's only one status line for all windows, if false, each window has it's own
                disabled_filetypes = { statusline = { "dashboard", "alpha", "starter" } }
            },
            -- sections = {
            --     lualine_a = { "mode" },
            --     lualine_b = { "branch" },

            --     lualine_c = {
            --         Util.lualine.root_dir(),
            --         {
            --             "diagnostics",
            --             symbols = {
            --                 error = i
            --             }
            --         }
            --     }
            -- }
        }
    end,
}
