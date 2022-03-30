local M = {}

M["storm"] = {
  bg = "#21272c",
  bg0 = "#2b3339",
  bg1 = "#323c41",
  bg2 = "#445055",
  bgv = "#503946",
  bgr = "#4e3e43",
  bgg = "#404d44",
  bgb = "#394f5a",
  bgy = "#4a4940",
  fg = "#d3c6aa",
  fgl = "#e5ddcd",
  fgd = "#c2b089",
  red = "#e67e80",
  orange = "#e69875",
  yellow = "#dbbc7f",
  green = "#a7c080",
  teal = "#83c092",
  cyan = "#7fbbb3",
  blue = "#83a6c0",
  magenta = "#d699b6",
  purple = "#9b99d6",
  gray0 = "#7a8478",
  gray1 = "#859289",
  gray2 = "#9da9a0",
  git = {
    add = "#83c092",
    change = "#a7c080",
    conflict = "#e69875",
    delete = "#e67e80",
    text = "#83a6c0",
  },
  error = "#e67e80",
  warning = "#dbbc7f",
  info = "#a7c080",
  hint = "#7fbbb3",
  comment = "#7a8478",
}

M["night"] = {
  bg = "#2b3339",
  bg0 = "#323c41",
  bg1 = "#445055",
  bg2 = "#445055",
  bgv = "#503946",
  bgr = "#4e3e43",
  bgg = "#404d44",
  bgb = "#394f5a",
  bgy = "#4a4940",
  fg = "#d3c6aa",
  fgl = "#e5ddcd",
  fgd = "#c2b089",
  red = "#e67e80",
  orange = "#e69875",
  yellow = "#dbbc7f",
  green = "#a7c080",
  teal = "#83c092",
  cyan = "#7fbbb3",
  blue = "#83a6c0",
  magenta = "#d699b6",
  purple = "#9b99d6",
  gray0 = "#7a8478",
  gray1 = "#859289",
  gray2 = "#9da9a0",
  git = {
    add = "#83c092",
    change = "#a7c080",
    conflict = "#e69875",
    delete = "#e67e80",
    text = "#83a6c0",
  },
  error = "#e67e80",
  warning = "#dbbc7f",
  info = "#a7c080",
  hint = "#7fbbb3",
  comment = "#7a8478",
}

M["day"] = {
  bg = "#fff9e8",
  bg0 = "#f0eed9",
  bg1 = "#e1ddcb",
  bg2 = "#bec5b2",
  bgv = "#edf0cd",
  bgr = "#fce5dc",
  bgg = "#f1f3d4",
  bgb = "#eaf2eb",
  bgy = "#fbefd0",
  fg = "#5c6a72",
  fgl = "#394247",
  fgd = "#71838e",
  red = "#f85552",
  orange = "#f57d26",
  yellow = "#dfa000",
  green = "#8da101",
  teal = "#35a77c",
  cyan = "#4f968d",
  blue = "#3a94c5",
  magenta = "#df69ba",
  purple = "#5e5bbe",
  gray0 = "#a6b0a0",
  gray1 = "#939f91",
  gray2 = "#829181",
  git = {
    add = "#35a77c",
    change = "#8da101",
    conflict = "#f57d26",
    delete = "#f85552",
    text = "#3a94c5",
  },
  error = "#f85552",
  warning = "#dfa000",
  info = "#8da101",
  hint = "#4f968d",
  comment = "#a6b0a0",
}

function M.setup(config)
  local style = config.style
  return M[style]
end

return M