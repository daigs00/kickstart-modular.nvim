local lspconfig = require 'lspconfig'
lspconfig.pylsp.setup {
  on_attach = custom_attach,
  settings = {
    pylsp = {
      plugins = {
        -- formatter options
        black = { enabled = true },
        autopep8 = { enabled = false },
        yapf = { enabled = false },
        -- linter options
        pylint = { enabled = false, executable = 'pylint' },
        pyflakes = { enabled = false },
        pycodestyle = { enabled = true, ignore = { 'E501' } },
        -- type checker
        pylsp_mypy = { enabled = true },
        -- auto-completion options
        jedi_completion = { fuzzy = true },
        -- import sorting
        pyls_isort = { enabled = true },
      },
    },
  },
  flags = {
    debounce_text_changes = 200,
  },
  capabilities = capabilities,
}
