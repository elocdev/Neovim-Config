local opts = { noremap = true, silent = true }

local keymap = vim.keymap.set

-- Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Navigate Buffers
keymap("n", "<Tab>", ":bnext<CR>", opts)
keymap("n", "<S-Tab>", ":bprevious<CR>", opts)
keymap("n", "X", ":Bdelete<CR>", opts)
keymap("n", "<leader>o", "<C-w>w", opts)

-- Tmux navigation
keymap("n", "<C-h>", ":TmuxNavigateLeft<CR>", opts)
keymap("n", "<C-l>", ":TmuxNavigateRight<CR>", opts)
keymap("n", "<C-j>", ":TmuxNavigateDown<CR>", opts)
keymap("n", "<C-k>", ":TmuxNavigateUp<CR>", opts)

-- Front and End of the line navigation
keymap("n", "H", "_", opts)
keymap("n", "L", "$", opts)

-- NvimTreeToggle
keymap("n", "<leader>e", ":NvimTreeToggle<CR>", opts)

-- Keymap for undotree
keymap("n", "<leader>u", ":UndotreeToggle<CR>", opts)

-- Moving highlighted lines in visual mode
keymap("v", "J", ":m '>+1<CR>gv=gv", opts)
keymap("v", "K", ":m '<-2<CR>gv=gv", opts)

-- Remaps to move down or up half page and center cursor
keymap("n", "<C-d>", "<C-d>zz")
keymap("n", "<C-u>", "<C-u>zz")

-- Copy and Paste Keymaps
keymap({ "n", "v" }, "<leader>y", [["+y]], opts)
keymap("n", "<leader>Y", [["+Y]], opts)
keymap({ "n", "v" }, "<leader>d", [["_d]], opts)
keymap("x", "<leader>p", [["_dP]])

-- Manual Format keymap in case you want to format before saving
keymap("n", "<leader>fm", function()
	vim.lsp.buf.format()
end)

-- Making a file an executable
keymap("n", "<leader>cx", "<cmd>!chmod +x %<CR>", opts)

-- Trouble.nvim keymaps
keymap("n", "<leader>xt", "<cmd>TroubleToggle<cr>", opts)
keymap("n", "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>", opts)
keymap("n", "<leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>", opts)
keymap("n", "<leader>xq", "<cmd>TroubleToggle quickfix<cr>", opts)
keymap("n", "gR", "<cmd>TroubleToggle lsp_references<cr>", opts)

-- so command
keymap("n", "<leader><leader>", ":so<CR>", opts)

-- replacing word highlighted by cursor
keymap("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Commenting remaps
keymap("n", "<leader>/", function()
	require("Comment.api").toggle.linewise.current()
end)

keymap("i", "jk", "<Esc>")
