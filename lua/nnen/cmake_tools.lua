return {
    "Civitasv/cmake-tools.nvim",
    config = function()
        local wk = require("which-key")
        wk.register({
            c = {
                g = { "<cmd>CMakeGenerate<CR>", "CMake Generate" },
                b = { "<cmd>CMakeBuild<CR>", "CMake Build" },
                r = { "<cmd>CMakeRun<CR>", "CMake Run" },
                p = { "<cmd>CMakeSelectBuildPreset<CR>", "CMake Select Preset" },
                s = { "<cmd>CMakeSettings<CR>", "CMake Settings" },
                t = { "<cmd>CMakeLaunchTargetSettings<CR>", "CMake Target Settings" },
            },
        }, { prefix = "<leader>" })
    end
}

