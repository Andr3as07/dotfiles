return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
        ensure_installed = {
            "json5",
            "php",
            "javascript",
            "yaml",
            "html",
            "css",
            "markdown",
            "bash",
            "lua",
            "vim",
            "dockerfile",
            "gitignore",
            "python",
            "go"
        },
        highlight = {
            enable = true
        },
        indent = {
            enable = true
        },
        incremental_selection = {
            enable = true,
            keymaps = {
                init_selection = "<C-i>",
                node_incremental = "<C-i>",
                scope_incremental = false,
                node_decremental = "<BS>"
            }
        }
    },
    config = function(_, opts)
        require("nvim-treesitter.configs").setup(opts)
    end
  }
