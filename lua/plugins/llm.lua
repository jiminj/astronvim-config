---@type LazySpec
return {
  {
    "zbirenbaum/copilot.lua",
    opts = function(_, _)
      return {
        suggestion = {
          enabled = true,
          auto_trigger = true,
          debounce = 150,
          keymap = {
            accept = "<M-l>",
            accept_word = false,
            accept_line = false,
            next = "<M-]>",
            prev = "<M-[>",
            dismiss = "<C-]>",
          },
        },
        -- panel = {
        --   enabled = true,
        --   auto_refresh = true,
        -- },
      }
    end,
    -- keys = {
    --   { "<leader>lc", "<cmd>Copilot panel<cr>", desc = "Panel" },
    -- },
  },
  -- {
  --   "Davidyz/VectorCode",
  --   version = "*", -- optional, depending on whether you're on nightly or release
  --   build = "pipx upgrade vectorcode", -- optional but recommended. This keeps your CLI up-to-date.
  --   dependencies = { "nvim-lua/plenary.nvim" },
  -- },
  -- {
  --   "olimorris/codecompanion.nvim",
  --   dependencies = {
  --     "nvim-lua/plenary.nvim",
  --     "nvim-treesitter/nvim-treesitter",
  --     {
  --       "AstroNvim/astrocore",
  --       opts = function(_, opts)
  --         local maps = opts.mappings
  --         maps.n["<Leader>a"] = {
  --           "<cmd>CodeCompanionActions<CR>",
  --           desc = require("astroui").get_icon("CodeCompanion", 1, true) .. "CodeCompanion Actions",
  --         }
  --         maps.v["<Leader>a"] = {
  --           "<cmd>CodeCompanionActions<CR>",
  --           desc = require("astroui").get_icon("CodeCompanion", 1, true) .. "CodeCompanion Actions",
  --         }
  --         maps.n["<Leader>C"] = {
  --           "<cmd>CodeCompanionChat Toggle<CR>",
  --           desc = require("astroui").get_icon("CodeCompanion", 1, true) .. "Toggle CodeCompanion",
  --         }
  --         maps.v["<Leader>C"] = {
  --           "<cmd>CodeCompanionChat<CR>",
  --           desc = require("astroui").get_icon("CodeCompanion", 1, true) .. "Open CodeCompanion",
  --         }
  --         maps.v["ga"] = {
  --           "<cmd>CodeCompanionChat Add<cr>",
  --           desc = "Add to CodeCompanion",
  --         }
  --       end,
  --     },
  --     { "AstroNvim/astroui", opts = { icons = { CodeCompanion = "󰘦 " } } },
  --   },
  --
  --   opts = {
  --     adapters = {
  --       copilot = function()
  --         return require("codecompanion.adapters").extend("copilot", {
  --           schema = {
  --             model = {
  --               default = "claude-3.7-sonnet",
  --             },
  --           },
  --         })
  --       end,
  --     },
  --     display = {
  --       chat = { show_settings = true },
  --       diff = {
  --         provider = "mini_diff",
  --       },
  --       inline = {
  --         layout = "vertical", -- vertical|horizontal|buffer
  --       },
  --     },
  --     extensions = {
  --       vectorcode = {
  --         opts = {
  --           add_tool = true,
  --           add_slash_command = true,
  --           tool_opts = {},
  --         },
  --       },
  --     },
  --     strategies = {
  --       -- Change the default chat adapter
  --       chat = {
  --         -- adapter = "nv_llama_3_3_70b",
  --         adapter = "copilot",
  --       },
  --       inline = {
  --         adapter = "copilot",
  --         -- adapter = "nv_deepseek_r1",
  --         -- adapter = "nv_llama_3_3_70b",
  --       },
  --       cmd = {
  --         adapter = "copilot",
  --       },
  --     },
  --     opts = {
  --       -- log_level = "DEBUG", -- or "TRACE"
  --     },
  --   },
  --   config = function(_, opts)
  --     require("codecompanion").setup(opts)
  --     vim.cmd [[cab cc CodeCompanion]]
  --   end,
  -- },
}
