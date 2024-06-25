local M = {
  -- "LunarVim/primer.nvim",
  "LunarVim/darkplus.nvim",
  lazy = false, -- make sure we load this during startup if it is your main colorscheme
  priority = 1000, -- make sure to load this before all the other start plugins
}
-- #590008
-- #ffc0b9

function M.config()
  -- #005078 NvimDarkBlue
  -- #007676 NvimDarkCyan
  -- #015825 NvimDarkGreen
  -- #0a0b10 NvimDarkGrey1
  -- #1c1d23 NvimDarkGrey2
  -- #2c2e33 NvimDarkGrey3
  -- #4f5258 NvimDarkGrey4
  -- #4c0049 NvimDarkMagenta
  -- #5e0009 NvimDarkRed
  -- #6e5600 NvimDarkYellow
  -- #9fd8ff NvimLightBlue
  -- #83efef NvimLightCyan
  -- #aaedb7 NvimLightGreen
  -- #ebeef5 NvimLightGrey1
  -- #d7dae1 NvimLightGrey2
  -- #c4c6cd NvimLightGrey3
  -- #9b9ea4 NvimLightGrey4
  -- #ffc3fa NvimLightMagenta
  -- #ffbcb5 NvimLightRed
  -- #f4d88c NvimLightYellow
  --
  --
  -- "NvimDarkBlue", #004c73
  -- "NvimDarkCyan", #007373
  -- "NvimDarkGreen", #005523
  -- "NvimDarkGrey1", #07080d
  -- "NvimDarkGrey2", #14161b
  -- "NvimDarkGrey3", #2c2e33
  -- "NvimDarkGrey4", #4f5258
  -- "NvimDarkMagenta", #470045
  -- "NvimDarkRed", #590008
  -- "NvimDarkYellow", #6b5300
  -- "NvimLightBlue", #a6dbff
  -- "NvimLightMagenta", #ffcaff
  -- "NvimLightRed", #ffc0b9
  -- "NvimLightYellow", #fce094
  --
  -- -- old
  --
  -- #e1af69
  -- #7ccdfd
  -- #bb99f7
  -- #87ffaf
  -- #ffd8ff

  -- vim.cmd.colorscheme "primer_dark"
  -- vim.cmd.colorscheme "darkplus"

  local c = {
    fg = "#e0e2ea",
    bg = "#14161b",
    alt_bg = "#27282d",

    light_grey_1 = "#eef1f8",
    light_grey_2 = "#e0e2ea",
    light_grey_3 = "#c4c6cd",
    light_grey_4 = "#9b9ea4",

    dark_grey_1 = "#07080d",
    dark_grey_2 = "#14161b",
    dark_grey_3 = "#2c2e33",
    dark_grey_4 = "#4f5258",

    cursorline = "#222428",
    reference = "#292b30",


-- #ff6a6a
-- #ee6363
-- #cd5555
-- #8b3a3a

    red = "#d7ba7d",
    cyan = "#8cf8f7",
    yellow = "#d7ba7d",
    green = "#b3f6c0",
    purple = "#bb99f7",

    light_blue = "#a6dbff",
    light_red = "#ffc0b9",

    visual = "#214a73",
    select = "#03395e",
    match_bg = "#194765",
    match = "#29a9ff",

    hint = "#4bc1fe",
    info = "#FFCC66",
    warn = "#ff8800",
    error = "#F44747",
    other = "#7c3aed",
    hint_bg = "#232e34",
    info_bg = "#342f25",
    warn_bg = "#34291b",
    error_bg = "#332222",

    ui_blue = "#7ccdfd",
    ui_orange = "#e1af69",
    ui_white = "#ffffff",
    ui_purple = "#bb99f7",
    ui_green = "#87ffaf",
  }

  local hl = vim.api.nvim_set_hl

  hl(0, "Function", { fg = c.light_blue, bg = "NONE" })
  hl(0, "Identifier", { fg = c.fg, bg = "NONE" })
  hl(0, "Type", { fg = c.cyan, bg = "NONE" })
  hl(0, "Number", { fg = c.purple, bg = 'NONE' })
  hl(0, "Boolean", { fg = c.purple, bg = 'NONE' })
  -- hl(0, "Exception", { fg = c.red, bg = "NONE" })

  hl(0, "Special", { fg = c.purple, bg = "NONE" })
  hl(0, "Tag", { fg = c.purple, bg = "NONE" })
  hl(0, "@tag.builtin.tsx", { link = 'Tag' })
  hl(0, "@tag.attribute", { fg = c.fg, bg = "NONE" })
  hl(0, "@tag.delimiter", { fg = c.dark_grey_4, bg = "NONE" })
  hl(0, "@type", { link = 'Type' })
  hl(0, "@type.builtin", { link = 'Type' })
  hl(0, "@function.builtin", { link = 'Function' })
  hl(0, "@tag.tsx", { fg = c.cyan, bg = 'NONE' })
  hl(0, "@tag.jsx", { fg = c.cyan, bg = 'NONE' })
  hl(0, "@constructor.lua", { fg = c.fg, bg = 'NONE' })
  hl(0, "@markup.heading", { fg = c.yellow, bg = 'NONE' })


  hl(0, "@keyword.coroutine", { fg = c.red, bg = "NONE" })
  hl(0, "@keyword.return", { fg = c.yellow, bg = "NONE" })

  hl(0, "NormalNC", { fg = c.fg, bg = c.bg })
  hl(0, "Pmenu", { fg = c.fg, bg = c.bg })
  hl(0, "PmenuSel", { fg = "NONE", bg = c.select })
  hl(0, "WildMenu", { fg = c.fg, bg = c.match })
  hl(0, "Directory", { fg = c.fg, bg = "NONE" })
  hl(0, "CursorLine", { fg = "NONE", bg = c.cursorline })

  hl(0, "TabLine", { fg = c.light_gray_3, bg = c.alt_bg })
  hl(0, "TabLineSel", { fg = c.light_grey_3, bg = c.bg })
  hl(0, "TabLineFill", { fg = c.light_grey_3, bg = c.alt_bg })

  hl(0, "FloatBorder", { fg = c.dark_grey_4, bg = c.bg })
  hl(0, "VertSplit", { fg = c.dark_grey_4, bg = c.bg })
  hl(0, "WinSeparator", { fg = c.dark_grey_4, bg = "NONE" })

  hl(0, "NormalFloat", { fg = c.fg, bg = c.bg })
  hl(0, "Visual", { fg = "NONE", bg = c.visual })
  hl(0, "VisualNOS", { fg = "NONE", bg = c.alt_bg })

  hl(0, "MatchWord", { fg = "NONE", bg = c.dark_grey_3 })
  hl(0, "MatchWordCur", { fg = "NONE", bg = c.dark_grey_3 })
  hl(0, "MatchParen", { fg = "NONE", bg = c.visual })
  hl(0, "MatchParenCur", { fg = "NONE", bg = c.visual })

  -- IndentBlankline
  hl(0, "IblIndent", { fg = c.dark_grey_3, bg = "NONE" })
  hl(0, "IblScope", { fg = c.dark_grey_4, bg = "NONE" })

  -- StatusLine
  hl(0, "StatusLine", { fg = c.fg, bg = c.alt_bg })
  hl(0, "StatusLineNC", { fg = c.bg, bg = c.bg })

  -- Winbar
  hl(0, "WinBarNC", { link = "StatusLineNC" })
  hl(0, "WinBar", { fg = c.light_grey_3, bg = c.bg })
  hl(0, "WinBarInactive", { fg = c.light_grey_3, bg = c.bg })

  -- LSP
  -- hl(0, "LspInlayHint", { fg = c.indent_active, bg = "NONE" })
  hl(0, "DiagnosticUnnecessary", { fg = c.light_gray, bg = "NONE" })
  hl(0, "DiagnosticHint", { fg = c.hint, bg = "NONE" })
  hl(0, "DiagnosticInfo", { fg = c.info, bg = "NONE" })
  hl(0, "DiagnosticWarn", { fg = c.warn, bg = "NONE" })
  hl(0, "DiagnosticError", { fg = c.error, bg = "NONE" })
  hl(0, "DiagnosticOther", { fg = c.other, bg = "NONE" })
  hl(0, "DiagnosticSignHint", { link = "DiagnosticHint" })
  hl(0, "DiagnosticSignInfo", { link = "DiagnosticInfo" })
  hl(0, "DiagnosticSignWarn", { link = "DiagnosticWarn" })
  hl(0, "DiagnosticSignError", { link = "DiagnosticError" })
  hl(0, "DiagnosticSignOther", { link = "DiagnosticOther" })
  hl(0, "DiagnosticSignWarning", { link = "DiagnosticWarn" })
  hl(0, "DiagnosticFloatingHint", { link = "DiagnosticHint" })
  hl(0, "DiagnosticFloatingInfo", { link = "DiagnosticInfo" })
  hl(0, "DiagnosticFloatingWarn", { link = "DiagnosticWarn" })
  hl(0, "DiagnosticFloatingError", { link = "DiagnosticError" })
  hl(0, "DiagnosticUnderlineHint", { fg = "NONE", bg = "NONE", sp = c.hint, undercurl = true })
  hl(0, "DiagnosticUnderlineInfo", { fg = "NONE", bg = "NONE", sp = c.info, undercurl = true })
  hl(0, "DiagnosticUnderlineWarn", { fg = "NONE", bg = "NONE", sp = c.warn, undercurl = true })
  hl(0, "DiagnosticUnderlineError", { fg = "NONE", bg = "NONE", sp = c.error, undercurl = true })
  hl(0, "DiagnosticSignInformation", { link = "DiagnosticInfo" })
  hl(0, "DiagnosticVirtualTextHint", { fg = c.hint, bg = c.hint_bg })
  hl(0, "DiagnosticVirtualTextInfo", { fg = c.info, bg = c.info_bg })
  hl(0, "DiagnosticVirtualTextWarn", { fg = c.warn, bg = c.warn_bg })
  hl(0, "DiagnosticVirtualTextError", { fg = c.error, bg = c.error_bg })
  hl(0, "LspDiagnosticsError", { fg = c.error, bg = "NONE" })
  hl(0, "LspDiagnosticsWarning", { fg = c.warn, bg = "NONE" })
  hl(0, "LspDiagnosticsInfo", { fg = c.info, bg = "NONE" })
  hl(0, "LspDiagnosticsInformation", { link = "LspDiagnosticsInfo" })
  hl(0, "LspDiagnosticsHint", { fg = c.hint, bg = "NONE" })
  hl(0, "LspDiagnosticsDefaultError", { link = "LspDiagnosticsError" })
  hl(0, "LspDiagnosticsDefaultWarning", { link = "LspDiagnosticsWarning" })
  hl(0, "LspDiagnosticsDefaultInformation", { link = "LspDiagnosticsInfo" })
  hl(0, "LspDiagnosticsDefaultInfo", { link = "LspDiagnosticsInfo" })
  hl(0, "LspDiagnosticsDefaultHint", { link = "LspDiagnosticsHint" })
  hl(0, "LspDiagnosticsVirtualTextError", { link = "DiagnosticVirtualTextError" })
  hl(0, "LspDiagnosticsVirtualTextWarning", { link = "DiagnosticVirtualTextWarn" })
  hl(0, "LspDiagnosticsVirtualTextInformation", { link = "DiagnosticVirtualTextInfo" })
  hl(0, "LspDiagnosticsVirtualTextInfo", { link = "DiagnosticVirtualTextInfo" })
  hl(0, "LspDiagnosticsVirtualTextHint", { link = "DiagnosticVirtualTextHint" })
  hl(0, "LspDiagnosticsFloatingError", { link = "LspDiagnosticsError" })
  hl(0, "LspDiagnosticsFloatingWarning", { link = "LspDiagnosticsWarning" })
  hl(0, "LspDiagnosticsFloatingInformation", { link = "LspDiagnosticsInfo" })
  hl(0, "LspDiagnosticsFloatingInfo", { link = "LspDiagnosticsInfo" })
  hl(0, "LspDiagnosticsFloatingHint", { link = "LspDiagnosticsHint" })
  hl(0, "LspDiagnosticsSignError", { link = "LspDiagnosticsError" })
  hl(0, "LspDiagnosticsSignWarning", { link = "LspDiagnosticsWarning" })
  hl(0, "LspDiagnosticsSignInformation", { link = "LspDiagnosticsInfo" })
  hl(0, "LspDiagnosticsSignInfo", { link = "LspDiagnosticsInfo" })
  hl(0, "LspDiagnosticsSignHint", { link = "LspDiagnosticsHint" })
  hl(0, "NvimTreeLspDiagnosticsError", { link = "LspDiagnosticsError" })
  hl(0, "NvimTreeLspDiagnosticsWarning", { link = "LspDiagnosticsWarning" })
  hl(0, "NvimTreeLspDiagnosticsInformation", { link = "LspDiagnosticsInfo" })
  hl(0, "NvimTreeLspDiagnosticsInfo", { link = "LspDiagnosticsInfo" })
  hl(0, "NvimTreeLspDiagnosticsHint", { link = "LspDiagnosticsHint" })
  hl(0, "LspDiagnosticsUnderlineError", { link = "DiagnosticUnderlineError" })
  hl(0, "LspDiagnosticsUnderlineWarning", { link = "DiagnosticUnderlineWarn" })
  hl(0, "LspDiagnosticsUnderlineInformation", { link = "DiagnosticUnderlineInfo" })
  hl(0, "LspDiagnosticsUnderlineInfo", { link = "DiagnosticUnderlineInfo" })
  hl(0, "LspDiagnosticsUnderlineHint", { link = "DiagnosticUnderlineHint" })
  hl(0, "IlluminatedWordRead", { fg = "NONE", bg = c.reference })
  hl(0, "IlluminatedWordWrite", { fg = "NONE", bg = c.reference })
  hl(0, "IlluminatedWordText", { fg = "NONE", bg = c.reference })

  -- QuickFix
  hl(0, "QuickFixLine", { link = "PmenuSel" })
  hl(0, "qfSeparator", { fg = c.fg, bg = "NONE" })
  hl(0, "qfFilename", { fg = c.cyan, bg = "NONE" })
  hl(0, "qfLineNr", { fg = c.orange, bg = "NONE" })
  hl(0, "qfError", { link = "Error" })

  -- Bqf
  hl(0, "BqfPreviewBorder", { link = "FloatBorder" })
  hl(0, "BqfPreviewRange", { link = "Visual" })
  hl(0, "BqfSign", { fg = c.yellow, bg = "NONE" })

  -- Eyeliner
  hl(0, "EyelinerPrimary", { fg = "#ff00ff", bg = "NONE", bold = true })
  hl(0, "EyelinerSecondary", { fg = "#00ffff", bg = "NONE", bold = true })

  hl(0, "CopilotSuggestion", { fg = c.light_grey_4, bg = "NONE" })
  hl(0, "CopilotAnnotation", { fg = c.light_grey_4, bg = "NONE" })

  -- Rainbow
  hl(0, "TSRainbowRed", { fg = "#f85149", bg = "NONE" })
  hl(0, "TSRainbowYellow", { fg = "#ffd602", bg = "NONE" })
  hl(0, "TSRainbowBlue", { fg = "#169fff", bg = "NONE" })
  hl(0, "TSRainbowOrange", { fg = "#db6d28", bg = "NONE" })
  hl(0, "TSRainbowGreen", { fg = "#56d364", bg = "NONE" })
  hl(0, "TSRainbowViolet", { fg = "#da70d6", bg = "NONE" })
  hl(0, "TSRainbowCoral", { fg = "#ea6045", bg = "NONE" })
  hl(0, "TSRainbowPink", { fg = "#f778ba", bg = "NONE" })

  -- Cmp
  hl(0, "CmpItemAbbrDeprecated", { fg = c.light_grey_4, bg = "NONE", strikethrough = true })
  hl(0, "CmpItemAbbrMatch", { fg = c.cyan, bg = "NONE" })
  hl(0, "CmpItemAbbrMatchFuzzy", { fg = c.cyan, bg = "NONE" })
  hl(0, "CmpDocumentation", { fg = c.fg, bg = c.alt_bg })
  -- hl(0, "CmpDocumentationBorder", { fg = c.green, bg = c.green })
  hl(0, "CmpItemAbbr", { fg = c.fg, bg = "NONE" })
  hl(0, "CmpItemKindFunction", { fg = c.ui_purple, bg = "NONE" })
  hl(0, "CmpItemKindMethod", { fg = c.ui_purple, bg = "NONE" })
  hl(0, "CmpItemKindConstructor", { fg = c.ui_orange, bg = "NONE" })
  hl(0, "CmpItemKindClass", { fg = c.ui_orange, bg = "NONE" })
  hl(0, "CmpItemKindEnum", { fg = c.ui_orange, bg = "NONE" })
  hl(0, "CmpItemKindEvent", { fg = c.ui_orange, bg = "NONE" })
  hl(0, "CmpItemKindInterface", { fg = c.ui_orange, bg = "NONE" })
  hl(0, "CmpItemKindStruct", { fg = c.ui_orange, bg = "NONE" })
  hl(0, "CmpItemKindVariable", { fg = c.light_blue, bg = "NONE" })
  hl(0, "CmpItemKindField", { fg = c.light_blue, bg = "NONE" })
  hl(0, "CmpItemKindProperty", { fg = c.light_blue, bg = "NONE" })
  hl(0, "CmpItemKindEnumMember", { fg = c.fg, bg = "NONE" })
  hl(0, "CmpItemKindConstant", { fg = c.fg, bg = "NONE" })
  hl(0, "CmpItemKindKeyword", { fg = c.fg, bg = "NONE" })
  hl(0, "CmpItemKindModule", { fg = c.fg, bg = "NONE" })
  hl(0, "CmpItemKindValue", { fg = c.fg, bg = "NONE" })
  hl(0, "CmpItemKindUnit", { fg = c.fg, bg = "NONE" })
  hl(0, "CmpItemKindText", { fg = c.fg, bg = "NONE" })
  hl(0, "CmpItemKindSnippet", { fg = c.fg, bg = "NONE" })
  hl(0, "CmpItemKindFile", { fg = c.fg, bg = "NONE" })
  hl(0, "CmpItemKindFolder", { fg = c.fg, bg = "NONE" })
  hl(0, "CmpItemKindColor", { fg = c.fg, bg = "NONE" })
  hl(0, "CmpItemKindReference", { fg = c.ui_green, bg = "NONE" })
  hl(0, "CmpItemKindOperator", { fg = c.fg, bg = "NONE" })
  hl(0, "CmpItemKindTypeParameter", { fg = c.ui_orange, bg = "NONE" })

  -- Navic
  hl(0, "NavicIconsFile", { link = "CmpItemKindFile" })
  hl(0, "NavicIconsModule", { link = "CmpItemKindModule" })
  hl(0, "NavicIconsNamespace", { link = "CmpItemKindClass" })
  hl(0, "NavicIconsPackage", { link = "CmpItemKindModule" })
  hl(0, "NavicIconsClass", { link = "CmpItemKindClass" })
  hl(0, "NavicIconsMethod", { link = "CmpItemKindMethod" })
  hl(0, "NavicIconsProperty", { link = "CmpItemKindProperty" })
  hl(0, "NavicIconsField", { link = "CmpItemKindField" })
  hl(0, "NavicIconsConstructor", { link = "CmpItemKindConstructor" })
  hl(0, "NavicIconsEnum", { link = "CmpItemKindEnum" })
  hl(0, "NavicIconsInterface", { link = "CmpItemKindInterface" })
  hl(0, "NavicIconsFunction", { link = "CmpItemKindFunction" })
  hl(0, "NavicIconsVariable", { link = "CmpItemKindVariable" })
  hl(0, "NavicIconsConstant", { link = "CmpItemKindConstant" })
  hl(0, "NavicIconsString", { fg = c.blue, bg = "NONE" })
  hl(0, "NavicIconsNumber", { link = "CmpItemKindValue" })
  hl(0, "NavicIconsBoolean", { link = "CmpItemKindValue" })
  hl(0, "NavicIconsArray", { link = "CmpItemKindValue" })
  hl(0, "NavicIconsObject", { link = "CmpItemKindValue" })
  hl(0, "NavicIconsKey", { link = "CmpItemKindValue" })
  hl(0, "NavicIconsNull", { link = "CmpItemKindValue" })
  hl(0, "NavicIconsKeyword", { link = "CmpItemKindKeyword" })
  hl(0, "NavicIconsEnumMember", { link = "CmpItemKindEnumMember" })
  hl(0, "NavicIconsStruct", { link = "CmpItemKindStruct" })
  hl(0, "NavicIconsEvent", { link = "CmpItemKindEvent" })
  hl(0, "NavicIconsOperator", { link = "CmpItemKindOperator" })
  hl(0, "NavicIconsTypeParameter", { link = "CmpItemKindTypeParameter" })
  hl(0, "NavicText", { fg = c.light_grey_3, bg = "NONE" })
  hl(0, "NavicSeparator", { fg = c.light_grey_3, bg = "NONE" })

  -- Telescope
  hl(0, "TelescopeSelection", { fg = "NONE", bg = c.select })
  hl(0, "TelescopeSelectionCaret", { fg = c.ui_blue, bg = c.select })
  hl(0, "TelescopeMatching", { fg = c.match, bg = "NONE", bold = true, italic = true })
end

return M
