return {
	{
		"w0rp/ale",
		config = function()
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
				sh = { "shfmt" },
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
			vim.g.ale_sh_shfmt_options = "-i 2"
			vim.g.ale_hover_cursor = 0

			vim.api.nvim_set_keymap("n", "<leader>f", ":ALEFix<cr>", { noremap = true, silent = true })
			vim.api.nvim_set_keymap("n", "<leader>h", ":ALEHover<cr>", { noremap = true, silent = true })
			vim.api.nvim_set_keymap("n", "<leader>d", ":ALEDetail<cr>", { noremap = true, silent = true })
			vim.api.nvim_set_keymap("n", "<leader>p", ":ALEPreviousWrap<cr>", { noremap = true, silent = true })
			vim.api.nvim_set_keymap("n", "<leader>n", ":ALENextWrap<cr>", { noremap = true, silent = true })
		end,
	},
}
