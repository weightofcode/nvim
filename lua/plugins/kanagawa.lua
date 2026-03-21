return {
    "rebelot/kanagawa.nvim",
    config=function()
        require('kanagawa').setup({
            compile=true,
            transparent=true, -- not working on Win11
        });
        vim.cmd("colorscheme kanagawa");
    end,
    build = function()
        vim.cmd("KanagawaCompile");
    end,
}
