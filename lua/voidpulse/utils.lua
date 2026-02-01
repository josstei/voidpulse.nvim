local M = {}

function M.highlight(group, opts)
  if opts.link then
    vim.api.nvim_set_hl(0, group, { link = opts.link })
    return
  end

  local hl = {}

  if opts.fg then hl.fg = opts.fg end
  if opts.bg then hl.bg = opts.bg end
  if opts.sp then hl.sp = opts.sp end

  if opts.bold then hl.bold = true end
  if opts.italic then hl.italic = true end
  if opts.underline then hl.underline = true end
  if opts.undercurl then hl.undercurl = true end
  if opts.strikethrough then hl.strikethrough = true end

  vim.api.nvim_set_hl(0, group, hl)
end

function M.apply_highlights(groups)
  for group, opts in pairs(groups) do
    M.highlight(group, opts)
  end
end

local function normalize_hex(hex)
  if type(hex) ~= "string" then
    return nil
  end

  local stripped = hex:gsub("^#", "")
  if #stripped ~= 6 or stripped:find("[^0-9a-fA-F]") then
    return nil
  end

  return "#" .. stripped:lower()
end

local function clamp(value, min, max)
  if value < min then
    return min
  end
  if value > max then
    return max
  end
  return value
end

local function hex_to_rgb(hex)
  hex = hex:gsub("#", "")
  return tonumber(hex:sub(1, 2), 16),
         tonumber(hex:sub(3, 4), 16),
         tonumber(hex:sub(5, 6), 16)
end

local function rgb_to_hex(r, g, b)
  return string.format("#%02x%02x%02x",
    math.floor(math.min(255, math.max(0, r))),
    math.floor(math.min(255, math.max(0, g))),
    math.floor(math.min(255, math.max(0, b)))
  )
end

function M.darken(hex, amount)
  local normalized = normalize_hex(hex)
  if not normalized then
    return hex
  end
  if type(amount) ~= "number" then
    return normalized
  end

  amount = clamp(amount, 0, 100)
  local r, g, b = hex_to_rgb(normalized)
  local factor = (100 - amount) / 100
  return rgb_to_hex(r * factor, g * factor, b * factor)
end

function M.lighten(hex, amount)
  local normalized = normalize_hex(hex)
  if not normalized then
    return hex
  end
  if type(amount) ~= "number" then
    return normalized
  end

  amount = clamp(amount, 0, 100)
  local r, g, b = hex_to_rgb(normalized)
  local factor = amount / 100
  return rgb_to_hex(
    r + (255 - r) * factor,
    g + (255 - g) * factor,
    b + (255 - b) * factor
  )
end

function M.blend(hex1, hex2, alpha)
  local normalized1 = normalize_hex(hex1)
  local normalized2 = normalize_hex(hex2)
  if not normalized1 or not normalized2 then
    return normalized1 or normalized2 or hex1
  end
  if type(alpha) ~= "number" then
    return normalized1
  end

  alpha = clamp(alpha, 0, 1)
  local r1, g1, b1 = hex_to_rgb(normalized1)
  local r2, g2, b2 = hex_to_rgb(normalized2)
  return rgb_to_hex(
    r1 * (1 - alpha) + r2 * alpha,
    g1 * (1 - alpha) + g2 * alpha,
    b1 * (1 - alpha) + b2 * alpha
  )
end

return M
