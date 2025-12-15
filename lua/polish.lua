-- if true then return end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- This will run last in the setup process.
-- This is just pure lua so anything that doesn't
-- fit in the normal config locations above can go here

local opt = vim.opt
opt.exrc = true
opt.clipboard = "unnamedplus"

if vim.env.TMUX ~= nil then
  local copy = { "tmux", "load-buffer", "-w", "-" }
  local paste = { "bash", "-c", "tmux refresh-client -l && sleep 0.05 && tmux save-buffer -" }
  vim.g.clipboard = {
    name = "tmux",
    copy = {
      ["+"] = copy,
      ["*"] = copy,
    },
    paste = {
      ["+"] = paste,
      ["*"] = paste,
    },
    cache_enabled = 0,
  }
else
  vim.g.clipboard = {
    name = "OSC 52",
    copy = {
      ["+"] = require("vim.ui.clipboard.osc52").copy "+",
      ["*"] = require("vim.ui.clipboard.osc52").copy "*",
    },
    paste = {
      ["+"] = require("vim.ui.clipboard.osc52").paste "+",
      ["*"] = require("vim.ui.clipboard.osc52").paste "*",
    },
  }
end

-- no line wraps
-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = { "markdown", "json", "yaml" },
--   callback = function() vim.opt_local.wrap = false end,
-- })

-- vim.api.nvim_create_autocmd({ "FileType" }, {
--   pattern = { "c", "cpp", "cmake" },
--   callback = function()
--     vim.opt_local.shiftwidth = 4
--     vim.opt_local.tabstop = 4
--     -- vim.opt_local.cindent = true
--     -- require("nvim-treesitter.configs").setup {
--     --   indent = { enable = false },
--     -- }
--   end,
-- })
--
-- vim.api.nvim_create_autocmd({ "FileType" }, {
--   group = vim.api.nvim_create_augroup("GitSignsFileGroup", { clear = true }),
--   pattern = { "gitsigns.*" },
--   callback = function(ev)
--     print "here!!!"
--     print(string.format("event fired: %s", vim.inspect(ev)))
--   end,
--   -- callback
--   -- callback = function()
--   -- local file_name = vim.fn.bufname()
--   -- print("gitsigns buffer:", file_name)
--   -- if file_name:find "^gitsigns:///" then
--   --   print "gitsigns buffer detected"
--   --   -- set_remote_theme()
--   -- else
--   --   print "not gitsigns buffer "
--   --   -- set_default_theme()
--   -- end
--   -- end,
-- })

-- Autocommand to check the buffer name (file path) on various events
-- vim.api.nvim_create_autocmd({ "BufNew", "BufEnter", "BufReadPost" }, {
--   group = vim.api.nvim_create_augroup("GitSignsFileGroup", { clear = true }),
--   pattern = { "gitsigns.*" },
--   callback = function(ev)
--     print "here!!!"
--     print(string.format("event fired: %s", vim.inspect(ev)))
--   end,
--   -- callback
--   -- callback = function()
--   -- local file_name = vim.fn.bufname()
--   -- print("gitsigns buffer:", file_name)
--   -- if file_name:find "^gitsigns:///" then
--   --   print "gitsigns buffer detected"
--   --   -- set_remote_theme()
--   -- else
--   --   print "not gitsigns buffer "
--   --   -- set_default_theme()
--   -- end
--   -- end,
-- })
--
-- vim.api.nvim_create_autocmd({ "WinEnter", "BufReadPost" }, {
--   group = vim.api.nvim_create_augroup("GitsignsColorGroup", { clear = true }),
--   callback = function(ev)
--     -- require("styler").set_theme(vim.api.nvim_get_current_win(), { colorscheme = "elflord" })
--     if vim.fn.bufname():find "^gitsigns:///" then
--       -- print(vim.inspect(ev))
--       -- print(vim.api.nvim_get_current_win())
--       --
--       require("styler").set_theme(vim.api.nvim_get_current_win(), { colorscheme = "elflord" })
--
--       --   print(vim.api.nvim_get_current_win())
--       --   -- require("styler").set_theme(vim.api.nvim_get_current_win(), { colorscheme = "elflord" })
--       --   --       -- else
--       --   --       -- set_remote_theme()
--       --   --       -- else
--       --   --       -- set_default_theme()
--     end
--   end,
-- })
