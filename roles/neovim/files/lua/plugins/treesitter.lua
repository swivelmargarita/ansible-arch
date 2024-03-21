return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
        ensure_installed =
        { "python", "lua", "vim", "vimdoc", "bash", "c",
        "cpp", "diff", "dockerfile", "gitignore", "go",
        "helm", "html", "css", "csv", "htmldjango", "java",
        "json", "json5", "javascript", "markdown", "markdown_inline",
        "passwd", "sql", "toml", "yaml"  }
    end
}
