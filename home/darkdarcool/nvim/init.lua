-- get rid of the sign column (it moves text and thats a no no)
vim.opt.signcolumn = "no"
                  
-- rounded hover doc (its 10x better)
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
  border = "rounded",
  underline = true
})

-- border color fix for oxocarbon
-- vim.cmd("hi FloatBorder guifg=#acacac guibg=#161616")

vim.opt.title = true
vim.opt.titlelen = 0 -- do not shorten title
                  
vim.api.nvim_create_autocmd("BufEnter", { 
  pattern = "*",
  callback = function()
    local path = vim.fn.expand("%:p")
    -- replace /home/darkdarcool with ~
    path = string.gsub(path, "/home/darkdarcool", "~")
    vim.opt.titlestring = "nvim " .. path
  end
})

-- add colorcolumn
vim.opt.colorcolumn = "80"

require("smartcolumn").setup({
  colorcolumn = "80",
  disabled_filetypes = { "help", "text", "markdown" },
  custom_colorcolumn = {},
  scope = "line",
})

-- tab size
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true

-- animations
local mouse_scrolled = false
for _, scroll in ipairs({ "Up", "Down" }) do
  local key = "<ScrollWheel" .. scroll .. ">"
  vim.keymap.set({ "", "i" }, key, function()
    mouse_scrolled = true
    return key
  end, { expr = true })
end

vim.api.nvim_create_autocmd("FileType", {
  pattern = "grug-far",
  callback = function()
    vim.b.minianimate_disable = true
  end,
})

local animate = require("mini.animate")
animate.setup({
  open = {
    enable = false 
  },
  close = {
    enable = false
  },
  scroll = {
    timing = animate.gen_timing.linear({ duration = 150, unit = "total" }),
    subscroll = animate.gen_subscroll.equal({
      predicate = function(total_scroll)
        if mouse_scrolled then
          mouse_scrolled = false
          return false
        end
        return total_scroll > 1
      end,
    }),
  },
})    
