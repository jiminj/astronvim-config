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
  },
  {
    "aznhe21/actions-preview.nvim",
    commit = "8119874",
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
    "catppuccin",
    opts = {
      flavour = "macchiato",
    },
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
      { "gpt", "<cmd>lua require('goto-preview').goto_preview_type_definition()<CR>", desc = "Peek Type Definition" },
      { "gpi", "<cmd>lua require('goto-preview').goto_preview_implementation()<CR>", desc = "Peek Implementation" },
      { "gpc", "<cmd>lua require('goto-preview').close_all_win()<CR>", desc = "Close all peek windows" },
      { "gpr", "<cmd>lua require('goto-preview').goto_preview_references()<CR>", desc = "Peek References" },
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
    dependencies = {
      "alfaix/neotest-gtest",
    },
    opts = { adapters = { "neotest-gtest" } },
  },
  {
    "s1n7ax/nvim-window-picker",
    config = function()
      require("window-picker").setup {
        selection_chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
        show_prompt = false,
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
      }
    end,
  },
  -- {
  --   "nvim-telescope/telescope.nvim",
  --   dependencies = {
  --     "s1n7ax/nvim-window-picker",
  --     {
  --       "AstroNvim/astrocore",
  --       opts = function(_, opts)
  --         local maps = opts.mappings
  --         maps.v["<Leader>f"] = vim.tbl_get(opts, "_map_sections", "f")
  --         maps.v["<Leader>ff"] = {
  --           function()
  --             require("telescope.builtin").find_files {
  --               default_text = get_visual_selection(),
  --             }
  --           end,
  --           desc = "Find files",
  --         }
  --         if vim.fn.executable "rg" == 1 then
  --           maps.v["<Leader>fw"] = {
  --             function()
  --               require("telescope.builtin").live_grep {
  --                 default_text = get_visual_selection(),
  --               }
  --             end,
  --             desc = "Find words",
  --           }
  --           maps.v["<Leader>fW"] = {
  --             function()
  --               require("telescope.builtin").live_grep {
  --                 default_text = get_visual_selection(),
  --                 additional_args = function(args) return vim.list_extend(args, { "--hidden", "--no-ignore" }) end,
  --               }
  --             end,
  --             desc = "Find words in all files",
  --           }
  --         end
  --       end,
  --     },
  --     opts = {
  --       defaults = {
  --         get_selection_window = function() return require("window-picker").pick_window() or 0 end,
  --       },
  --     },
  --   },
  -- },
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
      event_handlers = {
        --   {
        --     event = "neo_tree_buffer_enter",
        --     handler = function(arg)
        --       vim.cmd [[
        --         setlocal relativenumber
        --       ]]
        --     end,
        --   },
      },
    },
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
    "MeanderingProgrammer/render-markdown.nvim",
    opts = {
      code = {
        border = "thick",
      },
      pipe_table = {
        style = "full",
      },
    },
  },
}
