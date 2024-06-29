return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.6",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("telescope").setup({
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({}),
					},
					import = {
						-- Add imports to the top of the file keeping the cursor in place
						insert_at_top = true,
						-- Support additional languages
						custom_languages = {
							{
								-- The regex pattern for the import statement
								regex = [[^(?:import(?:[\"'\s]*([\w*{}\n, ]+)from\s*)?[\"'\s](.*?)[\"'\s].*)]],
								-- The Vim filetypes
								filetypes = { "typescript", "typescriptreact", "javascript", "react" },
								-- The filetypes that ripgrep supports (find these via `rg --type-list`)
								extensions = { "js", "ts" },
							},
						},
					},
				},
			})

			local builtin = require("telescope.builtin")
			vim.keymap.set("n", "<C-p>", function()
				-- Include hidden files except for .git
				builtin.find_files({ find_command = { "rg", "--files", "--hidden", "-g", "!.git" } })
			end, {})
			vim.keymap.set("n", "<leader>fg", function()
				-- Include hidden files except for .git
				builtin.live_grep({
					additional_args = function(opts)
						return { "--hidden", "--glob", "!.git/*" }
					end,
				})
			end, {})
			vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
			vim.keymap.set("n", "<leader>fd", builtin.diagnostics, {})
			vim.keymap.set("n", "<leader>gc", builtin.git_commits, {})
			vim.keymap.set("n", "<leader>gb", builtin.git_branches, {})
			vim.keymap.set("n", "<leader>gs", builtin.git_status, {})
		end,
	},
	{
		"nvim-telescope/telescope-ui-select.nvim",
		config = function()
			require("telescope").setup({
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({}),
					},
				},
			})
			require("telescope").load_extension("ui-select")
		end,
	},
}
