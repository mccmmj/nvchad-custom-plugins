local overrides = require("custom.configs.overrides")

local plugins = {
  {
    "jose-elias-alvarez/null-ls.nvim",
    opts = function()
      return require "custom.configs.null-ls"
    end,
  },
  {
    "mhartington/formatter.nvim",
    event = "VeryLazy",
    opts = function()
      return require "custom.configs.formatter"
    end,
  },
  {
    "mfussenegger/nvim-lint",
    event = "VeryLazy",
    config = function()
      require "custom.configs.lint"
    end,
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "black",
        "clangd",
        "clang-format",
        "cpplint",
        "eslint-lsp",
        "eslint_d",
        "prettier",
        "html-lsp",
        "css-lsp",
        "pylint",
        "mypy",
        "ruff",
        "python-lsp-server",
        "typescript-language-server"
      }
    }
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },
  {
    "junegunn/fzf",
    build = "./install --bin",
  },
  {
    "ibhagwan/fzf-lua",
    -- optional for icon support
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      -- calling `setup` is optional for customization
      require("fzf-lua").setup({
        'skim',
        lsp = {
        -- make lsp requests synchronous so they work with null-ls
        async_or_timeout = 3000,
        },
      })
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        -- defaults 
        "vim",
        "lua",

        -- web dev 
        "html",
        "css",
        "javascript",
        "typescript",
        "tsx",
        "json",
        -- "vue", "svelte",

       -- low level
        "c",
        "zig"
      },
    },
  },
  {
    "jackMort/ChatGPT.nvim",
    event = "VeryLazy",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim"
    },
    config = function()
      require("chatgpt").setup({
        api_key_cmd = "pass show openapi/api/token"
      })
    end,
  },
  -- {
  --   "zbirenbaum/copilot.lua",
  --   -- Lazy load when event occurs. Events are triggered
  --   -- as mentioned in:
  --   -- https://vi.stackexchange.com/a/4495/20389
  --   event = "InsertEnter",
  --   -- You can also have it load at immediately at
  --   -- startup by commenting above and uncommenting below:
  --   -- lazy = false
  --   opts = overrides.copilot,
  -- },
  -- {
  --   "hrsh7th/nvim-cmp",
  --   dependencies = {
  --     {
  --       "zbirenbaum/copilot-cmp",
  --       config = function()
  --         require("copilot_cmp").setup()
  --       end,
  --     },
  --   },
  --   opts = {
  --     sources = {
  --       { name = "nvim_lsp", group_index = 2 },
  --       { name = "copilot",  group_index = 2 },
  --       { name = "luasnip",  group_index = 2 },
  --       { name = "buffer",   group_index = 2 },
  --       { name = "nvim_lua", group_index = 2 },
  --       { name = "path",     group_index = 2 },
  --     },
  --   },
  -- },
}
return plugins
