return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("lualine").setup({
			options = {
				theme = "catppuccin",
				-- section_separators = { "", "" },
				-- component_separators = { "", "" },
				disabled_filetypes = { "neo-tree", "trouble" },
			},

			sections = {
				lualine_a = { "mode" },
				lualine_b = {
					{ "branch" },
					{
						"diff",
						symbols = { added = " ", modified = "柳", removed = " " },
						diff_color = {
							added = { fg = "#A6E3A1" },
							modified = { fg = "#F9E2AF" },
							removed = { fg = "#F38BA8" },
						},
					},
				},
				lualine_c = {
					{
						"diagnostics",
						sources = { "nvim_diagnostic" },
						sections = { "error", "warn", "info", "hint" },
						symbols = { error = " ", warn = " ", info = " ", hint = " " },
						diagnostics_color = {
							error = { fg = "#F38BA8" },
							warn = { fg = "#F9E2AF" },
							info = { fg = "#A6E3A1" },
							hint = { fg = "#89B4FA" },
						},
					},
					{ "filename", path = 1 },
				},
				lualine_x = { "encoding", "fileformat", "filetype" },
				lualine_y = { "progress" },
				lualine_z = { "location" },
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = { "filename" },
				lualine_x = { "location" },
				lualine_y = {},
				lualine_z = {},
			},
			tabline = {},
			extensions = {},
		})
	end,
}
