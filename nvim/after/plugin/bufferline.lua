vim.keymap.set('n', ']', '<Cmd>:BufferLineCycleNext<CR>', { nowait = true } )
vim.keymap.set('n', '[', '<Cmd>:BufferLineCyclePrev<CR>', { nowait = true } )
vim.keymap.set('n', '<leader>b', '<Cmd>:BufferLinePick<CR>', { nowait = true } )
