func! s:setup_ls(...) abort
    let l:servers = lsp#get_whitelisted_servers()

    for l:server in l:servers
        let l:cap = lsp#get_server_capabilities(l:server)

        if has_key(l:cap, 'completionProvider')
            setlocal completefunc=lsp#complete
        endif

        if has_key(l:cap, 'hoverProvider')
            setlocal keywordprg=:LspHover
        endif

        if has_key(l:cap, 'referencesProvider')
            nmap <silent><buffer>gn <plug>(lsp-next-reference)
            nmap <silent><buffer>gp <plug>(lsp-previous-reference)
        endif

        if has_key(l:cap, 'implementationProvider')
            nmap <silent><buffer>gI <plug>(lsp-implementation)
        endif

        if has_key(l:cap, 'codeActionProvider')
            nmap <silent><buffer>ga <plug>(lsp-code-action)
        endif

        if has_key(l:cap, 'definitionProvider')
            nmap <silent><buffer>gd <plug>(lsp-definition)
        endif

        if has_key(l:cap, 'typeDefinitionProvider')
            nmap <silent><buffer>gt <plug>(lsp-type-definition)
        endif

        if has_key(l:cap, 'signatureHelpProvider')
            nmap <silent><buffer>gm <plug>(lsp-signature-help)
        endif

        if has_key(l:cap, 'documentSymbolProvider')
            nmap <silent><buffer>go <plug>(lsp-document-symbol)
        endif

        if has_key(l:cap, 'renameProvider')
            nmap <silent><buffer>gr <plug>(lsp-rename)
        endif

        if has_key(l:cap, 'workspaceSymbolProvider')
            nmap <silent><buffer>gw <plug>(lsp-workspace-symbol)
        endif

    endfor
endfunc

augroup LSC
    autocmd!
    autocmd User lsp_setup call lsp#register_server({
                \ 'name': 'omnisharp-roslyn',
                \ 'cmd': {_->[&shell, &shellcmdflag, expand('mono $HOME/.bin/omnisharp/OmniSharp.exe --languageserver')]},
                \ 'whitelist': ['cs']
                \})
    autocmd User lsp_setup call lsp#register_server({
                \ 'name': 'dart',
                \ 'cmd': {_->[&shell, &shellcmdflag, 'dart $DART_SDK/bin/snapshots/analysis_server.dart.snapshot --lsp']},
                \ 'whitelist': ['dart']
                \})
    autocmd User lsp_setup call lsp#register_server({
                \ 'name': 'elixir-ls',
                \ 'cmd': {_->[&shell, &shellcmdflag, expand('$HOME/.bin/elixir-ls/release/language_server.sh')]},
                \ 'whitelist': ['elixir', 'eelixir']
                \})
    autocmd User lsp_setup call lsp#register_server({
                \ 'name': 'fsharp-language-server',
                \ 'cmd': {_->[&shell, &shellcmdflag, expand('dotnet $HOME/.bin/fsharp-language-server/src/FSharpLanguageServer/bin/Release/netcoreapp3.0/FSharpLanguageServer.dll')]},
                \ 'whitelist': ['fsharp']
                \})
    autocmd User lsp_setup call lsp#register_server({
                \ 'name': 'gopls',
                \ 'cmd': {_->['gopls']},
                \ 'whitelist': ['go']
                \})
    autocmd User lsp_setup call lsp#register_server({
                \ 'name': 'java-language-server',
                \ 'cmd': {_->['bash', expand('$HOME/.bin/java-language-server/dist/lang_server_linux.sh')]},
                \ 'whitelist': ['java']
                \})
    autocmd User lsp_setup call lsp#register_server({
                \ 'name': 'typescript-language-server',
                \ 'cmd': {_->[&shell, &shellcmdflag, 'typescript-language-server --stdio']},
                \ 'whitelist': ['javascript', 'javascriptreact', 'typescript', 'typescriptreact', 'vue']
                \})
    autocmd User lsp_setup call lsp#register_server({
                \ 'name': 'nimble',
                \ 'cmd': {_->[&shell, &shellcmdflag, expand('$HOME/.nimble/bin/nimlsp')]},
                \ 'whitelist': ['nim', 'nimble']
                \})
    autocmd User lsp_setup call lsp#register_server({
                \ 'name': 'ocmallsp',
                \ 'cmd': {_->['ocamllsp']},
                \ 'whitelist': ['ocamlp']
                \})
    autocmd User lsp_setup call lsp#register_server({
                \ 'name': 'pyls',
                \ 'cmd': {_->[&shell, &shellcmdflag, expand('$HOME/.local/bin/pyls')]},
                \ 'whitelist': ['python']
                \})
    autocmd User lsp_setup call lsp#register_server({
                \ 'name': 'reason-language-server',
                \ 'cmd': {_->[&shell, &shellcmdflag, expand('$HOME/.bin/rls-linux/reason-language-server')]},
                \ 'whitelist': ['reason']
                \})
    autocmd User lsp_setup call lsp#register_server({
                \ 'name': 'RLS',
                \ 'cmd': {_->['rls']},
                \ 'whitelist': ['rust']
                \})

    autocmd User lsp_server_init call <SID>setup_ls()
    autocmd BufEnter * call <SID>setup_ls()
augroup END

let g:lsp_diagnostics_enabled = 0
