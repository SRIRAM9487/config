--return {
--  'nvim-telescope/telescope.nvim',
--  lazy = true,
--  dependencies = {
--    { 'nvim-lua/plenary.nvim' },
--    {
--      'nvim-telescope/telescope-fzf-native.nvim',
--      build = 'make',
--      cond = function()
--        return vim.fn.executable 'make' == 1
--      end,
--    },
--  },
--  opts = {
--    defaults = {
--      layout_config = {
--        vertical = {
--          width = 0.75
--        }
--      },
--      path_display = {
--        filename_first = {
--          reverse_directories = true
--        }
--      },
--    }
--  }
--}
return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.8",
		dependencies = "nvim-lua/plenary.nvim",
		config = function()
			local builtin = require("telescope.builtin")
			vim.keymap.set("n", "<C-p>", builtin.find_files, {})
			require("telescope").setup({
				defaults = {
					file_ignore_patterns = { "node_modules" },
				},
			})
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
			local builtin = require("telescope.builtin")
			vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
			vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep" })
			vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })
			vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help tags" })
		end,
	},
}
