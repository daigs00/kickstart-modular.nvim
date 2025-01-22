return {
  { 'ellisonleao/gruvbox.nvim' },
  { 'rebelot/kanagawa.nvim' },
  { 'catppuccin/nvim', name = 'catppuccin', lazy = false },
  { 'rose-pine/neovim', name = 'rose-pine' },
  { 'sainnhe/everforest' },
  { 'bluz71/vim-nightfly-colors' },
  { 'NLKNguyen/papercolor-theme' },
  { 'romainl/Apprentice' },
  { 'diegoulloao/neofusion.nvim', priority = 1000, config = true, opts = ... },
  { 'folke/tokyonight.nvim', lazy = false, priority = 1000, config = true, opts = ... },

  -- Configure LazyVim to load colorscheme
  {
    'LazyVim/LazyVim',
    opts = {
      colorscheme = 'tokyonight-storm',
    },
  },
}
