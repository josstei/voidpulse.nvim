-- Color palette definition
local M = {}

M.palette = {
  -- Deep ominous backgrounds
  bg0      = "#0D1126", -- Primary deep background (darker)
  bg1      = "#141A35", -- Slightly lighter
  bg2      = "#1B2142", -- Medium background
  bg3      = "#222850", -- Selection/highlight background
  bg4      = "#2A305E", -- Lighter UI elements
  bg_dark  = "#09091F", -- Darker than bg0 for depth
  bg_float = "#111729", -- Floating windows
  
  -- Vibrant radioactive foregrounds
  fg0      = "#F8F8FF", -- Primary text (ghost white)
  fg1      = "#DCD6FF", -- Secondary text
  fg2      = "#B5AFFF", -- Tertiary text (comments, line numbers)
  fg3      = "#9B94E6", -- Disabled text
  
  -- Core vibrant colors
  blue     = "#82AAFF", -- Electric blue
  cyan     = "#5FFFD3", -- Neon cyan
  teal     = "#00F5C5", -- Radioactive teal
  green    = "#A4FFB0", -- Toxic green
  
  yellow   = "#FFEA70", -- Electric yellow
  orange   = "#FFB86C", -- Vibrant orange
  red      = "#FF6C91", -- Hot pink red
  pink     = "#FF3CCF", -- Neon pink
  magenta  = "#C85CFF", -- Electric magenta
  purple   = "#A97CFF", -- Bright purple
  
  -- Additional specialized colors
  violet   = "#9D7CD8", -- Softer violet
  lime     = "#9ECE6A", -- Lime green
  gold     = "#E0AF68", -- Golden yellow
  crimson  = "#F7768E", -- Crimson red
  aqua     = "#73DACA", -- Aqua blue
  coral    = "#FF9E64", -- Coral orange
  
  -- UI specific colors
  border   = "#2A305E",
  none     = "NONE",
}

return M
