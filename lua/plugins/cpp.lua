return {
  {
    "Badhi/nvim-treesitter-cpp-tools",
    cmd = { "TsCppDefineClassFunc", "TSCppMakeConcreteClass", "TSCppRuleOf3", "TSCppRuleOf5" },
    -- ft = { "cpp", "c", "h", "hpp", "cxx" },
    dependencies = {
      { "nvim-treesitter/nvim-treesitter" },
    },
    opts = function()
      return {
        preview = {
          quit = "q", -- optional keymapping for quit preview
          accept = "<tab>", -- optional keymapping for accept preview
        },
        header_extension = { "h", "hpp" }, -- optional
        source_extension = "cpp", -- optional
        custom_define_class_function_commands = { -- optional
          TSCppImplWrite = {
            output_handle = require("nt-cpp-tools.output_handlers").get_add_to_cpp(),
          },
          --[[
                <your impl function custom command name> = {
                    output_handle = function (str, context)
                        -- string contains the class implementation
                        -- do whatever you want to do with it
                    end
                }
                ]]
        },
      }
    end,
    config = true,
    keys = {
      { "<leader>rD", ":TSCppDefineClassFunc<cr>", mode = "x", desc = "Define Class Functions (C++)" },
      { "<leader>rC", ":TSCppMakeConcreteClass<cr>", mode = "x", desc = "Make Concrete Class (C++)" },
      { "<leader>r3", ":TSCppRuleOf3<cr>", mode = "x", desc = "Make To Obey Rule of Three (C++)" },
      { "<leader>r5", ":TSCppRuleOf5<cr>", mode = "x", desc = "Make To Obey Rule of Five (C++)" },
    },
  },
  {
    "p00f/clangd_extensions.nvim",
    config = function()
      require("clangd_extensions").setup {
        memory_usage = { border = "rounded" },
        symbol_info = { border = "rounded" },
      }
    end,
    keys = {
      { "<leader>lH", ":ClangdTypeHierarchy<cr>", mode = "n", desc = "Type Hierachy (Clangd)" },
      { "<leader>lT", ":ClangdAST<cr>", mode = { "n", "x" }, desc = "AST (Clangd)" },
    },
    --   ft = { "cpp", "c", "h", "hpp", "cxx" },
  },
  {
    "ThePrimeagen/refactoring.nvim",
    opts = {
      printf_statements = {
        cpp = {
          'std::cout << "%s" << std::endl;',
        },
      },
      print_var_statements = {
        -- add a custom print var statement for cpp
        cpp = {
          'std::cout << "%s = " << %s << std::endl;',
        },
      },

      prompt_func_return_type = {
        cpp = true,
        c = true,
      },

      -- prompt for function parameters
      prompt_func_param_type = {
        cpp = true,
        c = true,
      },
    },
  },
}
