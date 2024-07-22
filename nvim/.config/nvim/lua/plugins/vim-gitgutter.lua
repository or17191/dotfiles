return {
	{
		"airblade/vim-gitgutter",
		config = function()
			vim.g.gitgutter_sign_removed_first_line = "^_"
		end,
	},
}
