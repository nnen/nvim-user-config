return {
    "L3MON4D3/LuaSnip",
    
    config = function()
        -- require("luasnip.loaders.from_vscode").lazy_load()
        -- require("luasnip.loaders.from_vscode").load({ paths = { "./snippets" } })
        -- 
        -- vim.cmd("command! LuaSnipEdit :lua require(\"luasnip.loaders\").edit_snippet_files()")

        local ls = require("luasnip")
        local s = ls.snippet
        local sn = ls.snippet_node
        local t = ls.text_node
        local i = ls.insert_node
        local f = ls.function_node

        local copy = function (args)
            return args[1]
        end

        local get_file_name = function (args)
            return vim.fn.expand("%:t")
        end

        local get_header_file_name = function(args)
            return vim.fn.expand("%:t:r") .. ".h"
        end
        
        ls.add_snippets("cpp", {
            s({
                trig = "hf",
                name = "C++ Header File",
            }, {
                t("// "), f(get_file_name), t({"", ""}),
                t({"#pragma once", "", "", ""}),
                i(0),
            }),
            s({
                trig = "cppf",
                name = "C++ Implementation File",
            }, {
                t("// "), f(get_file_name), t({"", ""}),
                t("#include \""), f(get_header_file_name), t({"\"", ""}),
                t({"", ""}),
                t({"", ""}),
                i(0),
            }),
            s("////", {
                t("///////////////////////////////////////////////////////////////////////////////")
            }),
            s("ns", {
                t("namespace "), i(1, "name"), t({" {", "", "", ""}),
                i(0),
                t({"", "", "", "} // namespace "}), f(copy, 1),
            }),
            s("ns2", {
                t("namespace "), i(1, "name"), t(" { namespace "), i(2, "name"), t({" {", "", "", ""}),
                i(0),
                t({"", "", "", "}} // namespace "}), f(copy, 1), t("::"), f(copy, 2)
            }),
            s("#if", {
                t("#if "), i(1, "condition"), t({ "", "" }),
                i(0),
                t({ "", "#endif // " }), f(copy, 1),
            }),
        }, {
            key = "cpp",
        })

        vim.cmd([[imap <silent><expr> <Tab> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<Tab>' ]])
        vim.cmd([[inoremap <silent> <S-Tab> <cmd>lua require('luasnip').jump(-1)<CR>]])

        vim.cmd([[snoremap <silent> <Tab> <cmd>lua require('luasnip').jump(1)<CR>]])
        vim.cmd([[snoremap <silent> <S-Tab> <cmd>lua require('luasnip').jump(-1)<CR>]])
        
        -- vim.keymap.set({"i", "s"}, "<Tab>", function() 
        --     if ls.expand_or_jumpable() then
        --         ls.jump(1) 
        --     end
        -- end, {silent = true})
        -- vim.keymap.set({"i", "s"}, "<S-Tab>", function() ls.jump(-1) end, {silent = true})
    end,
}

