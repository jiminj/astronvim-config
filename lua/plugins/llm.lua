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
  {
    "yetone/avante.nvim",
    event = "VeryLazy",
    version = false, -- Never set this value to "*"! Never!
    opts = {
      provider = "copilot",
      providers = {
        copilot = {
          model = "claude-sonnet-4",
        },
      },
    },
    dependencies = {
      "zbirenbaum/copilot.lua",
    },
  },
  {
    "NickvanDyke/opencode.nvim",
    keys = {
      { "<leader>At", function() require("opencode").toggle() end, desc = "Toggle embedded opencode" },
      { "<leader>Aa", function() require("opencode").ask "@cursor: " end, desc = "Ask opencode", mode = "n" },
      {
        "<leader>Aa",
        function() require("opencode").ask "@selection: " end,
        desc = "Ask opencode about selection",
        mode = "v",
      },
      {
        "<leader>Ap",
        function() require("opencode").select_prompt() end,
        desc = "Select prompt",
        mode = { "n", "v" },
      },
      { "<leader>An", function() require("opencode").command "session_new" end, desc = "New session" },
      { "<leader>Ay", function() require("opencode").command "messages_copy" end, desc = "Copy last message" },
      {
        "<S-C-u>",
        function() require("opencode").command "messages_half_page_up" end,
        desc = "Scroll messages up",
      },
      {
        "<S-C-d>",
        function() require("opencode").command "messages_half_page_down" end,
        desc = "Scroll messages down",
      },
    },
  },
}
