-- Basic
require("core")

-- Color scheme
vim.cmd.colorscheme("kanagawa-dragon")  -- kanagawa-wave, kanagawa-dragon, kanagawa-lotus, kanagawa-paper(enabled in ui.lua)

-- прозрачный bg  
vim.cmd([[
    " highlight NormalFloat guibg=None ctermbg=None
    highlight FloatBorder guibg=None ctermbg=None
    highlight FloatTitle  guibg=None ctermbg=None
    highlight Normal guibg=NONE ctermbg=NONE
    highlight NonText guibg=NONE ctermbg=NONE
    highlight LineNr guibg=NONE ctermbg=NONE
    highlight StatusLine guibg=NONE ctermbg=NONE
    highlight EndOfBuffer guibg=NONE ctermbg=NONE

    highlight SignColumn guibg=NONE ctermbg=NONE
    highlight DiagnosticSignError guibg=NONE ctermbg=NONE
    highlight DiagnosticSignWarn guibg=NONE ctermbg=NONE
    highlight DiagnosticSignInfo guibg=NONE ctermbg=NONE
    highlight DiagnosticSignHint guibg=NONE ctermbg=NONE


    highlight GitSignsAdd guibg=NONE ctermbg=NONE
    highlight GitSignsChange guibg=NONE ctermbg=NONE
    highlight GitSignsDelete guibg=NONE ctermbg=NONE

    highlight TelescopeResultsNormal guibg=None ctermbg=None
]])
