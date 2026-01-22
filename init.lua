local M = {}
local config = require("transparency.config")
local highlights = require("transparency.highlights")

function M.setup(opts)
  config.options = vim.tbl_deep_extend("force", config.options, opts or {})
  
  -- Cargar estado inicial
  local m_init, f_init = config.load_state()
  vim.g.transparent_enabled = m_init
  vim.g.transparent_floats_enabled = f_init

  -- Autocomando para reaplicar al cambiar tema
  vim.api.nvim_create_autocmd("ColorScheme", {
    callback = function()
      highlights.apply()
    end,
  })

  -- Aplicar por primera vez
  highlights.apply()
end

return M
