local M = {}

local icons = {
  [vim.diagnostic.severity.ERROR] = "E",
  [vim.diagnostic.severity.WARN]  = "W",
  [vim.diagnostic.severity.INFO]  = "I",
  [vim.diagnostic.severity.HINT]  = "H",
}

local hl_groups = {
  [vim.diagnostic.severity.ERROR] = "DiagnosticSignError",
  [vim.diagnostic.severity.WARN]  = "DiagnosticSignWarn",
  [vim.diagnostic.severity.INFO]  = "DiagnosticSignInfo",
  [vim.diagnostic.severity.HINT]  = "DiagnosticSignHint",
}

function M.render()
  local lnum = vim.v.lnum

  -- диагностика: берём самый "серьёзный" диагноз на строке
  local diag_str = "  " -- пустой слот фиксированной ширины, если диагностики нет
  local diags = vim.diagnostic.get(0, { lnum = lnum - 1 })
  if #diags > 0 then
    table.sort(diags, function(a, b) return a.severity < b.severity end)
    local sev = diags[1].severity
    diag_str = "%#" .. hl_groups[sev] .. "#" .. icons[sev] .. "%* "
  end

  -- %s = нативный sign column (тут будет gitsigns)
  -- %l = номер строки
  return diag_str .. "%s%l" 
end

return M
