---colorscheme-transparency.nvim - Transparency plugin for Neovim
---@class CST
local M = {}

local config = require("colorscheme-transparency.config")
local highlights = require("colorscheme-transparency.highlights")

---Setup the plugin with user options
---@param opts CST.Config? User configuration options
function M.setup(opts)
  config.options = vim.tbl_deep_extend("force", config.options, opts or {})
  
  -- Load initial state
  local m_init, f_init = config.load_state()
  vim.g.transparent_enabled = m_init
  vim.g.transparent_floats_enabled = f_init

  -- Re-apply on ColorScheme change
  vim.api.nvim_create_autocmd("ColorScheme", {
    callback = function()
      highlights.apply()
    end,
  })

  -- Apply on first setup
  highlights.apply()
end

return M
