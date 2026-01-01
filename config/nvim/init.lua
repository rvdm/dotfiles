require("config.lazy")
vim.cmd('source ~/.vimrc')
vim.diagnostic.enable = true
vim.diagnostic.config({
    virtual_lines = false,
})
require("config.lsp")

vim.diagnostic.config({
  virtual_text = false,
})
