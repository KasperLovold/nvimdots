local lsp = require('lsp-zero')

vim.opt.signcolumn = 'yes'

lsp.preset('recommended')

local cmp = require('cmp')
local cmp_select = {behavior = cmp.SelectBehavior.Select}
local cmp_mappings = lsp.defaults.cmp_mappings({
  ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
  ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
  ['<Tab>'] = cmp.mapping.confirm({ select = true }),
  ["<C-Space>"] = cmp.mapping.complete(),
})

lsp.setup_nvim_cmp({
	mapping = cmp_mappings
})

lsp.ensure_installed({
	'tsserver',
	'eslint',
	'rust_analyzer'
})

lsp.setup()


vim.diagnostic.config({
    virtual_text = true,
    signs = true,
    float = true,
    underline = false,
    DiagnosticVirtualTextHint = true,
    DiagnosticVirtualTextInfo = true
})
