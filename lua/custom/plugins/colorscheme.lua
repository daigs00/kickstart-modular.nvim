return {
  { 'ellisonleao/gruvbox.nvim', lazy = true },
  { 'rebelot/kanagawa.nvim', lazy = true },
  { 'catppuccin/nvim', name = 'catppuccin', lazy = true },
  { 'rose-pine/neovim', name = 'rose-pine' },
  { 'sainnhe/everforest', lazy = true },
  { 'bluz71/vim-nightfly-colors', lazy = true },
  { 'NLKNguyen/papercolor-theme', lazy = true },
  { 'romainl/Apprentice', lazy = true },
  { 'diegoulloao/neofusion.nvim', lazy = true, priority = 1000, config = true, opts = ... },
  { 'folke/tokyonight.nvim', lazy = false, priority = 1000, config = true, opts = ... },

  -- Configure LazyVim to load colorscheme
  {
    'LazyVim/LazyVim',
    opts = {
      colorscheme = 'tokyonight-storm',
    },
  },
}
