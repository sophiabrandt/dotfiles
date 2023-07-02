-- Do not load up plugin when in diff mode.
if vim.opt.diff:get() then
  return
end

local null_ls = require("null-ls")
local custom_sources = require("util.null-ls-sources")
local map = vim.keymap.set

null_ls.setup({
  should_attach = function(bufnr)
    -- Disable null-ls for files larger than 100K in size.
    if vim.fn.getfsize(vim.api.nvim_buf_get_name(bufnr)) > 100000 then
      print("(null-ls) DISABLED, file too large")
      return false
    else
      return true
    end
  end,
  on_attach = function()
    -- Borrow existing formatting mapping from the LSP configuration. Whether a
    -- filetype is attached to a language server, or not, the following mapping
    -- will work for null-ls.
    local opts = { buffer = true }
    map("n", "<LocalLeader>f", function()
      vim.lsp.buf.format({ timeout_ms = 8000 })
    end, opts)
    map("n", "<LocalLeader>d", vim.diagnostic.setqflist, opts)
    -- Disable null-ls attached 'omnifunc' since it causes problems for
    -- VimCompletesMe, especially Tab-completing in Lua files.
    vim.opt_local.omnifunc = ""
  end,
  sources = {
    -- Builtin code actions.
    null_ls.builtins.code_actions.eslint,
    null_ls.builtins.code_actions.proselint,
    null_ls.builtins.code_actions.refactoring,

    -- Builtin completions.
    null_ls.builtins.completion.spell,
    null_ls.builtins.completion.tags,

    -- Builtin diagnostics.
    null_ls.builtins.diagnostics.credo,
    null_ls.builtins.diagnostics.eslint.with({
      condition = function(utils)
        return utils.root_has_file("package.json")
      end,
    }),
    null_ls.builtins.diagnostics.flake8,
    null_ls.builtins.diagnostics.golangci_lint,
    null_ls.builtins.diagnostics.hadolint,
    null_ls.builtins.diagnostics.jsonlint,
    null_ls.builtins.diagnostics.revive,
    null_ls.builtins.diagnostics.staticcheck,
    null_ls.builtins.diagnostics.yamllint,

    -- Builtin formatters.
    -- Python
    null_ls.builtins.formatting.black,
    null_ls.builtins.formatting.isort,
    -- Deno
    null_ls.builtins.formatting.deno_fmt.with({
      condition = function(utils)
        return utils.root_has_file("lock.json")
      end,
    }),
    -- JS, YAML, etc.
    null_ls.builtins.formatting.prettier,
    -- Rust
    null_ls.builtins.formatting.rustfmt,

    -- Custom sources.
    custom_sources.formatting_dartfmt,
  },
})

