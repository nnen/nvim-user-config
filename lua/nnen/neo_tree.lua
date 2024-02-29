return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "MunifTanjim/nui.nvim",
    },
    config = function()
        function NeotreeWithSymbols()
            local cmd = require("neo-tree.command")
            cmd.execute({
                action = "focus",
                source = "filesystem",
                position = "left",
                toggle = false,
            })
            -- vim.cmd [[Neotree action=focus source=filesystem position=left toggle=false]]
            vim.cmd [[split]]
            vim.cmd [[exe "normal! \<C-W>j"]]
            cmd.execute({
                action = "show",
                source = "document_symbols",
                position = "current",
                toggle = false,
            })
            -- vim.cmd [[Neotree action=show source=git_status position=right toggle=false]]
        end
        
        require("neo-tree").setup({
            sources = {
                "filesystem",
                "buffers",
                "git_status",
                "document_symbols",
            },
            filesystem = {
                hijack_netrw_behavior = "disabled",
            },
        })

        require("which-key").register({
            p = {
                t = { "<cmd>Neotree action=show source=filesystem position=left toggle=true<CR>", "Open tree view" },
                T = { NeotreeWithSymbols, "Open tree view" },
            }
        }, { prefix = "<leader>" })
    end,
}

