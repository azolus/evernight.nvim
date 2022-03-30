local utils = require("evernight.utils")
local theme = require("evernight.theme")

local M = {}

function M.colorscheme()
  utils.load(theme.setup())
end

return M
