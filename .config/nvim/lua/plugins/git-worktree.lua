return {
  'polarmutex/git-worktree.nvim',
  version = '^2',
  dependencies = {
      "nvim-lua/plenary.nvim",
      'nvim-telescope/telescope.nvim'
  },
  config = function()
    local Hooks = require("git-worktree.hooks")
    local config = require('git-worktree.config')
    local update_on_switch = Hooks.builtins.update_current_buffer_on_switch

    Hooks.register(Hooks.type.SWITCH, function (path, prev_path)
        vim.notify("Moved from " .. prev_path .. " to " .. path)
        update_on_switch(path, prev_path)
    end)

    Hooks.register(Hooks.type.DELETE, function ()
        vim.cmd(config.update_on_change_command)
    end)

    require('telescope').load_extension('git_worktree')
  end
}
