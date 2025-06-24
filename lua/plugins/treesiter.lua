return {
 {"nvim-treesitter/nvim-treesitter", branch = 'master', lazy = false, build = ":TSUpdate",
    config = function()
    require("nvim-treesitter.configs").setup {
      ensure_installed = {
        "lua", "vim", "vimdoc", "bash", "html", "javascript", "typescript", "json", "markdown", "c", "cpp", "python"
      },
      highlight = { enable = true },
      sync_install = false,
      auto_install = true,
      indent = { enable = true },
    }
  end,
 }
}
