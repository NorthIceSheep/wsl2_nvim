
local function set_transparency()
  local groups = {
    "Normal", "NormalNC", "NormalFloat", "NormalSB",
    "EndOfBuffer", "SignColumn", "FoldColumn",
    "NeoTreeNormal", "NeoTreeNormalNC", "NvimTreeNormal", "NvimTreeNormalNC"
  }

  for _, group in ipairs(groups) do
    vim.cmd(("hi %s guibg=NONE ctermbg=NONE"):format(group))
  end
end

vim.api.nvim_create_autocmd(
  { "VimEnter", "BufWinEnter", "WinEnter", "ColorScheme" },
  { callback = set_transparency }
)

vim.api.nvim_create_user_command("SetTransparent", set_transparency, {})

