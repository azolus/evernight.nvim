local config = require("evernight.config")
local colors = require("evernight.colors").setup(config)

local evernight = {}

evernight.normal = {
  left = { { colors.gray0, colors.blue }, { colors.blue, colors.bg2 } },
  middle = { { colors.fg, colors.bg1 } },
  right = { { colors.gray0, colors.blue }, { colors.blue, colors.bg2 } },
  error = { { colors.gray0, colors.error } },
  warning = { { colors.gray0, colors.warning } },
}

evernight.insert = {
  left = { { colors.gray0, colors.green }, { colors.blue, colors.bg } },
}

evernight.visual = {
  left = { { colors.gray0, colors.magenta }, { colors.blue, colors.bg } },
}

evernight.replace = {
  left = { { colors.gray0, colors.red }, { colors.blue, colors.bg } },
}

evernight.inactive = {
  left = { { colors.blue, colors.bg1 }, { colors.gray1, colors.bg } },
  middle = { { colors.bg2, colors.bg1 } },
  right = { { colors.bg2, colors.bg1 }, { colors.gray1, colors.bg } },
}

evernight.tabline = {
  left = { { colors.gray1, colors.bg1 }, { colors.gray1, colors.bg } },
  middle = { { colors.bg2, colors.bg1 } },
  right = { { colors.bg2, colors.bg1 }, { colors.gray1, colors.bg } },
  tabsel = { { colors.blue, colors.bg2 }, { colors.gray1, colors.bg } },
}

return evernight
