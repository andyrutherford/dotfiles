return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
	},
	enabled = true,
	config = function()
		-- Diagnostic highlight settings
		vim.api.nvim_set_hl(0, "DiagnosticUnderlineError", { undercurl = true, sp = "#FF0000" })
		vim.api.nvim_set_hl(0, "DiagnosticError", { fg = "#FF0000", undercurl = true, sp = "#FF0000" })
		vim.api.nvim_set_hl(0, "DiagnosticUnderlineWarn", { undercurl = true, sp = "#FFA500" })
		vim.api.nvim_set_hl(0, "DiagnosticWarn", { fg = "#FFA500", undercurl = true, sp = "#FFA500" })
		vim.api.nvim_set_hl(0, "DiagnosticUnderlineInfo", { undercurl = true, sp = "#00FFFF" })
		vim.api.nvim_set_hl(0, "DiagnosticInfo", { fg = "#00FFFF", undercurl = true, sp = "#00FFFF" })
		vim.api.nvim_set_hl(0, "DiagnosticUnderlineHint", { undercurl = true, sp = "#0000FF" })
		vim.api.nvim_set_hl(0, "DiagnosticHint", { fg = "#0000FF", undercurl = true, sp = "#0000FF" })
		local lspconfig = require("lspconfig")
		local util = require("lspconfig.util")
		local cmp_nvim_lsp = require("cmp_nvim_lsp")

		-- Disable inline error messages
		vim.diagnostic.config({
			virtual_text = false,
			underline = true,
			signs = true,
			update_in_insert = false,
			float = {
				border = "single",
			},
		})

		-- Add border to floating window
		vim.lsp.handlers["textDocument/signatureHelp"] =
			vim.lsp.with(vim.lsp.handlers.hover, { border = "single", silent = true })
		vim.lsp.handlers["textDocument/hover"] =
			vim.lsp.with(vim.lsp.handlers.hover, { border = "single", silend = true })

		-- Make float window transparent start

		local set_hl_for_floating_window = function()
			vim.api.nvim_set_hl(0, "NormalFloat", {
				link = "Normal",
			})
			vim.api.nvim_set_hl(0, "FloatBorder", {
				bg = "none",
			})
		end

		set_hl_for_floating_window()

		vim.api.nvim_create_autocmd("ColorScheme", {
			pattern = "*",
			desc = "Avoid overwritten by loading color schemes later",
			callback = set_hl_for_floating_window,
		})

		-- Make float window transparent end

		local on_attach = function(client, bufnr)
			vim.keymap.set(
				"n",
				"K",
				vim.lsp.buf.hover,
				{ buffer = bufnr, desc = "Show documentation for what is under cursor" }
			)
			vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { buffer = bufnr, desc = "Smart rename" })
			vim.keymap.set(
				{ "n", "v" },
				"ca",
				vim.lsp.buf.code_action,
				{ buffer = bufnr, desc = "See available code actions" }
			)
			vim.keymap.set(
				"n",
				"<leader>d",
				vim.diagnostic.open_float,
				{ buffer = bufnr, desc = "Show diagnostics for line" }
			)
			vim.keymap.set(
				"n",
				"<leader>dn",
				vim.diagnostic.goto_next,
				{ buffer = bufnr, desc = "Show next diagnostic" }
			)
			vim.keymap.set(
				"n",
				"<leader>dp",
				vim.diagnostic.goto_prev,
				{ buffer = bufnr, desc = "Show previous diagnostic" }
			)
			vim.keymap.set(
				"n",
				"gR",
				"<cmd>Telescope lsp_references<CR>",
				{ buffer = bufnr, desc = "Show definition, references" }
			)
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = bufnr, desc = "Go to definition" })

			vim.keymap.set("n", "gt", vim.lsp.buf.hover, { buffer = bufnr, desc = "Go to type definion" })

			-- Refresh diagnostics when leaving insert mode
			vim.api.nvim_create_autocmd({ "TextChanged", "InsertLeave" }, {
				buffer = bufnr,
				callback = function()
					vim.lsp.buf.document_highlight()
					vim.diagnostic.setloclist({ open = false }) -- Update the diagnostic location list
				end,
			})
		end

		local capabilities = cmp_nvim_lsp.default_capabilities()
		local signs = { Error = "✖", Warn = "", Hint = "󰠠", Info = "" }
		for type, icon in pairs(signs) do
			local hl = "DiagnosticSign" .. type
			vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
		end

		-- configure typescript server with plugin
		lspconfig["tsserver"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		-- configure html server
		lspconfig["html"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

	-- 	local function get_angular_language_server_path()
	-- 		-- Path to the nvm versions directory
	-- 		local nvm_versions_path = os.getenv("HOME") .. "/.nvm/versions/node/"
			
	-- 		-- Get the list of directories in the nvm versions directory
	-- 		local handle = io.popen('ls -1 "' .. nvm_versions_path .. '"')
	-- 		local result = handle:read("*a")
	-- 		handle:close()
	
	-- 		-- Find the current node version (assume it's the latest directory)
	-- 		local node_version
	-- 		for version in result:gmatch("[^\r\n]+") do
	-- 				node_version = version
	-- 		end
	
	-- 		-- Construct the desired path
	-- 		local path = nvm_versions_path .. node_version .. "/lib/node_modules/@angular/language-server"
	
	-- 		return path
	-- end
	
	-- -- Use the path in the LSP configuration
	local angular_ls_path = "/Users/andy/.nvm/versions/node/v20.13.1/lib/node_modules/@angular/language-server"
	local ts_path = "/Users/andy/.nvm/versions/node/v20.13.1/lib/node_modules/typescript"


	local project_library_path = "/Users/andy/.nvm/versions/node/v20.13.1/lib/node_modules/@angular/language-server"

	local cmd = {"node", 
	"/Users/andy/.nvm/versions/node/v20.13.1/lib/node_modules/@angular/language-server",
	"--stdio",
	 "--tsProbeLocations",
	  project_library_path,
		 "--ngProbeLocations",
		  project_library_path
		}
	-- Configure the Angular Language Server
	require('lspconfig').angularls.setup({
			cmd = cmd,
			-- on_attach = on_attach, 
			capabilities = capabilities,
			on_new_config = function(new_config, new_root_dir)
					new_config.cmd = cmd
			end,
	})

		lspconfig["lua_ls"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
			settings = {
				Lua = {
					-- make the language server recognize "vim" global
					diagnostics = {
						globals = { "vim" },
					},
					workspace = {
						-- make language server aware of runtime files
						library = {
							[vim.fn.expand("$VIMRUNTIME/lua")] = true,
							[vim.fn.stdpath("config") .. "/lua"] = true,
						},
					},
				},
			},
		})

		-- configure css server
		lspconfig["cssls"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})
	end,
}
