---@class colors
local colors = {}

---@type colors
local defaults = {
    fg = "#d3b58d",
    bg = "#072626",
    bglighten = "#0a3636",
    gray = "#676e7b",
    pink = "#ffc0cb",
    green = "#98c379",
    cyan = "#0fdfaf",
    greenlight = "#90ee90",
    seagreen = "#79ffcf",
    limegreen = "#3fdf1f",
    lightblue = "#c8d4ec",
    -- lightblue = "#b8e2f4",
    aqua = "#61afef",
    blue = "#0000ff",
    yellow = "#f8fe7a",
    purple = "#ce95b8",
    peanut = "#f5d5a4",
    orange = "#d19a66",
    dark_pink = "#ff008c",
    palevioletred2 = "#ee799f",
    brown4 = "#8b2323",
    dark_cyan = "#2b8db3",
    red = "#f75f5f",
    dark_red = "#d03770",
    white = "#fff8dc",
    light_gray = "#9ca3b2",
    dark_gray = "#4b5261",
    vulcan = "#383a3e",
    dark_green = "#2d2e27",
    dark_blue = "#26292f",
    black = "#1e2024",
    none = "NONE",
}

colors = vim.deepcopy(defaults)

---Convert hex value to rgb
---@param color string
local function hex2rgb(color)
    color = string.lower(color)

    return {
        tonumber(color:sub(2, 3), 16),
        tonumber(color:sub(4, 5), 16),
        tonumber(color:sub(6, 7), 16),
    }
end

---@param fg string #foreground color
---@param bg string #background color
---@param alpha number #number between 0 and 1.
---@source: https://github.com/folke/tokyonight.nvim/blob/main/lua/tokyonight/util.lua#L9-L37
local function blend(fg, bg, alpha)
    local bg_rgb = hex2rgb(bg)
    local fg_rgb = hex2rgb(fg)

    local blend_channel = function(i)
        local ret = (alpha * fg_rgb[i] + ((1 - alpha) * bg_rgb[i]))

        return math.floor(math.min(math.max(0, ret), 255) + 0.5)
    end

    return ("#%02x%02x%02x"):format(blend_channel(1), blend_channel(2), blend_channel(3))
end

---@param alpha number #number between 0 and 1
function string:darken(alpha)
    return blend(self, "#000000", alpha)
end

---@param alpha number #number between 0 and 1
function string:lighten(alpha)
    return blend(self, "#ffffff", alpha)
end

---Get the hex value of a color
---@param name string #name of the color
---@param value any #value of the color
---@return string? #hex string or `nil` if invalid
local function get_hex_value(name, value)
    local logs = require "greenlight.logs"

    local type_ok, err = pcall(vim.validate, {
        ["colors(" .. name .. ")"] = { value, "string" },
    })

    if not type_ok then
        logs.error.notify(err)

        return defaults[name]
    end

    if value:lower() == "none" then
        return value
    end

    local rgb = vim.api.nvim_get_color_by_name(value)

    if rgb == -1 then
        logs.error.notify("colors(%s): %q is not a valid color", name, value)

        return defaults[name]
    end

    return ("#%06x"):format(rgb)
end

local config = require "greenlight.config"

for name, value in pairs(config.colors) do
    colors[name] = get_hex_value(name, value)
end

return colors
