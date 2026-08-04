return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      inlay_hints = {
        enabled = false,
      },
      servers = {
        -- These language servers are installed through Nix, not Mason.
        just = {
          mason = false,
        },
        ty = {
          mason = false,
        },
      },
    },
  },
}
