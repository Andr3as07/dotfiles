return {
  "sphamba/smear-cursor.nvim",
  opts = {},
  keys = {
      { "<leader>um", function() require("smear_cursor").toggle() end, desc = "Toggle Smear" }
  }
}
