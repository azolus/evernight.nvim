local utils = {}

-- Highlight
function utils.highlight(group, props)
  local bg = props.bg == nil and "guibg=NONE" or "guibg=" .. props.bg
  local fg = props.fg == nil and "guifg=NONE" or "guifg=" .. props.fg
  local sp = props.sp == nil and "" or "guisp=" .. props.sp
  local style = props.style == nil and "gui=NONE" or "gui=" .. props.style

  local hl = "highlight " .. group .. " " .. style .. " " .. fg .. " " .. bg .. " " .. sp

  if props.link then
    vim.cmd("highlight! link " .. group .. " " .. props.link)
  end

  vim.cmd(hl)
end

-- Syntax highlightings
function utils.syntax(syntax)
  for group, props in pairs(syntax) do
    utils.highlight(group, props)
  end
end

-- Terminal colors
function utils.term(colors)
  -- dark
  vim.g.terminal_color_0 = colors.gray0
  vim.g.terminal_color_8 = colors.gray2

  -- light
  vim.g.terminal_color_7 = colors.fgd
  vim.g.terminal_color_15 = colors.fg

  -- colors
  vim.g.terminal_color_1 = colors.red
  vim.g.terminal_color_9 = colors.red

  vim.g.terminal_color_2 = colors.green
  vim.g.terminal_color_10 = colors.green

  vim.g.terminal_color_3 = colors.yellow
  vim.g.terminal_color_11 = colors.yellow

  vim.g.terminal_color_4 = colors.blue
  vim.g.terminal_color_12 = colors.blue

  vim.g.terminal_color_5 = colors.magenta
  vim.g.terminal_color_13 = colors.magenta

  vim.g.terminal_color_6 = colors.cyan
  vim.g.terminal_color_14 = colors.cyan
end

-- Load theme
function utils.load(theme)
  if vim.g.colors_name then
    vim.cmd("hi clear")
  end

  vim.o.termguicolors = true
  vim.g.colors_name = "evernight"
  utils.syntax(theme.base)
  utils.syntax(theme.plugins)
  utils.term(theme.colors)

  vim.defer_fn(function()
    utils.syntax(theme.defer)
  end, 100)
end

return utils
