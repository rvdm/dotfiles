require("config.lazy")
vim.cmd('source ~/.vimrc')
vim.diagnostic.enable = true
vim.diagnostic.config({
    virtual_lines = true,
})
require("config.lsp")
