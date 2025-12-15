---@type LazySpec
return {
  {
    "zbirenbaum/copilot.lua",
    dependencies = {
      -- {
      --   "copilotlsp-nvim/copilot-lsp",
      --   init = function() vim.g.copilot_nes_debounce = 500 end,
      -- },
      -- {
      --   "saghen/blink.cmp",
      --   opts = {
      --     keymap = {
      --       preset = "super-tab",
      --       ["<Tab>"] = {
      --         function(cmp)
      --           if vim.b[vim.api.nvim_get_current_buf()].nes_state then
      --             cmp.hide()
      --             return (
      --               require("copilot-lsp.nes").apply_pending_nes()
      --               and require("copilot-lsp.nes").walk_cursor_end_edit()
      --             )
      --           end
      --           if cmp.snippet_active() then
      --             return cmp.accept()
      --           else
      --             return cmp.select_and_accept()
      --           end
      --         end,
      --         "snippet_forward",
      --         "fallback",
      --       },
      --     },
      --   },
      -- },
    },
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
        -- nes = {
        --   enabled = true,
        --   keymap = {
        --     accept_and_goto = "<M-p>",
        --     accept = false,
        --     dismiss = "<Esc>",
        --   },
        -- },
        --
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
  {
    "olimorris/codecompanion.nvim",
    dependencies = {
      -- Add mcphub.nvim as a dependency
      "ravitemer/mcphub.nvim",
    },
    opts = {
      memory = {
        opts = {
          chat = {
            enabled = true,
            default_memory = "default",
          },
        },
      },
      adapters = {
        http = {
          copilot = function()
            return require("codecompanion.adapters").extend("copilot", {
              schema = {
                model = {
                  default = "claude-sonnet-4.5",
                },
              },
            })
          end,
          nv_inference = function()
            return require("codecompanion.adapters").extend("azure_openai", {
              env = {
                api_key = vim.env.NV_INFERENCE_HUB_APIKEY,
                endpoint = vim.env.NV_INFERENCE_HUB_URL,
                chat_url = "/v1/chat/completions",
              },
              schema = {
                model = {
                  default = "azure/openai/gpt-5.1-codex",
                },
                max_tokens = {
                  default = 2048,
                },
                temperature = {
                  default = 0.9,
                },
              },
            })
          end,
        },
      },
      extensions = {
        mcphub = {
          callback = "mcphub.extensions.codecompanion",
          opts = {
            make_vars = true,
            make_slash_commands = true,
            show_result_in_chat = true,
          },
        },
      },
      strategies = {
        chat = {
          -- adapter = "nv_inference",
          -- or
          adapter = "copilot",
        },
        inline = {
          -- adapter = "nv_inference",
          -- or
          adapter = "copilot",
        },
      },
    },
  },
  -- {
  --   "yetone/avante.nvim",
  --   event = "VeryLazy",
  --   version = false, -- Never set this value to "*"! Never!
  --   opts = {
  --     provider = "copilot",
  --     providers = {
  --       copilot = {
  --         model = "claude-sonnet-4",
  --       },
  --     },
  --   },
  --   dependencies = {
  --     "zbirenbaum/copilot.lua",
  --   },
  -- },
  {
    "NickvanDyke/opencode.nvim",
    keys = {
      { "<Leader>Oa", function() require("opencode").ask "@this: " end, desc = "Ask about this" },
      { "<Leader>Oa", function() require("opencode").ask "@this: " end, mode = "v", desc = "Ask about selection" },
    },
  },
  --   dependencies = {
  --     "nvim-lua/plenary.nvim",
  --     {
  --       "MeanderingProgrammer/render-markdown.nvim",
  --       opts = {
  --         anti_conceal = { enabled = false },
  --         file_types = { "markdown", "opencode_output" },
  --       },
  --       ft = { "opencode_output" },
  --     },
  --     "saghen/blink.cmp",
  --     "folke/snacks.nvim",
  --   },
  --   keys = {
  --     { "<leader>O", "", desc = "Opencode" },
  --     { "<leader>Ot", function() require("opencode").toggle() end, desc = "Toggle embedded opencode" },
  --     { "<leader>Oa", function() require("opencode").ask "@cursor: " end, desc = "Ask opencode", mode = "n" },
  --     {
  --       "<leader>Oa",
  --       function() require("opencode").ask "@selection: " end,
  --       desc = "Ask opencode about selection",
  --       mode = "v",
  --     },
  --     {
  --       "<leader>Op",
  --       function() require("opencode").select_prompt() end,
  --       desc = "Select prompt",
  --       mode = { "n", "v" },
  --     },
  --     { "<leader>On", function() require("opencode").command "session_new" end, desc = "New session" },
  --     { "<leader>Oy", function() require("opencode").command "messages_copy" end, desc = "Copy last message" },
  --     {
  --       "<S-C-u>",
  --       function() require("opencode").command "messages_half_page_up" end,
  --       desc = "Scroll messages up",
  --     },
  --     {
  --       "<S-C-d>",
  --       function() require("opencode").command "messages_half_page_down" end,
  --       desc = "Scroll messages down",
  --     },
  --   },
  -- },
}
