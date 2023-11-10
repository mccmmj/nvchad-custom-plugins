local M = {
  filetype = {
    javascript = {
      require("formatter.filetypes.javascript").prettier
    },
    typescript = {
      require("formatter.filetypes.typescript").prettier
    },
    python = {
      require("formatter.filetypes.python").black
    },
    cpp = {
      require("formatter.filetypes.cpp").clangformat
    },
    ["*"] = {
      require("formatter.filetypes.any").remove_tailing_whitespace
    }
  }
}

-- vim.api.nvim_create_autocmd({ "BufWritePost" },{
--   command = "FormatWriteLock"
-- })

return M
