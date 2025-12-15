-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- You can also add or configure plugins by creating files in this `plugins/` folder
-- PLEASE REMOVE THE EXAMPLES YOU HAVE NO INTEREST IN BEFORE ENABLING THIS FILE
-- Here are some examples:

---@type LazySpec
return {

  -- == Examples of Adding Plugins ==

  -- "andweeb/presence.nvim",
  -- {
  --   "ray-x/lsp_signature.nvim",
  --   event = "BufRead",
  --   config = function() require("lsp_signature").setup() end,
  -- },

  -- == Examples of Overriding Plugins ==

  {
    "folke/snacks.nvim",
    keys = {
      { "<Leader>fH", function() require("snacks").picker.highlights() end, desc = "Find highlights" },
      {
        "<Leader>gC",
        function()
          require("snacks").picker.git_log {
            current_file = true,
            follow = true,
            confirm = function(picker, item)
              picker:close()
              require("gitsigns").diffthis(item.commit)
              -- find all windows with buffer name containing 'gitsigns:///'
            end,
          }
        end,
        desc = "Git commits (current file)",
      },
    },
    opts = {
      styles = {
        input = {
          relative = "cursor",
          row = -3,
          col = 0,
        },
      },
      picker = {
        formatters = {
          file = {
            truncate = 100,
          },
        },
        -- ---@class snacks.picker.previewers.Config
        -- previewers = {
        -- }
      },

      -- customize dashboard options
      --     dashboard = {
      --       preset = {
      --         header = table.concat({
      --           " █████  ███████ ████████ ██████   ██████ ",
      --           "██   ██ ██         ██    ██   ██ ██    ██",
      --           "███████ ███████    ██    ██████  ██    ██",
      --           "██   ██      ██    ██    ██   ██ ██    ██",
      --           "██   ██ ███████    ██    ██   ██  ██████ ",
      --           "",
      --           "███    ██ ██    ██ ██ ███    ███",
      --           "████   ██ ██    ██ ██ ████  ████",
      --           "██ ██  ██ ██    ██ ██ ██ ████ ██",
      --           "██  ██ ██  ██  ██  ██ ██  ██  ██",
      --           "██   ████   ████   ██ ██      ██",
      --         }, "\n"),
      --       },
      --     },
    },

    dependencies = {
      "lewis6991/gitsigns.nvim",
    },
  },

  -- You can disable default plugins as follows:
  { "max397574/better-escape.nvim", enabled = false },

  -- You can also easily customize additional setup of plugins that is outside of the plugin's setup call
  {
    "L3MON4D3/LuaSnip",
    config = function(plugin, opts)
      require "astronvim.plugins.configs.luasnip"(plugin, opts) -- include the default astronvim config that calls the setup call
      -- add more custom luasnip configuration such as filetype extend or custom snippets
      local luasnip = require "luasnip"
      luasnip.filetype_extend("javascript", { "javascriptreact" })
    end,
  },

  {
    "windwp/nvim-autopairs",
    config = function(plugin, opts)
      require "astronvim.plugins.configs.nvim-autopairs"(plugin, opts) -- include the default astronvim config that calls the setup call
      -- add more custom autopairs configuration such as custom rules
      local npairs = require "nvim-autopairs"
      local Rule = require "nvim-autopairs.rule"
      local cond = require "nvim-autopairs.conds"
      npairs.add_rules(
        {
          Rule("$", "$", { "tex", "latex" })
            -- don't add a pair if the next character is %
            :with_pair(cond.not_after_regex "%%")
            -- don't add a pair if  the previous character is xxx
            :with_pair(
              cond.not_before_regex("xxx", 3)
            )
            -- don't move right when repeat character
            :with_move(cond.none())
            -- don't delete if the next character is xx
            :with_del(cond.not_after_regex "xx")
            -- disable adding a newline when you press <cr>
            :with_cr(cond.none()),
        },
        -- disable for .vim files, but it work for another filetypes
        Rule("a", "a", "-vim")
      )
    end,
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      inlay_hints = { enabled = true },
    },
  },
  {
    "lewis6991/gitsigns.nvim",
    enabled = true,
    keys = {
      { "<leader>gW", "<cmd>Gitsigns toggle_word_diff<CR>", desc = "Toggle word diff" },
    },
    config = function(_, opts)
      require("gitsigns").setup(opts) -- include the default astronvim config that calls the setup call
      vim.api.nvim_create_autocmd("BufRead", {
        pattern = "gitsigns:///*",
        callback = function(data)
          -- Set the filetype to 'gitcommit' for gitsigns buffers
          vim.bo[data.buf].filetype = "gitsigns-buffer"
          -- Optionally, you can also set other buffer options here, like 'buftype' or 'bufhidden'
          -- vim.bo[data.buf].buftype = "nofile"
          -- vim.bo[data.buf].bufhidden = "hide"
        end,
      })

      -- add more custom gitsigns configuration such as keymaps
    end,
  },
  {
    "echasnovski/mini.diff",
    opts = {
      mappings = {
        textobject = "gh",
      },
    },
  },
  {
    "mbbill/undotree",
    cmd = { "UndotreeToggle", "UndotreeShow", "UndotreeFocus" },
    keys = {
      { "<leader>U", "", desc = "UndoTree" },
      { "<leader>Ut", "<cmd>UndotreeToggle<CR>", desc = "UndoTree Toggle" },
      { "<leader>Uf", "<cmd>UndotreeFocus<CR>", desc = "UndoTree Focus" },
    },
    config = function()
      vim.g.undotree_ShortIndicators = 1
      vim.g.undotree_SplitWidth = 50
    end,
  },
  {
    "alexghergh/nvim-tmux-navigation",
    config = function()
      require("nvim-tmux-navigation").setup {
        disable_when_zoomed = true, -- defaults to false
        keybindings = {
          left = "<C-w>h",
          down = "<C-w>j",
          up = "<C-w>k",
          right = "<C-w>l",
          last_active = "<C-w>\\",
          next = "<C-w><Space>",
        },
      }
    end,
  },
  {
    "lewis6991/spaceless.nvim",
    config = function() require("spaceless").setup() end,
  },
  {
    "lewis6991/gitsigns.nvim",
    event = "User AstroFile",
    dependencies = {
      "nvim-lua/plenary.nvim",
      {
        "purarue/gitsigns-yadm.nvim",
        opts = {
          shell_timeout_ms = 1000,
        },
      },
    },
    opts = {
      _on_attach_pre = function(bufnr, callback) require("gitsigns-yadm").yadm_signs(callback, { bufnr = bufnr }) end,
      signs = {
        add = { text = "▌" },
        change = { text = "▌" },
        delete = { text = "_" },
        topdelete = { text = "‾" },
        changedelete = { text = "▌" },
        untracked = { text = "▌" },
      },
      signcolumn = true,
      numhl = true,
      linehl = false,
      current_line_blame = true,
      current_line_blame_opts = {
        virt_text = true,
        virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
        delay = 50,
        ignore_whitespace = false,
        virt_text_priority = 100,
      },
    },
  },
  {
    "rmagatti/goto-preview",
    config = function() require("goto-preview").setup {} end,
    keys = {
      { "gp", "", desc = "Peek" },
      { "gpd", "<cmd>lua require('goto-preview').goto_preview_definition()<CR>", desc = "Peek Definition" },
      { "gpD", "<cmd>lua require('goto-preview').goto_preview_declaration()<CR>", desc = "Peek Definition" },
      { "gpy", "<cmd>lua require('goto-preview').goto_preview_type_definition()<CR>", desc = "Peek Type Definition" },
      { "gpI", "<cmd>lua require('goto-preview').goto_preview_implementation()<CR>", desc = "Peek Implementation" },
      { "gpc", "<cmd>lua require('goto-preview').close_all_win()<CR>", desc = "Close all peek windows" },
      { "gpR", "<cmd>lua require('goto-preview').goto_preview_references()<CR>", desc = "Peek References" },
    },
  },
  {
    "mfussenegger/nvim-dap",
    lazy = true,
    specs = {
      {
        "AstroNvim/astrocore",
        opts = function(_, opts)
          local maps = opts.mappings
          maps.n["<Leader>dU"] = { function() require("dap").up() end, desc = "Stack Frame Up" }
          maps.n["<Leader>dD"] = { function() require("dap").down() end, desc = "Stack Frame Down" }
        end,
      },
    },
  },

  -- {
  --   "ldelossa/nvim-dap-projects",
  --   config = function() require("nvim-dap-projects").search_project_config() end,
  --   dependencies = {
  --     { "mfussenegger/nvim-dap" },
  --   },
  -- },

  {
    "nvim-neotest/neotest",
    lazy = true,
    dependencies = {
      "nvim-neotest/nvim-nio",
      "nvim-lua/plenary.nvim",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-treesitter/nvim-treesitter",
      "alfaix/neotest-gtest",
      "mfussenegger/nvim-dap",
    },
  },
  {
    "s1n7ax/nvim-window-picker",
    opts = {
      selection_chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
      show_prompt = false,
      hint = "statusline-winbar",
      filter_rules = {
        include_current_win = true,
        autoselect_one = true,
        -- filter using buffer options
        bo = {
          -- if the file type is one of following, the window will be ignored
          filetype = { "neo-tree", "neo-tree-popup", "notify", "noice", "blame", "undotree" },
          -- if the buffer type is one of following, the window will be ignored
          buftype = { "terminal", "quickfix" },
        },
      },
      picker_config = {
        statusline_winbar_picker = {
          use_winbar = "never",
        },
      },
    },
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    dependencies = {
      "s1n7ax/nvim-window-picker",
    },
    opts = {
      window = {
        mappings = {
          ["gF"] = "picker_find_file",
          ["gG"] = "picker_livegrep",
          ["<cr>"] = "open_with_window_picker",
        },
      },
      commands = {
        picker_find_file = function(state)
          local path = state.tree:get_node():get_id()
          require("snacks.picker").files { cwd = path }
        end,
        picker_livegrep = function(state)
          local path = state.tree:get_node():get_id()
          require("snacks.picker").grep { cwd = path }
        end,
      },
    },
  },
  {
    "otavioschwanck/arrow.nvim",
    dependencies = {
      {
        "echasnovski/mini.icons",
      },
    },
    opts = {
      show_icons = true,
      leader_key = "<leader><leader>",
      buffer_leader_key = "mm",
      per_buffer_config = {
        lines = 8,
      },
    },
    keys = {
      { "m", "", desc = "Arrow Buffer" },
      { "mn", "<cmd>Arrow next_buffer_bookmark<cr>", desc = "Next Arrow Buffer Bookmark" },
      { "mp", "<cmd>Arrow prev_buffer_bookmark<cr>", desc = "Previous Arrow Buffer Bookmark" },
      { "ma", "<cmd>Arrow toggle_current_line_for_buffer<cr>", desc = "Toggle Arrow Bookmark" },
    },
    init = function()
      local hl = vim.api.nvim_get_hl(0, { name = "Normal" })
      hl.bold = true
      vim.api.nvim_set_hl(0, "ArrowBookmarkSign", hl)
    end,
    specs = {
      {
        "rebelot/heirline.nvim",
        optional = true,
        opts = function(_, opts)
          local arrow_statusline = require "arrow.statusline"
          local arrow = {
            condition = function() return arrow_statusline.is_on_arrow_file() end,
            update = {
              "BufEnter",
            },
            {
              provider = function() return "[" .. arrow_statusline.text_for_statusline_with_icons() .. "] " end,
              hl = { bold = true },
            },
          }
          table.insert(opts.statusline, 5, arrow)
        end,
      },
    },
  },
  {
    "nvimdev/template.nvim",
    cmd = { "Template" },
  },
  {
    "mrjones2014/smart-splits.nvim",
    keys = {
      { "<M-Up>", function() require("smart-splits").resize_up() end, desc = "Resize split up" },
      { "<M-Down>", function() require("smart-splits").resize_down() end, desc = "Resize split down" },
      { "<M-Left>", function() require("smart-splits").resize_left() end, desc = "Resize split left" },
      { "<M-Right>", function() require("smart-splits").resize_right() end, desc = "Resize split right" },
    },
  },
  {
    "ravitemer/mcphub.nvim",
    build = "npm install -g mcp-hub@latest",
    config = function() require("mcphub").setup() end,
  },
  -- {
  --   "catppuccin/nvim",
  --   name = "catppuccin",
  --   priority = 1000,
  --   opts = {
  --     flavour = "macchiato",
  --   },
  -- },
  {
    "nvim-zh/colorful-winsep.nvim",
    opts = {
      animate = { enabled = false },
    },
    event = { "WinLeave" },
  },
  {
    "folke/styler.nvim",
    config = function()
      require("styler").setup { themes = {} }

      -- local group = vim.api.nvim_create_augroup("GitsignsStyler", { clear = true })
      --
      -- vim.api.nvim_create_autocmd("BufEnter", {
      --   group = group,
      --   pattern = "gitsigns:///*",
      --   callback = function(ev)
      --     -- apply a special colorscheme just for this window
      --     require("styler").set_theme(0, {
      --       colorscheme = "elflord",
      --     })
      --   end,
      -- })
      --
      -- -- Optional: when leaving gitsigns buffers, restore default theme
      -- vim.api.nvim_create_autocmd("BufLeave", {
      --   group = group,
      --   pattern = "gitsigns:///*",
      --   callback = function(ev)
      --     -- reset to your normal theme for that window
      --     require("styler").set_theme(0, {
      --       colorscheme = "tokyonight-storm",
      --       background = "dark",
      --     })
      --   end,
      -- })
    end,
  },
}
