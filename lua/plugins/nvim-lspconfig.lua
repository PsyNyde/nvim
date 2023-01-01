return {
  'neovim/nvim-lspconfig',
  dependencies = {
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    'p00f/clangd_extensions.nvim',
    'jose-elias-alvarez/null-ls.nvim',
    'ray-x/lsp_signature.nvim',
  },
  config = function()
    require('mason').setup()
    require('mason-lspconfig').setup({
      automatic_installation = false,
    })

    local capabilities = require('cmp_nvim_lsp').default_capabilities()

    OpenDiagFloat = function()
      for _, winid in pairs(vim.api.nvim_tabpage_list_wins(0)) do
        if vim.api.nvim_win_get_config(winid).zindex then
          return
        end
      end
      vim.diagnostic.open_float({ focusable = false, width = 80 })
    end

    local on_attach = function(client, bufnr)
      local function buf_set_option(...)
        vim.api.nvim_buf_set_option(bufnr, ...)
      end

      buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')
      vim.api.nvim_buf_set_option(0, 'formatexpr', 'v:lua.vim.lsp.formatexpr()')

      -- Mappings.
      vim.keymap.set('n', '<space>,', vim.diagnostic.goto_prev,
        { noremap = true, silent = false, desc = 'Diag prev', buffer = bufnr })
      vim.keymap.set('n', '<space>;', vim.diagnostic.goto_next,
        { noremap = true, silent = false, desc = 'Diag next', buffer = bufnr })
      vim.keymap.set('n', '<space>a', vim.lsp.buf.code_action,
        { noremap = true, silent = false, desc = 'Code action', buffer = bufnr })
      vim.keymap.set('n', '<space>d', vim.lsp.buf.definition,
        { noremap = true, silent = false, desc = 'Definition', buffer = bufnr })
      vim.keymap.set('n', '<space>e', vim.lsp.buf.declaration,
        { noremap = true, silent = false, desc = 'Declaration', buffer = bufnr })
      vim.keymap.set('n', '<space>h', vim.lsp.buf.hover,
        { noremap = true, silent = false, desc = 'Hover', buffer = bufnr })
      vim.keymap.set('n', '<space>c', vim.lsp.buf.outgoing_calls,
        { noremap = true, silent = false, desc = 'Outgoing calls', buffer = bufnr })
      vim.keymap.set('n', '<space>C', vim.lsp.buf.incoming_calls,
        { noremap = true, silent = false, desc = 'Incoming calls', buffer = bufnr })
      vim.keymap.set('n', '<space>m', vim.lsp.buf.rename,
        { noremap = true, silent = false, desc = 'Rename', buffer = bufnr })
      local tele_builtins = require('telescope.builtin')
      vim.keymap.set('n', '<C-t>', tele_builtins.lsp_dynamic_workspace_symbols,
        { noremap = true, silent = false, desc = 'Workspace symbols', buffer = bufnr })
      vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition,
        { noremap = true, silent = false, desc = 'Type definition', buffer = bufnr })
      vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help,
        { noremap = true, silent = false, desc = 'Signature help', buffer = bufnr })
      vim.keymap.set('n', '<space>r', tele_builtins.lsp_references,
        { noremap = true, silent = false, desc = 'References', buffer = bufnr })
      vim.keymap.set('n', '<space>v', function() tele_builtins.diagnostics({ bufnr = 0 }) end,
        { noremap = true, silent = false, desc = 'Diagnostics', buffer = bufnr })
      vim.keymap.set('n', '<A-o>', '<cmd>ClangdSwitchSourceHeader<CR>',
        { noremap = true, silent = false, desc = 'Switch Source/Header', buffer = bufnr })

      vim.cmd([[autocmd CursorHold <buffer> lua OpenDiagFloat()]])

      -- Set some keybinds conditional on server capabilities
      if client.server_capabilities.documentFormattingProvider then
        vim.keymap.set('n', '<space>f', vim.lsp.buf.format,
          { noremap = true, silent = false, desc = 'Format file', buffer = bufnr })
      end
      if client.server_capabilities.documentRangeFormattingProvider then
        vim.keymap.set('x', '<space>f', vim.lsp.buf.format,
          { noremap = true, silent = false, desc = 'Format visual', buffer = bufnr })
      end

      -- Set autocommands conditional on server_capabilities
      if client.server_capabilities.documentHighlightProvider then
        vim.api.nvim_set_hl(
          0,
          "LspReferenceText",
          { bold = true,
            ctermbg = 'red',
            bg = "#5a524c" }
        )
        vim.api.nvim_set_hl(
          0,
          "LspReferenceRead",
          { bold = true,
            ctermbg = 'red',
            bg = 'DarkGreen' }
        )
        vim.api.nvim_set_hl(
          0,
          "LspReferenceWrite",
          { bold = true,
            ctermbg = 'red',
            bg = 'DarkRed' }
        )
        vim.api.nvim_create_augroup("lsp_document_highlight", { clear = true })
        vim.api.nvim_clear_autocmds { buffer = bufnr, group = "lsp_document_highlight" }
        vim.api.nvim_create_autocmd("CursorHold", {
          callback = vim.lsp.buf.document_highlight,
          buffer = bufnr,
          group = "lsp_document_highlight",
          desc = "Document Highlight",
        })
        vim.api.nvim_create_autocmd("CursorMoved", {
          callback = vim.lsp.buf.clear_references,
          buffer = bufnr,
          group = "lsp_document_highlight",
          desc = "Clear All the References",
        })
      end

      require('lsp_signature').on_attach({
        bind = true, -- This is mandatory, otherwise border config won't get registered.
        handler_opts = {
          border = 'single',
        },
        hi_parameter = 'IncSearch',
      }, bufnr)
    end

    require('lspconfig')['pyright'].setup {
      capabilities = capabilities,
      on_attach = on_attach,
    }

    require('lspconfig')['groovyls'].setup {
      capabilities = capabilities,
      on_attach = on_attach,
    }

    require('lspconfig')['cmake'].setup {
      capabilities = capabilities,
      on_attach = on_attach,
    }

    local clangd_capabilities = capabilities
    clangd_capabilities.textDocument.semanticHighlighting = true
    clangd_capabilities.offsetEncoding = { "utf-16" }
    require("clangd_extensions").setup {
      server = {
        capabilities = clangd_capabilities,
        on_attach = on_attach,
        cmd = { 'clangd', '--compile-commands-dir=build_nvim' },
        root_dir = require('lspconfig').util.root_pattern(
          '.clangd',
          '.clang-tidy',
          '.clang-format',
          'compile_commands.json',
          'compile_flags.txt',
          'configure.ac',
          '.git',
          'build_nvim'
        )
      },
      extensions =
      {
        inlay_hints = {
          -- Only show inlay hints for the current line
          only_current_line = true,
        }
      }

    }
    -- require('clangd_extensions').setup({
    --   server = {
    --     on_attach = on_attach,
    --     capabilities = capabilities,
    --     cmd = { 'clangd', '--compile-commands-dir=build_nvim' },
    --   },
    -- })

    require('lspconfig')['jsonls'].setup {
      capabilities = capabilities,
      on_attach = on_attach,
    }

    local lua_rtp = vim.split(package.path, ';')
    table.insert(lua_rtp, 'lua/?.lua')
    table.insert(lua_rtp, 'lua/?/init.lua')
    require('lspconfig').sumneko_lua.setup {
      capabilities = capabilities,
      on_attach = on_attach,
      settings = {
        Lua = {
          runtime = {
            -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
            version = 'LuaJIT',
            -- Setup your lua path
            path = lua_rtp,
          },
          diagnostics = {
            -- Get the language server to recognize the `vim` global
            globals = { 'vim', 'use' },
          },
          workspace = {
            -- Make the server aware of Neovim runtime files
            library = vim.api.nvim_get_runtime_file('', true),
          },
          -- Do not send telemetry data containing a randomized but unique identifier
          telemetry = {
            enable = false,
          },
        },
      }
    }

    require('lspconfig')['dockerls'].setup {
      capabilities = capabilities,
      on_attach = on_attach,
    }

    require('lspconfig')['yamlls'].setup {
      capabilities = capabilities,
      on_attach = on_attach,
      settings = {
        yaml = {
          validate = true
        }
      }
    }

    local null_ls = require('null-ls')
    null_ls.setup({
      sources = {
        null_ls.builtins.code_actions.gitsigns,
        null_ls.builtins.formatting.autopep8,
        null_ls.builtins.formatting.prettier,
        null_ls.builtins.diagnostics.flake8,
        null_ls.builtins.formatting.isort,
        null_ls.builtins.formatting.cmake_format,
      },
      on_attach = on_attach,
      capabilities = capabilities,
    })

    vim.diagnostic.config({ virtual_text = false })
  end,
  event = 'VeryLazy'
}

