-----------------------------------
-- Global
-----------------------------------

vim.opt.number = true
vim.opt.relativenumber = true

-----------------------------------
-- Indenting Source Code
-----------------------------------

vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.tabstop = 2

-----------------------------------
-- Search
-----------------------------------

vim.opt.hlsearch = false
vim.opt.ignorecase = true
vim.opt.smartcase = true

-----------------------------------
-- Accessing The System Clipboard
-----------------------------------

vim.opt.clipboard = "unnamedplus"

-----------------------------------
-- Misc
-----------------------------------

vim.opt.linebreak = true
vim.opt.showmatch = true
vim.opt.wrap = false

-----------------------------------
-- C/C++
-----------------------------------
vim.cmd("autocmd FileType c,cpp map <buffer> <Leader><leader> :!clang-format -i %:p <CR>")

vim.cmd(
    "autocmd FileType c map <buffer> <Leader>/ :!gcc -fno-omit-frame-pointer -fsanitize=address -fsanitize=undefined -ggdb -O0 -pedantic -std=gnu17 -Wall -Wconversion -Wextra -Wno-unused-parameter -Wshadow % -o %:r.out <CR>"
)

vim.cmd(
    "autocmd FileType cpp map <buffer> <Leader>/ :!g++ -fno-omit-frame-pointer -fsanitize=address -fsanitize=undefined -ggdb -O0 -pedantic -std=gnu++17 -Wall -Wconversion -Wextra -Wno-unused-parameter -Wshadow % -o %:r.out <CR>"
)

