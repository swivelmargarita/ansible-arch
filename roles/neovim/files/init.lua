--
vim.opt.clipboard = "unnamedplus"               -- allows neovim to access the system clipboard
vim.opt.completeopt = { "menuone", "noselect" } -- mostly just for cmp
vim.opt.cursorline = true                       -- highlight the current line
vim.opt.expandtab = true                        -- convert tabs to spaces
vim.opt.fileencoding = "utf-8"                  -- the encoding written to a file
vim.opt.incsearch = true                      
vim.opt.mouse = "a"                             -- allow the mouse to be used in neovim
vim.opt.number = true                           -- set numbered lines
vim.opt.numberwidth = 2                         -- set number column width to 2 {default 4}
vim.opt.relativenumber = true                  -- set relative numbered lines
vim.opt.scrolloff = 8                           -- start scrolling when 8 lines left to bottom or top
vim.opt.shada = "'1000,f1,<500"
vim.opt.shiftwidth = 4                          -- the number of spaces inserted for each indentation
vim.opt.shortmess:append "c"
vim.opt.showmode = false                        -- we don't need to see things like -- INSERT -- anymore
vim.opt.showtabline = 2                         -- always show tabs
vim.opt.sidescroll = 8
vim.opt.sidescrolloff = 8
vim.opt.signcolumn = "number"                    -- always show the sign column, otherwise it would shift the text each time
vim.opt.smartcase = true                        -- smart case
vim.opt.smartindent = true                      -- make indenting smarter again
vim.opt.splitbelow = true                       -- force all horizontal splits to go below current window
vim.opt.splitright = true                       -- force all vertical splits to go to the right of current window
vim.opt.tabstop = 4                             -- insert 4 spaces for a tab
vim.opt.termguicolors = true                    -- set term gui colors (most terminals support this)
vim.opt.undofile = true                         -- enable persistent undo
vim.opt.updatetime = 1500                        -- faster completion (4000ms default)
vim.opt.wrap = false                            -- display lines as one long line

vim.cmd "set whichwrap+=<,>,[,]"                -- When left or right key is pressed it jumps to the ending or beginning of the next line respectively
