
local path_package = vim.fn.stdpath('data') .. '/site/'
local mini_path = path_package .. 'pack/deps/start/mini.nvim'
if not vim.loop.fs_stat(mini_path) then
  vim.cmd('echo "Installing `mini.nvim`" | redraw')
  local clone_cmd = {
    'git', 'clone', '--filter=blob:none',
    'https://github.com/nvim-mini/mini.nvim', mini_path
  }
  vim.fn.system(clone_cmd)
  vim.cmd('packadd mini.nvim | helptags ALL')
  vim.cmd('echo "Installed `mini.nvim`" | redraw')
end

--- Set up 'mini.deps' (customize to your liking)
require('mini.deps').setup({ path = { package = path_package } })
MiniDeps.add({ name = 'mini.nvim', checkout = 'stable' }) 


MiniDeps.add("Bardolomeo/powerofneo.vim")

vim.cmd.colorscheme("POWEROFNEO")
MiniDeps.add('nvim-treesitter/nvim-treesitter', { branch = 'main', lazy=false, build=":TSUpdate"})
MiniDeps.add("nvim-telescope/telescope.nvim")
MiniDeps.add("nvim-lua/plenary.nvim")
MiniDeps.add("kyazdani42/nvim-web-devicons")
MiniDeps.add("pmizio/typescript-tools.nvim")
MiniDeps.add("folke/which-key.nvim")
MiniDeps.add("pocco81/auto-save.nvim")
MiniDeps.add('neovim/nvim-lspconfig')
MiniDeps.add('hrsh7th/cmp-nvim-lsp')
MiniDeps.add('hrsh7th/cmp-buffer')
MiniDeps.add('hrsh7th/cmp-path')
MiniDeps.add('hrsh7th/cmp-cmdline')
MiniDeps.add('hrsh7th/nvim-cmp')
MiniDeps.add('mason-org/mason.nvim')
MiniDeps.add('redoxahmii/react-extract.nvim')
MiniDeps.add('prettier/vim-prettier')
MiniDeps.add('francescarpi/buffon.nvim', {
	 
})

require("mason").setup()
require("nvim-cmp-config")

--- keymap
vim.o.smartcase = true
vim.o.ignorecase = true
vim.o.number = true

vim.o.cursorline = true

--- line number on the left
vim.o.hlsearch = false

--- mantain lines indent on wrap 
vim.o.breakindent = true

--- tab size
vim.o.tabstop = 2
vim.o.shiftwidth = 2

--- netrw options
vim.g.netrw_winsize = 15

--- clipboard keybinding (gy == copy, gp == paste)
vim.keymap.set({'n', 'x'}, 'gy', '"+y')
vim.keymap.set({'n', 'x'}, 'gp', '"+p')

vim.g.mapleader = " "


--- Trouble (Diagnostic)
vim.api.nvim_set_keymap("n","<leader>cs", "<cmd>Trouble symbols toggle focus=false<cr>", { noremap = true,  desc = "Symbols (Trouble)"})
vim.api.nvim_set_keymap("n", "<leader>xl", "<cmd>Trouble lsp toggle focus=false win.position=right<cr>", {noremap = true})

vim.api.nvim_set_keymap('n', '<leader>do', '<cmd>lua vim.diagnostic.open_float()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>d[', '<cmd>lua vim.diagnostic.goto_prev()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>d]', '<cmd>lua vim.diagnostic.goto_next()<CR>', { noremap = true, silent = true })

--- remap ominfunc/auto completion
vim.api.nvim_exec("inoremap <C-Space> <C-x><C-o>", true)
vim.api.nvim_set_keymap("n", '<C-Left>', "<C-w>h", { noremap = true})
vim.api.nvim_set_keymap("n", '<C-Down>', "<C-w>j", { noremap = true})
vim.api.nvim_set_keymap("n", '<C-Right>', "<C-w>l", { noremap = true})
vim.api.nvim_set_keymap("n", '<C-Up>', "<C-w>k", { noremap = true})

-- The following command requires plug-ins "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim", and optionally "kyazdani42/nvim-web-devicons" for icon support
vim.api.nvim_set_keymap('n', '<leader>dd', '<cmd>Telescope diagnostics<CR>', { noremap = true, silent = true })

--- telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })


-- lsp
vim.keymap.set("n", "<leader>gD", vim.lsp.buf.declaration, { buffer = bufnr, desc = "Go to Declaration" })
vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, { buffer = bufnr, desc = "Go to Definition" })
vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = bufnr, desc = "LSP Hover" })
vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { buffer = bufnr, desc = "Go to Implementation" })
vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, { buffer = bufnr, desc = "Signature Help" })
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { buffer = bufnr, desc = "Rename Symbol" })
vim.keymap.set("n", "<leader>rr", vim.lsp.buf.references, { buffer = bufnr, desc = "Symbol References" })
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { buffer = bufnr, desc = "Code Action" })
vim.keymap.set("n", "e[", vim.diagnostic.goto_prev, { buffer = bufnr, desc = "Go to Next Diagnostic" })
vim.keymap.set("n", "gl", vim.diagnostic.open_float, { buffer = bufnr, desc = "Open Diagnostic Float" })
vim.keymap.set("n", "e]", vim.diagnostic.goto_next, { buffer = bufnr, desc = "Go to Previous Diagnostic" })
vim.keymap.set("n", "<leader>q", ":q<CR>", {noremap = true})


--- react-extract
vim.keymap.set({ "v" }, "<leader>re", require("react-extract").extract_to_new_file, {noremap = true})
vim.keymap.set({ "v" }, "<leader>rc", require("react-extract").extract_to_current_file, {noremap = true})


---line number colors
vim.api.nvim_set_hl(0, 'LineNr', { fg='#555000' })

--- Lexplore/netrw
  
vim.api.nvim_set_keymap("n", '<leader><leader>', ':let g:netrw_winsize = 15<CR>:Lexplore<CR>', {noremap = true})


	vim.api.nvim_exec(
	[[
	" Better code indentation
	filetype plugin indent on

	" Explorer is closed by default
	let g:NetrwIsOpen=0

	" Disable top information
	let g:netrw_banner = 0

	" Use nested tree style explorer
	let g:netrw_liststyle = 3

	" Explorer takes up 25% of screen
	let g:netrw_winsize = 25

	function! ToggleNetrw()
			if g:NetrwIsOpen
					let i = bufnr("$")
					while (i >= 1)
							if (getbufvar(i, "&filetype") == "netrw")
									silent exe "bwipeout " . i 
							endif
							let i-=1
					endwhile
					let g:NetrwIsOpen=0
			else
					let g:NetrwIsOpen=1
					silent Lexplore!
			endif
	endfunction
	]],
	true
	)

	require("typescript-tools").setup {
  settings = {
       tsserver_plugins = {
      -- for TypeScript v4.9+
      "@styled/typescript-styled-plugin",
      -- or for older TypeScript versions
      -- "typescript-styled-plugin",
    },
  },
}
