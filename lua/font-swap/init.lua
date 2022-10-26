local M = {}

local fonts = {}
local numFonts = 0
local fontIndex = 1

local function getLen(arr)
  local len = 0
  for _ in pairs(arr) do len = len + 1 end
  return len
end

M.setup = function(args)
  if (args.fonts ~= nil) then
    fonts = args.fonts
    numFonts = getLen(fonts)
  end
end

M.fontIndexIncrement = function()
  fontIndex = fontIndex + 1
  if (fontIndex > numFonts) then
    fontIndex = 1
  end
  vim.opt["guifont"] = fonts[fontIndex]
end

M.fontIndexDecrement = function()
  fontIndex = fontIndex - 1
  if (fontIndex <= 0) then
    fontIndex = numFonts
  end
  vim.opt["guifont"] = fonts[fontIndex]
end

M.fontSizeIncrement = function() end

M.fontSizeDecrement = function() end

return M
