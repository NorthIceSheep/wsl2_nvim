local function rename_current_file()
	print("hello world")
    local OldName = vim.fn.expand("%:p") -- 当前文件绝对路径
    if OldName == "" then
        vim.notify("No file to rename",vim.log.levels.WARN)
        return
        
    end

    local NewName = vim.fn.input("Rename to:",OldName)
    if NewName == "" or NewName == OldName then
        return
    end
    
    vim.cmd("saveas " .. vim.fn.fnameescape(NewName)) -- 保存到新文件
    vim.cmd("bdelete! " .. vim.fn.bufnr(OldName) ) -- 关闭旧的buffer
    vim.fn.delete(OldName)
    vim.notify("Renamed to " .. NewName,vim.log.levels.INFO)
end
return {
	"akinsho/bufferline.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = {
		options = {
			diagnostics = "nvim_lsp",
			diagnostics_indicator = function(_, _, diagnostics_dict, _)
				local indicator = " "
				for level, number in pairs(diagnostics_dict) do
					local symbol
					if level == "error" then
						symbol = " "
					elseif level == "warning" then
						symbol = " "
					else
						symbol = " "
					end
					indicator = indicator .. number .. symbol
				end
				return indicator
			end,
		},
	},

	keys = {
		{ "<leader>br", rename_current_file, desc = "Rename file......" },
		{ "<leader>bn", ":enew<CR>:file", silent = false, desc = "New named file" },
		{ "<leader>bh", ":BufferLineCyclePrev<CR>", silent = true },
		{ "<leader>bl", ":BufferLineCycleNext<CR>", silent = true },
		{ "<leader>bg", ":bdelete<CR>", silent = true },
		{ "<leader>bo", ":BufferLineCloseOthers<CR>", silent = true },
		{ "<leader>bp", ":BufferLinePick<CR>", silent = true },
		{ "<leader>bc", ":BufferLinePickClose<CR>", silent = true },
	},
	lazy = false,
}
