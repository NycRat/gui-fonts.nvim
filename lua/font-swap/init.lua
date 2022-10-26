local M = {}

local fonts = {}
local numFonts = 0
local fontIndex = 1
local fontSize = 0

local function getLen(arr)
  local len = 0
  for _ in pairs(arr) do len = len + 1 end
  return len
end

local function getFontSize(font)
  local haha = false
  local haha2 = false
  local size = 0
  for c in font:gmatch "." do
    if (haha2) then
      size = size * 10
      size = size + tonumber(c)
    end

    if (haha) then
      if (c == "h") then
        haha2 = true
      else
        haha = false
      end
    end
    if (c == ":") then haha = true end
  end
  return size
end

local function updateGuiFont()
  if (fonts[fontIndex] ~= nil) then
    vim.opt["guifont"] = fonts[fontIndex] .. ":h" ..
                             tostring(getFontSize(fonts[fontIndex]) + fontSize)
  end
end

M.setup = function(args)
  if (args.fonts ~= nil) then
    fonts = args.fonts
    numFonts = getLen(fonts)
  end
end

M.fontIndexIncrement = function()
  fontIndex = fontIndex + 1
  if (fontIndex > numFonts) then fontIndex = 1 end
  updateGuiFont()
end

M.fontIndexDecrement = function()
  fontIndex = fontIndex - 1
  if (fontIndex <= 0) then fontIndex = numFonts end
  updateGuiFont()
end

M.fontSizeIncrement = function()
  if (fontSize <= 10) then
    fontSize = fontSize + 1
    updateGuiFont()
  end
end

M.fontSizeDecrement = function()
  if (fontSize >= -10) then -- make variable in setup
    fontSize = fontSize - 1
    updateGuiFont()
  end
end

return M
