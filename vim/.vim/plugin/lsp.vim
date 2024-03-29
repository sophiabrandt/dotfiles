func! s:setup_ls(...) abort
    let l:servers = lsp#get_allowed_servers()

    for l:server in l:servers
        let l:cap = lsp#get_server_capabilities(l:server)

        if has_key(l:cap, 'completionProvider')
            setlocal completefunc=lsp#complete
        endif

        if has_key(l:cap, 'hoverProvider')
            nmap <silent><buffer><Leader>K <plug>(lsp-hover)
        endif

        if has_key(l:cap, 'referencesProvider')
            nmap <silent><buffer><Leader>gn <plug>(lsp-next-reference)
            nmap <silent><buffer><Leader>gp <plug>(lsp-previous-reference)
        endif

        if has_key(l:cap, 'implementationProvider')
            nmap <silent><buffer><Leader>gI <plug>(lsp-implementation)
        endif

        if has_key(l:cap, 'codeActionProvider')
            nmap <silent><buffer><Leader>ga <plug>(lsp-code-action)
        endif

        if has_key(l:cap, 'definitionProvider')
            nmap <silent><buffer><Leader>gd <plug>(lsp-definition)
            nmap <silent><buffer><Leader>gk <plug>(lsp-peek-definition)
        endif

        if has_key(l:cap, 'typeDefinitionProvider')
            nmap <silent><buffer><Leader>gt <plug>(lsp-type-definition)
        endif

        if has_key(l:cap, 'signatureHelpProvider')
            nmap <silent><buffer><Leader>gm <plug>(lsp-signature-help)
        endif

        if has_key(l:cap, 'documentSymbolProvider')
            nmap <silent><buffer><Leader>go <plug>(lsp-document-symbol)
        endif

        if has_key(l:cap, 'renameProvider')
            nmap <silent><buffer><Leader>gr <plug>(lsp-rename)
        endif

        if has_key(l:cap, 'workspaceSymbolProvider')
            nmap <silent><buffer><Leader>gw <plug>(lsp-workspace-symbol)
        endif

    endfor
endfunc

augroup LSC
    autocmd!
    autocmd User lsp_setup call lsp#register_server({
                \ 'name': 'omnisharp-roslyn',
                \ 'cmd': {_->[&shell, &shellcmdflag, 'mono $HOME/.bin/omnisharp/OmniSharp.exe --languageserver']},
                \ 'allowlist': ['cs']
                \})
    autocmd User lsp_setup call lsp#register_server({
                \ 'name': 'elixir-ls',
                \ 'cmd': {_->[&shell, &shellcmdflag, '$HOME/.bin/elixir-ls/release/language_server.sh']},
                \ 'allowlist': ['elixir', 'eelixir']
                \})
    autocmd User lsp_setup call lsp#register_server({
                \ 'name': 'fsharp-language-server',
                \ 'cmd': {_->[&shell, &shellcmdflag, 'dotnet $HOME/.bin/fsharp-language-server/src/FSharpLanguageServer/bin/Release/netcoreapp3.0/FSharpLanguageServer.dll']},
                \ 'allowlist': ['fsharp']
                \})
    autocmd User lsp_setup call lsp#register_server({
                \ 'name': 'eclipse.jdt.ls',
                \ 'cmd': {server_info->[
                \     'java',
                \     '-Declipse.application=org.eclipse.jdt.ls.core.id1',
                \     '-Dosgi.bundles.defaultStartLevel=4',
                \     '-Declipse.product=org.eclipse.jdt.ls.core.product',
                \     '-Dlog.level=ALL',
                \     '-noverify',
                \     '-Dfile.encoding=UTF-8',
                \     '-Xmx1G',
                \     '-jar',
                \     expand('~/.bin/eclipse.jdt.ls/plugins/org.eclipse.equinox.launcher_1.6.0.v20200915-1508.jar'),
                \     '-configuration',
                \     expand('~/.bin/eclipse.jdt.ls/config_win'),
                \     '-data',
                \     getcwd()
                \ ]},
                \ 'allowlist': ['java']
                \})
    autocmd User lsp_setup call lsp#register_server({
                \ 'name': 'nimble',
                \ 'cmd': {_->[&shell, &shellcmdflag, '$HOME/.nimble/bin/nimlsp']},
                \ 'allowlist': ['nim', 'nimble']
                \})
    autocmd User lsp_setup call lsp#register_server({
                \ 'name': 'ocaml-lsp',
                \ 'cmd': {_->['ocamllsp']},
                \ 'allowlist': ['ocaml']
                \})
    autocmd User lsp_setup call lsp#register_server({
                \ 'name': 'reason-language-server',
                \ 'cmd': {_->[&shell, &shellcmdflag, '$HOME/.bin/rls-linux/reason-language-server']},
                \ 'allowlist': ['reason']
                \})

    autocmd User lsp_server_init call <SID>setup_ls()
    autocmd BufEnter * call <SID>setup_ls()
augroup END

let g:lsp_diagnostics_enabled                = 0
let g:lsp_diagnostics_signs_enabled          = 0
let g:lsp_diagnostics_virtual_text_enabled   = 0
let g:lsp_diagnostics_highlights_enabled     = 0
let g:lsp_document_code_action_signs_enabled = 0
