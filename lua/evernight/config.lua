local config = {}

vim = vim or { g = {}, o = {} }

local function opt(key, default)
  key = "evernight_" .. key

  if vim.g[key] == nil then
    return default
  end

  if vim.g[key] == 0 then
    return false
  end

  return vim.g[key]
end

config = {
  style = opt("style", "night"),
  transparent = opt("transparent", false),
  commentStyle = opt("italic_comments", true) and "italic" or "NONE",
  keywordStyle = opt("italic_keywords", true) and "italic" or "NONE",
  functionStyle = opt("italic_functions", false) and "italic" or "NONE",
  variableStyle = opt("italic_variables", false) and "italic" or "NONE",
}

if config.style == "day" then
  vim.o.background = "light"
end

return config
