local iron = require("iron.core")
local view = require("iron.view")
local bracketed_paste = require("iron.fts.common").bracketed_paste
local executable = function(exe)
  return vim.api.nvim_call_function('executable', {exe}) == 1
end

iron.setup {
  config = {
    -- Whether a repl should be discarded or not
    scratch_repl = true,
    -- Your repl definitions come here
    repl_definition = {
      sh = {
        -- Can be a table or a function that
        -- returns a table (see below)
        command = {"bash"}
      },
      python = {
        command = function(meta)
          local filename = vim.api.nvim_buf_get_name(meta.current_bufnr)
          if string.match(filename, ".*%.py") then
            -- return executable("ptipython") and {"ptipython"} or {"ipython"}
            return executable("ipython") and {"ipython"} or {"python"}
            -- return {"ptpython"}
          elseif string.match(filename, ".*%.sage$") then
            return {"sage"}
          else
            return {"ipython"}
          end
        end,
        format = bracketed_paste
      }
    },
    -- How the repl window will be displayed
    -- See below for more information
    -- repl_open_cmd = require('iron.view').bottom(40),
    -- repl_open_cmd = view.center("30%", 20)
    -- repl_open_cmd = view.top("10%")
    -- repl_open_cmd = "vertical botright 80 split"
    repl_open_cmd = view.split.vertical.botright(50)
    },
  -- Iron doesn't set keymaps by default anymore.
  -- You can set them here or manually add keymaps to the functions in iron.core
  keymaps = {
    send_motion = "<space>sc",
    visual_send = "<space>sc",
    send_file = "<space>sf",
    send_line = "<space>sl",
    send_until_cursor = "<space>su",
    send_mark = "<space>sm",
    mark_motion = "<space>mc",
    mark_visual = "<space>mc",
    remove_mark = "<space>md",
    cr = "<space>s<cr>",
    interrupt = "<space>s<space>",
    exit = "<space>sq",
    clear = "<space>cl",
  },
  -- If the highlight is on, you can change how it looks
  -- For the available options, check nvim_set_hl
  highlight = {
    italic = true
  },
  ignore_blank_lines = true, -- ignore blank lines when sending visual select lines
}

-- iron also has a list of commands, see :h iron-commands for all available commands
vim.keymap.set('n', '<space>rs', '<cmd>IronRepl<cr>')
vim.keymap.set('n', '<space>rr', '<cmd>IronRestart<cr>')
vim.keymap.set('n', '<space>rf', '<cmd>IronFocus<cr>')
vim.keymap.set('n', '<space>rh', '<cmd>IronHide<cr>')
