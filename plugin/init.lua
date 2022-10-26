local stuff = require("font-swap")

vim.api.nvim_create_user_command("FontIndexIncrement", function ()
  stuff.fontIndexIncrement()
end, {})

vim.api.nvim_create_user_command("FontIndexDecrement", function ()
  stuff.fontIndexDecrement()
end, {})
