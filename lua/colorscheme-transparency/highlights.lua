---@class CST.Highlights
local M = {}

---Main window highlight groups to make transparent
M.main_groups = {
  "Normal", "NormalNC", "NonText", "SignColumn", "EndOfBuffer", 
  "StatusLine", "StatusLineNC", "NormalSB", "SignColumnSB",
}

---Floating window highlight groups to make transparent
M.float_groups = {
  "NormalFloat", "FloatBorder", "FloatTitle", "FloatFooter",
  "Pmenu", "PmenuSel", "PmenuSbar", "PmenuThumb",
  "WhichKey", "WhichKeyNormal", "WhichKeyBorder", "WhichKeyFloat",
  "TelescopeNormal", "TelescopeBorder", "TelescopePromptNormal", "TelescopePromptBorder",
  "LazyNormal", "LazyBorder", "MasonNormal", "MasonBorder",
  "NoiceFloat", "NoiceFloatBorder", "NoiceFormatProgressDone", "NoiceLspProgressTitle",
}

---Apply transparency to configured highlight groups
function M.apply()
  if vim.g.transparent_enabled then
    for _, group in ipairs(M.main_groups) do
      vim.api.nvim_set_hl(0, group, { bg = "NONE", ctermbg = "NONE" })
    end
  end

  if vim.g.transparent_floats_enabled then
    for _, group in ipairs(M.float_groups) do
      vim.api.nvim_set_hl(0, group, { bg = "NONE", ctermbg = "NONE" })
    end
  end
end

return M
