vim.b.copilot_enabled = false
vim.g.copilot_filetypes = { ["*"] = false }

-- https://zenn.dev/gentamura/articles/22ed20c9013b19
vim.g.copilot_no_tab_map = true
local keymap = vim.keymap.set
-- https://github.com/orgs/community/discussions/29817#discussioncomment-4217615
keymap(
  "i",
  "<C-g>",
  'copilot#Accept("<CR>")',
  { silent = true, expr = true, script = true, replace_keycodes = false }
)
keymap("i", "<C-j>", "<Plug>(copilot-next)")
keymap("i", "<C-k>", "<Plug>(copilot-previous)")
keymap("i", "<C-o>", "<Plug>(copilot-dismiss)")
keymap("i", "<C-s>", "<Plug>(copilot-suggest)")
keymap("", "<Leader>c", function()
  vim.b.copilot_enabled = not vim.b.copilot_enabled
  if vim.b.copilot_enabled then
    print("Copilot Enabled!")
  else
    print("Copilot Disabled")
  end
end)
