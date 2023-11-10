local M = {}

M.general = {
  n = {
    ["cp"] = { ":Copilot panel<enter>", "Copilot panel" },
    ["<C-P>"] = {
      "<cmd>lua require('fzf-lua').files()<CR>",
      "fzf search",
      {silent = true}
    },
    -- format
    ["<leader>fF"] = { "<cmd> Format <CR>", "Format file", opts = { silent = true } },

    -- format and write
    ["<leader>fW"] = { "<cmd> FormatWrite <CR>", "Format&Write file", opts = { silent = true } },
},
}

 M.copilot = {
  i = {
    ["<C-l>"] = {
      function()
        vim.fn.feedkeys(vim.fn['copilot#Accept'](), '')
      end,
      "Copilot Accept",
      {replace_keycodes = true, nowait=true, silent=true, expr=true, noremap=true}
    },
  },
}

return M
