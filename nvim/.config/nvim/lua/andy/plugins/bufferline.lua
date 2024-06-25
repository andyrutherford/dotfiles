return {
	"akinsho/bufferline.nvim",
	config = function()
		require("bufferline").setup({
			options = {
				numbers = "none", -- Disable number column
				diagnostics = "nvim_lsp", -- Show diagnostics in bufferline
				diagnostics_indicator = function(count, level, diagnostics_dict, context)
					local icon = level:match("error") and " " or " "
					return " " .. icon .. count
				end,
				separator_style = "thin", -- Separator style between buffers
				offsets = {
					{ filetype = "neo-tree", text = "File Explorer", text_align = "center" },
				},
			},
			highlights = {
				fill = {
					guibg = "#1e222a",
				},
				separator = {
					guifg = "#282c34",
					guibg = "#282c34",
				},
			},
		})

		-- Key mappings
		local opts = { noremap = true, silent = true }
		vim.api.nvim_set_keymap("n", "<TAB>", ":BufferLineCycleNext<CR>", opts)
		vim.api.nvim_set_keymap("n", "<S-TAB>", ":BufferLineCyclePrev<CR>", opts)
		-- vim.api.nvim_set_keymap("n", "<A-1>", ":BufferLineGoToBuffer 1<CR>", opts)
		-- vim.api.nvim_set_keymap("n", "<A-2>", ":BufferLineGoToBuffer 2<CR>", opts)
		-- vim.api.nvim_set_keymap("n", "<A-3>", ":BufferLineGoToBuffer 3<CR>", opts)
		-- vim.api.nvim_set_keymap("n", "<A-4>", ":BufferLineGoToBuffer 4<CR>", opts)
	end,
}
