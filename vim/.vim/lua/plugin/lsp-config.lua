-- Do not load up plugin when in diff mode.
if vim.opt.diff:get() then
  return
end

local nvim_lsp = require("lspconfig")
local lsp_capabilities = require("util.lsp-capabilities")
local handlers = require("util.lsp-handlers")
local dart_closing_labels = require("util.dart-closing-labels")
local diagnostic = vim.diagnostic
local lsp = vim.lsp
local map = vim.keymap.set

-- Custom on attach function.
local lsp_on_attach = function(client)
  -- Mappings.
  local opts = { buffer = true }
  map("n", "ga", lsp.buf.code_action, opts)
  map("n", "gd", lsp.buf.definition, opts)
  map("n", "gD", lsp.buf.declaration, opts)
  map("n", "gi", lsp.buf.implementation, opts)
  map("n", "K", lsp.buf.hover, opts)
  map("n", "gr", lsp.buf.references, opts)
  map("n", "gR", lsp.buf.rename, opts)
  map("n", "[d", diagnostic.goto_prev, opts)
  map("n", "]d", diagnostic.goto_next, opts)
  map("n", "ge", diagnostic.open_float, opts)
  map("n", "gq", diagnostic.setloclist, opts)
  map("i", "<C-k>", lsp.buf.signature_help, opts)

  -- Formatting is conditional on server capabilities.
  if client.server_capabilities.document_formatting then
    map("n", "<LocalLeader>f", lsp.buf.format, opts)
  end
  if client.server_capabilities.document_range_formatting then
    map("x", "<LocalLeader>f", lsp.buf.range_formatting, opts)
  end
end

-- Custom on attach function which also disables formatting where null-ls will
-- be used to format.
local lsp_on_attach_no_formatting = function(client)
  client.server_capabilities.document_formatting = false
  client.server_capabilities.document_range_formatting = false

  lsp_on_attach(client)
end

-- Global handlers.
lsp.handlers["textDocument/hover"] = handlers.hover
lsp.handlers["textDocument/signatureHelp"] = handlers.signature_help

-- The nvim-cmp completion plugin supports most LSP capabilities; we should
-- notify the language servers about that.
local capabilities = lsp.protocol.make_client_capabilities()
capabilities = lsp_capabilities.update_capabilities(capabilities)

-- The Language Servers.
nvim_lsp.dartls.setup({
  on_attach = lsp_on_attach_no_formatting,
  capabilities = capabilities,
  flags = { debounce_text_changes = 300 },
  handlers = {
    ["dart/textDocument/publishClosingLabels"] = dart_closing_labels.handler(),
  },
  init_options = { closingLabels = true },
  root_dir = nvim_lsp.util.root_pattern("pubspec.yaml"),
})

nvim_lsp.gopls.setup({
  on_attach = lsp_on_attach_no_formatting,
  capabilities = capabilities,
  filetypes = { "go" },
  flags = { debounce_text_changes = 300 },
  root_dir = nvim_lsp.util.root_pattern("go.mod"),
  settings = {
    gopls = {
      experimentalPostfixCompletions = true,
      analyses = {
        unusedparams = true,
        shadow = true,
      },
      staticcheck = true,
    },
  },
  init_options = {
    usePlaceholders = true,
  }
})

nvim_lsp.html.setup({
  on_attach = lsp_on_attach,
  capabilities = capabilities,
  cmd = { "vscode-html-language-server", "--stdio" },
  filetypes = { "html" },
  flags = { debounce_text_changes = 300 },
})

nvim_lsp.pylsp.setup({
  on_attach = lsp_on_attach,
  capabilities = capabilities,
  cmd = { "pylsp"},
  filetypes = { "python" },
  flags = { debounce_text_changes = 300 },
  root_dir = nvim_lsp.util.root_pattern(".git"),
})

nvim_lsp.rust_analyzer.setup({
  on_attach = lsp_on_attach_no_formatting,
  capabilities = capabilities,
  flags = { debounce_text_changes = 300 },
  root_dir = nvim_lsp.util.root_pattern("Cargo.toml"),
  settings = {
    ["rust-analyzer"] = {
      checkOnSave = {
        command = "clippy",
        extraArgs = { "--", "-Aclippy::needless_return" },
      },
    },
  },
})

nvim_lsp.tsserver.setup({
  on_attach = lsp_on_attach_no_formatting,
  capabilities = capabilities,
  flags = { debounce_text_changes = 300 },
  root_dir = nvim_lsp.util.root_pattern("package.json"),
})
