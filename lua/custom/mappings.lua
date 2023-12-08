local M = {}

M.general = {
  n = {
    -- Copilot
    ["cp"] = { ":Copilot panel<enter>", "Copilot panel" },
    -- Fzf related
    ["<C-P>"] = { "<cmd>lua require('fzf-lua').files()<CR>", "fzf search" },
    ["<leader><Enter>"] = { ":Buffers<CR>", "Fzf Buffers" },
    ["<leader>l"] = { ":Lines<CR>", "Fzf lines" },

    -- format
    ["<leader>fF"] = { "<cmd> Format <CR>", "Format file",
      opts = { silent = true } },

    -- format and write
    ["<leader>fW"] = { "<cmd> FormatWrite <CR>", "Format&Write file",
      opts = { silent = true } },

    -- Press * to search for the term under the cursor or a visual selection
    -- and then press a key below to replace all instnces of it i the current file
    ["<leader>rr"] = { ":%s///g<left><left>", "Find & Replace All"},
    ["<leader>rc"] = { ":%s///gc<left><left><left>", "Find & Replace All"}
  },
  x = {
    -- Same as above but instead of acting on the whole file it will be
    -- restricted to the previously selected range.  You can do that by 
    -- pressing * visually selecting the range you want it to apply to 
    -- and then press a key below to replace all instances of it in the
    -- current selection
    ["<leader>rr"] = { ":%s///g<left><left>", "Find & Replace All"},
    ["<leader>rc"] = { ":%s///gc<left><left><left>", "Find & Replace All"},
  },
}

M.telescope = {
  plugin = true,

  n = {
    -- find
    ["<leader>fs"] = { "<cmd> Telescope lsp_document_symbols <CR>", "List symbols" },
    ["<leader>fp"] = { "<cmd> Telescope grep_string <CR>", "Grep string under cursor" },
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
