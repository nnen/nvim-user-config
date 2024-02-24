return {
    "nvimdev/dashboard-nvim",
    event = "VimEnter",
    opts = function()
        local width = 41

        local logo = [[
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⢀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢁⣴⣦⢠⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⡀⠀⡀⠀⠀⠀⠀⠀⠀⢠⠘⣿⣿⡇⠠⠀⠀⠀⠀⠀⠀⠀⢀⡀⠀⠀⠀⠀⠀
⣼⣱⣿⣿⡇⢰⠆⠀⠀⠀⠀⠀⣿⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀⣎⢸⣿⡄⢠⡀⠀
⠙⠦⣍⠩⠰⠁⠀⠀⠀⠀⠀⠀⣿⣿⣿⡁⠀⠀⠀⠀⠀⠀⠀⠈⠳⠬⠑⠸⠃⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣀⣠⣀⣉⣏⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⠀⡀⠀⠀⠀
⠀⠀⠀⠀⣀⣀⣀⣷⡆⠛⠛⠛⢛⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡷⠀⡇
⠀⠀⠀⠀⠹⣮⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠅⠀⠠⠬⢍⡹⣿⣿⠿⠁⠘⠀
⠀⠀⠀⠀⠀⠀⠑⠓⠛⠛⠺⠟⠉⠁⢹⣿⣿⡟⠀⣤⢀⡀⢀⠳⠍⠀⠐⠁⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⣿⠀⢻⡸⣿⡆⣇⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⡟⠀⠀⣧⢹⣿⣸⡄⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⢠⢇⣾⣷⡼⡄⠀⠀⠀⢸⣿⣿⠀⠀⠀⡝⢀⣿⣇⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠸⡼⣿⣿⡇⣇⠀⠀⠀⢸⣿⣿⠀⠀⢠⢁⣿⣿⡏⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠱⡜⢿⣿⡜⣆⠀⠀⢸⣿⣿⠀⡤⣣⣾⣿⡟⠁⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠙⣮⢿⣿⣮⠢⠀⢸⣿⣿⣧⣼⣿⡿⠟⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠈⢧⢻⣿⡇⠀⣸⣿⣿⣿⡿⠛⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀
⢀⡀⠀⠀⠀⠀⢠⡀⢠⣘⣓⣠⣤⣾⣿⣿⣿⠛⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⡾⢺⣷⣾⠙⡧⠈⢳⡸⣿⣿⣿⣿⣿⣿⣿⠃⠀⠀⠀⠀⠀⣠⣷⣿⣿⢷⡆⠀⠀
⣧⣿⠛⡏⢸⠀⠀⠀⢷⡸⠿⠛⣁⢰⣿⣿⠀⠀⠀⠀⠀⠀⢹⡟⣿⡿⢃⣸⠀⠀
⠈⠙⠦⣁⠟⠀⠀⠀⠀⠙⠐⠀⢡⣾⠇⣿⠀⠀⠀⠀⠀⠀⠀⠙⠧⠔⠋⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⠹⡿⣷⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠸⣦⡵⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
        ]]

        local opts = {
            theme = "doom",
            hide = {
                statusline = false,
            },
            config = {
                header = vim.split(logo, "\n"),
                center = {
                    { action = "OpenConfigDir", desc = "Open Config Directory", key = "o" },
                    { action = "EditConfig",    desc = "Edit Config",           key = "c" },
                    { action = "QuickRef",      desc = "Quick Reference",       key = "r" },
                    { action = "Lazy",          desc = "Packages",              key = "p" },
                    { action = "qa",            desc = "Quit",                  key = "q" },
                }
            },
        }

        for _, button in ipairs(opts.config.center) do
            button.desc = button.desc .. string.rep(" ", width - #button.desc)
            button.key_format = "  (%s)"
        end

        if vim.o.filetype == "lazy" then
            vim.cmd.close()
            vim.api.nvim_create_autocmd("User", {
                pattern = "DashboardLoaded",
                callback = function()
                    require("lazy").show()
                end,
            })
        end
        
        return opts
    end,
}
