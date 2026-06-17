-- Если Session.vim в текущей рабочей директории
local function load_session()
end

vim.api.nvim_create_user_command("LoadSession", function()
  local path = vim.fn.expand("Session.vim")  -- Файл в котором храниться сессия vim
  if vim.fn.filereadable(path) == 1 then
    vim.cmd("source " .. vim.fn.fnameescape(path))
  else
    vim.notify("Session.vim not found: " .. path, vim.log.levels.WARN)
  end
end, {})
vim.api.nvim_create_user_command("LS", function() vim.cmd("LoadSession") end, {})

return {
    {
        "tpope/vim-obsession",
        cmd="Obsession",
    } 
}
