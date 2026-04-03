return {
    "folke/persistence.nvim",
    event = "BufReadPre",
    keys = {
        -- { "s", function() require("persistence").load() end, desc = "Restore session" },
        { "<leader>s", function() require("persistence").load({ last = true }) end, desc = "Restore last session" },
    },
    opts = {},
}
