return {
    "ibhagwan/fzf-lua",
    -- optional for icon support
    dependencies = { "nvim-tree/nvim-web-devicons" },
    -- or if using mini.icons/mini.nvim
    -- dependencies = { "nvim-mini/mini.icons" },
    ---@module "fzf-lua"
    ---@type fzf-lua.Config|{}
    ---@diagnostic disable: missing-fields
    opts = {},
    keys = {
        -- the reason for keybinds here and no in the ususal options.lua/vim
        -- is because nvim will know that these keys are associated with Lazy
        -- and will only load them on demand (performance increase)
        {
            "<leader>fh",
            function() require("fzf-lua").helptags() end,
            desc="[F]find [H]elp"
        },
        {
            "<leader>fb",
            function() require("fzf-lua").builtin() end,
            desc="[F]find [B]uiltin"
        },
        {
            "<leader>ff",
            function() require("fzf-lua").files() end,
            desc="[F]find [F]iles"
        },
        {
            "<leader>fg",
            function() require("fzf-lua").live_grep() end,
            desc="[F]find [G]rep"
        },
        {
            "<leader><leader>",
            function() require("fzf-lua").buffers() end,
            desc="[ ] Find existing buffers"
        },
        {
            "<leader>/",
            function() require("fzf-lua").lgrep_curbuf() end,
            desc="[/] Live grep the current buffer"
        },
        {
            "<leader>fc",
            function() require("fzf-lua").files({
                cwd = vim.fn.stdpath("config")
            }) end,
            desc="[F]find [C]onfig"
        },
        {
            "<leader>fk",
            function() require("fzf-lua").keymaps() end,
            desc="[F]find [K]eymaps"
        },
        {
            "<leader>fw",
            function() require("fzf-lua").grep_cword() end,
            desc="[F]find current [W]ord" -- case-sensitive
        },
        {
            "<leader>fW",
            function() require("fzf-lua").grep_cWORD() end,
            desc="[F]find current [W]ORD" -- case-insensitive full word
        },
        {
            "<leader>fd",
            function() require("fzf-lua").diagnostics_document() end,
            desc="[F]find [D]iagnostics"
        },
        {
            "<leader>fr",
            function() require("fzf-lua").resume() end,
            desc="[F]find [R]esume"
        },
        {
            "<leader>fo",
            function() require("fzf-lua").oldfiles() end,
            desc="[F]find [O]ld files"
        }
    }
    ---@diagnostic enable: missing-fields
}
