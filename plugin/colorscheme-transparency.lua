-- colorscheme-transparency.nvim plugin loader
-- This file is automatically loaded by Neovim

if vim.g.loaded_colorscheme_transparency then
  return
end
vim.g.loaded_colorscheme_transparency = 1

require("colorscheme-transparency").setup()
