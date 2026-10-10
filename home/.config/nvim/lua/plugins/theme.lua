-- Omarchy normally symlinks this file to the active theme:
--   ~/.local/state/omarchy/current/theme/neovim.lua
-- Without the Omarchy theme engine, this pins the Omarchy 4 default (aether).
return {
  {
    "bjarneo/aether.nvim",
    branch = "v3",
    name = "aether",
    priority = 1000,
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "aether",
    },
  },
}
