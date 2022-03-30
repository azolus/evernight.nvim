local config = require("evernight.config")
local colors = require("evernight.colors").setup(config)

local evernight = {}

evernight.normal = {
  a = { bg = colors.blue, fg = colors.bg },
  b = { bg = colors.bg2, fg = colors.blue },
  c = { bg = colors.bg1, fg = colors.fgd },
}

evernight.insert = {
  a = { bg = colors.green, fg = colors.bg },
  b = { bg = colors.bg2, fg = colors.green },
}

evernight.command = {
  a = { bg = colors.yellow, fg = colors.bg },
  b = { bg = colors.bg2, fg = colors.yellow },
}

evernight.visual = {
  a = { bg = colors.magenta, fg = colors.bg },
  b = { bg = colors.bg2, fg = colors.magenta },
}

evernight.replace = {
  a = { bg = colors.red, fg = colors.black },
  b = { bg = colors.bg2, fg = colors.red },
}

evernight.inactive = {
  a = { bg = colors.bg1, fg = colors.blue },
  b = { bg = colors.bg1, fg = colors.bg2, gui = "bold" },
  c = { bg = colors.bg1, fg = colors.bg2 },
}

return evernight
