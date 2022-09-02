local create_autocmd = vim.api.nvim_create_autocmd
local get_currentline = vim.api.nvim_win_get_cursor
local timer = vim.loop.new_timer()
local wo = vim.wo
local prev_line = 0

local M = {}
local opts = {}

local DEFAULT_OPTS = {
  delay = {
    enable = true,
    time = 500,
  }
}

local delay_cursorline = function()
  local current_line = get_currentline(0)[1]
  if prev_line ~= current_line then
    wo.cursorlineopt = "number"
    timer:start(
      opts.delay.time,
      0,
      vim.schedule_wrap(function()
        wo.cursorlineopt = "number,line"
      end)
    )
  end
  prev_line = current_line
end

function M.setup(user_opts)
  opts = vim.tbl_deep_extend("force", DEFAULT_OPTS, user_opts or {})
  if opts.delay.enable then
    wo.cursorline = true
    prev_line = get_currentline(0)[1]
    create_autocmd({ "CursorMoved", "CursorMovedI" }, {
      callback = delay_cursorline,
    })
  end
end

return M
