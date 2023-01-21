vim.api.nvim_set_keymap("n", "<C-a>", require("dial.map").inc_normal(), { noremap = true })
vim.api.nvim_set_keymap("n", "<C-x>", require("dial.map").dec_normal(), { noremap = true })
vim.api.nvim_set_keymap("v", "<C-a>", require("dial.map").inc_visual(), { noremap = true })
vim.api.nvim_set_keymap("v", "<C-x>", require("dial.map").dec_visual(), { noremap = true })
vim.api.nvim_set_keymap("v", "g<C-a>", require("dial.map").inc_gvisual(), { noremap = true })
vim.api.nvim_set_keymap("v", "g<C-x>", require("dial.map").dec_gvisual(), { noremap = true })
local augend = require("dial.augend")
require("dial.config").augends:register_group({
  -- default augends used when no group name is specified
  default = {
    augend.integer.alias.decimal, -- nonnegative decimal number (0, 1, 2, 3, ...)
    augend.integer.alias.hex, -- nonnegative hex number  (0x01, 0x1a1f, etc.)
    augend.date.alias["%Y/%m/%d"], -- date (2022/02/19, etc.)
    augend.constant.alias.bool, -- boolean value (true <-> false)
    augend.semver.alias.semver, -- Semantic version
  },
})
