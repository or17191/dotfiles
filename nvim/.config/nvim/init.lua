-- Vimplug setup
local vimplugpath = vim.fn.stdpath("config") .. "/autoload/plug.vim"
if not vim.loop.fs_stat(vimplugpath) then
	vim.fn.system({
		"curl",
		"-fLo",
		vimplugpath,
		"https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim",
		"--create-dirs",
	})
end
vim.opt.rtp:prepend(vimplugpath)

vim.call("plug#begin", vim.fn.stdpath("data") .. "/plugged")

local Plug = vim.fn["plug#"]

Plug("lervag/vimtex")
Plug("airblade/vim-gitgutter")
Plug("w0rp/ale")
Plug("dracula/vim", { as = "dracula" })
Plug("ervandew/ag")
Plug("junegunn/fzf", { dir = "~/.fzf", ["do"] = "./install --all" })
Plug("junegunn/fzf.vim")
Plug("tpope/vim-fugitive", { as = "fugitive" })
Plug("tpope/vim-abolish", { as = "abolish" })

vim.call("plug#end")

-- General settings
vim.cmd.filetype("plugin indent on")
vim.cmd.syntax("on")
vim.cmd.colorscheme("dracula")

vim.opt.tabpagemax = 100
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.smartindent = true
vim.opt.number = true
vim.opt.colorcolumn = "80"
vim.filetype.add({
	extension = {
		i = "cpp",
		inc = "cpp",
		md = "markdown",
		tikz = "tex",
	},
})

-- ALE specific settings
vim.opt.completeopt:append("menuone", "noinsert")
vim.opt.omnifunc = "ale#completion#OmniFunc"
vim.g.ale_cpp_clangtidy_checks = {
	"*",
	"-fuchsia-*",
	"-google-build-using-namespace",
	"-google-runtime-references",
	"-llvm-header-guard",
	"-clang-diagnostic-c++17-extensions",
}
vim.g.ale_c_build_dir_names = { "build" }
vim.g.ale_completion_enabled = 1
vim.g.ale_fixers = {
	cpp = { "clang-format" },
	python = { "trim_whitespace", "black", "isort" },
	json = { "fixjson" },
	javascript = { "eslint" },
	html = { "tidy" },
	tex = { "latexindent", "textlint", "trim_whitespace" },
	bib = { "bibclean" },
	rust = { "rustfmt" },
	go = { "gofumpt", "goimports", "golines" },
	cmake = { "cmakeformat" },
	lua = { "stylua" },
	zsh = { "shfmt" },
	yaml = { "prettier" },
}
vim.g.ale_linters = {
	cpp = { "clangtidy", "clangd", "gcc", "flawfinder" },
	python = { "pylsp", "mypy", "flake8" },
	go = { "gopls", "golint", "go", "goimports" },
	tex = { "texlab", "proselint", "textlint", "writegood", "chktex", "lacheck" },
	rust = { "rls", "rustc" },
	markdown = { "writegood" },
	cmake = { "cmakelint" },
	sh = { "shellcheck" },
}
vim.g.ale_writegood_options = "--no-passive --no-adverb --no-tooWordy"
vim.g.ale_rust_rustfmt_options = "--edition 2018"
vim.g.ale_hover_cursor = 0

vim.api.nvim_set_keymap("n", "<leader>f", ":ALEFix<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>h", ":ALEHover<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>d", ":ALEDetail<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>p", ":ALEPreviousWrap<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>n", ":ALENextWrap<cr>", { noremap = true, silent = true })

-- Other settings
vim.g.gitgutter_sign_removed_first_line = "^_"
