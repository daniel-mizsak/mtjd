return { -- Ruff formatting
{
    "stevearc/conform.nvim",
    opts = {
        formatters_by_ft = {
            python = {"ruff_format", "ruff_organize_imports"}
        }
    }
}, -- Ruff linting
{
    "mfussenegger/nvim-lint",
    opts = {
        linters_by_ft = {
            python = {"ruff"}
        }
    }
}}
