return {
    "VonHeikemen/lsp-zero.nvim", 
    branch = 'v3.x',
    -- lazy = true,
    config = function()
        local lsp_zero = require("lsp-zero")
        lsp_zero.extend_lspconfig()
        lsp_zero.on_attach(function(client, bufnr)
            lsp_zero.default_keymaps({buffer = bufnr})

            local wk = require("which-key")
            wk.register({
                K = { "<cmd>lua vim.lsp.buf.hover()<CR>", "Hover" },
                g = {
                    d = { "<cmd>lua vim.lsp.buf.definition()<CR>", "Go To Definition" },
                    D = { "<cmd>lua vim.lsp.buf.declaration()<CR>", "Go To Declaration" },
                    i = { "<cmd>lua vim.lsp.buf.implementation()<CR>", "Go To Implementation" },
                    o = { "<cmd>lua vim.lsp.buf.type_definition()<CR>", "Go To Type Definition" },
                    r = { "<cmd>lua vim.lsp.buf.references()<CR>", "Show All References" },
                    s = { "<cmd>lua vim.lsp.buf.signature_help()<CR>", "Signature Help" },
                },
            }, { mode = "n", prefix = "", buffer = bufnr })
            wk.register({
                f = { "<cmd>lua vim.lsp.buf.format()<CR>", "Format document", },
            }, { mode = "n", prefix = "<leader>f", buffer = bufnr })
            
            -- local bufopts = { noremap=true, silent=true, buffer=bufnr }
            -- vim.keymap.set('n', 'K',  vim.lsp.buf.hover, bufopts)
            -- vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
            -- vim.keymap.set('n', 'gD', vim.lsp.buf.definition, bufopts)
            -- vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
            -- vim.keymap.set('n', 'go', vim.lsp.buf.type_definition, bufopts)
            -- vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
            -- vim.keymap.set('n', 'gs', vim.lsp.buf.signature_help, bufopts)
        end)
        lsp_zero.setup_servers({
            "pylsp",
            "clangd",
            "marksman" -- markdown
        })
    end
}

