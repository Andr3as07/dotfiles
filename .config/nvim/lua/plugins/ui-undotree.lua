return {
  "jiaoshijie/undotree",
  dependencies = "nvim-lua/plenary.nvim",
  config = true,
  keys = {
    { "<leader>tu", function() require('undotree').toggle() end, desc = "Unto Tree" },
    { "<leader>uu", function() require('undotree').toggle() end, desc = "Unto Tree" },
  },
}
