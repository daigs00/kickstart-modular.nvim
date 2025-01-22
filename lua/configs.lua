-- Lualine Configuration
-- This configuration is mainly implemented from their github repository.
local virtual_env = function()
  -- only show virtual env for Python
  if vim.bo.filetype ~= 'python' then
    return ''
  end

  local conda_env = os.getenv 'CONDA_DEFAULT_ENV'
  local venv_path = os.getenv 'VIRTUAL_ENV'

  if venv_path == nil then
    if conda_env == nil then
      return ''
    else
      return string.format('  %s (conda)', conda_env)
    end
  else
    local venv_name = vim.fn.fnamemodify(venv_path, ':t')

    return string.format('  %s', venv_name)
  end
end

require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'auto',
    component_separators = { left = '', right = '' },
    section_separators = { left = '', right = '' },
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = false,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    },
  },
  sections = {
    lualine_a = { 'mode' },
    lualine_b = { 'branch', 'diff', 'diagnostics' },
    lualine_c = { 'filename' },
    lualine_x = { 'encoding', 'fileformat', 'filetype' },
    lualine_y = { virtual_env },
    lualine_z = { 'location' },
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { 'filename' },
    lualine_x = { 'location' },
    lualine_y = {},
    lualine_z = {},
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {},
}

require('yapf').setup {
  command = 'yapf',
  style = '/home/mdaigle/.style.yapf',
}

require('noice').setup {
  lsp = {
    -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
    override = {
      ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
      ['vim.lsp.util.stylize_markdown'] = true,
      ['cmp.entry.get_documentation'] = true, -- requires hrsh7th/nvim-cmp
    },
  },
  -- you can enable a preset for easier configuration
  presets = {
    bottom_search = true, -- use a classic bottom cmdline for search
    command_palette = true, -- position the cmdline and popupmenu together
    long_message_to_split = true, -- long messages will be sent to a split
    inc_rename = false, -- enables an input dialog for inc-rename.nvim
    lsp_doc_border = false, -- add a border to hover docs and signature help
  },
}

local lspconfig = require 'lspconfig'
lspconfig.pylsp.setup {
  on_attach = custom_attach,
  settings = {
    pylsp = {
      plugins = {
        -- formatter options
        black = { enabled = false, executable = 'black' },
        autopep8 = { enabled = false },
        yapf = { enabled = true },
        -- linter options
        pylint = { enabled = false, executable = 'pylint' },
        pyflakes = { enabled = false },
        pycodestyle = { enabled = true, ignore = { 'E501' } },
        mccabe = { enabled = false },
        -- type checker
        pylsp_mypy = { enabled = false },
        -- auto-completion options
        jedi_completion = { fuzzy = true },
        -- import sorting
        pyls_isort = { enabled = false },
      },
    },
  },
  flags = {
    debounce_text_changes = 200,
  },
  capabilities = capabilities,
}

vim.opt.termguicolors = true
require('bufferline').setup {}

require('nvim-tree').setup {}
