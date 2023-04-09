require("temple")

-- Cheatsheet
local cs = vim.fn.stdpath "config" .. "/cs.txt"
vim.keymap.set("n", "<leader>cs", ":e " .. cs .. "<cr>")
