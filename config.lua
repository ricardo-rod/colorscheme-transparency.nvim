local M = {}

M.options = {
  use_persistence = false,
  default_main = true,
  default_floats = true,
}

M.state_path = vim.fn.stdpath("data") .. "/transparent_state"

function M.save_state()
  if not M.options.use_persistence then return end
  local fd = vim.uv.fs_open(M.state_path, "w", 438)
  if fd then
    local data = string.format("%s,%s", 
      vim.g.transparent_enabled and "1" or "0",
      vim.g.transparent_floats_enabled and "1" or "0")
    vim.uv.fs_write(fd, data, 0)
    vim.uv.fs_close(fd)
  end
end

function M.load_state()
  if not M.options.use_persistence then 
    return M.options.default_main, M.options.default_floats 
  end
  local fd = vim.uv.fs_open(M.state_path, "r", 438)
  if not fd then return M.options.default_main, M.options.default_floats end
  local stat = vim.uv.fs_fstat(fd)
  if stat then
    local data = vim.uv.fs_read(fd, stat.size, 0)
    vim.uv.fs_close(fd)
    local m, f = data:match("([^,]+),([^,]+)")
    return m == "1", f == "1"
  end
  vim.uv.fs_close(fd)
  return M.options.default_main, M.options.default_floats
end

return M
