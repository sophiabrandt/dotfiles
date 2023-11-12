local cmp = require('cmp')

local has_words_before = function()
	if vim.api.nvim_buf_get_option(0, "buftype") == "prompt" then return false end
	local line, col = unpack(vim.api.nvim_win_get_cursor(0))
	return col ~= 0 and vim.api.nvim_buf_get_text(0, line - 1, 0, line - 1, col, {})[1]:match("^%s*$") == nil
end

-- Return the plugin configuration
return {
	"zbirenbaum/copilot-cmp",
	config = function()
		require("copilot_cmp").setup()

		-- Additional cmp configuration specific to copilot-cmp
		cmp.setup({
			mapping = {
				["<Tab>"] = vim.schedule_wrap(function(fallback)
					if cmp.visible() and has_words_before() then
						cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
					else
						fallback()
					end
				end),
			},
		})
	end
}
