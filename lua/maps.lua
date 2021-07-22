vim.cmd [[
nnoremap <leader>nn :Fern -drawer . -toggle<CR>
let g:fern#renderer = "nerdfont"
function! Init_fern() abort
  nmap <buffer> <Plug>(fern-action-open) <Plug>(fern-action-open:select)
  nmap <buffer> d <Plug>(fern-action-remove)
  setlocal nonumber norelativenumber 
endfunction

augroup fern-custom
  autocmd! *
  autocmd FileType fern call Init_fern()
augroup END
colorscheme tokyonight
if bufwinnr(1)
  nnoremap <silent> <C-H> :vertical resize -4<CR>
  nnoremap <silent> <C-L> :vertical resize +4><CR>
  nnoremap <silent> <C-J> :resize -4<CR>
  nnoremap <silent> <C-K> :resize +4<CR>
  tnoremap <silent> <C-H> :vertical resize -4<CR>
  tnoremap <silent> <C-L> :vertical resize +4><CR>
  tnoremap <silent> <C-J> :resize -4<CR>
  tnoremap <silent> <C-K> :resize +4<CR>
endif

nnoremap <leader>dc :e ~/.config/nvim/init.lua<CR>

" Telescope
nnoremap <leader>ff :Telescope find_files hidden=true<CR>
nnoremap <leader>fb :Telescope buffers<CR>
nnoremap <leader>fh :Telescope help_tags<CR>
nnoremap <leader>fi :Telescope live_grep<CR>
nnoremap <leader>fg :Telescope git_status<CR>
nnoremap <leader>fo :Telescope oldfiles<CR>
nnoremap <leader>fn :Telescope file_browser hidden=true<CR>

map <Up> <NOP>
map <Down> <NOP>
map <Left> <NOP>
map <Right> <NOP>

nnoremap <leader>` :call ChooseTerm("term-slider", 1)<CR>
nnoremap <leader><CR> :call ChooseTerm("term-pane", 0)<CR>
 
function! ChooseTerm(termname, slider)
    let pane = bufwinnr(a:termname)
    let buf = bufexists(a:termname)
    if pane > 0
        " pane is visible
        if a:slider > 0
            :exe pane . "wincmd c"
        else
            :exe "e #" 
        endif
    elseif buf > 0
        " buffer is not in pane
        if a:slider
            :exe "botright split"
        endif
        :exe "buffer " . a:termname
    else
        " buffer is not loaded, create
        if a:slider
            :exe "botright split"
        endif
        :terminal
        :exe "f " a:termname
    endif
endfunction

" compe completion
inoremap <silent><expr> <CR>      compe#confirm('<CR>')
inoremap <silent><expr> <C-e>     compe#close('<C-e>')
inoremap <silent><expr> <C-f>     compe#scroll({ 'delta': +4 })
inoremap <silent><expr> <C-d>     compe#scroll({ 'delta': -4 })
inoremap <silent><expr> <TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" Lspsaga
nnoremap <silent> gh <cmd>lua require'lspsaga.provider'.lsp_finder()<CR>
nnoremap <silent><leader>ca <cmd>lua require('lspsaga.codeaction').code_action()<CR>
vnoremap <silent><leader>ca :<C-U>lua require('lspsaga.codeaction').range_code_action()<CR>
nnoremap <silent> K <cmd>lua require('lspsaga.hover').render_hover_doc()<CR>
nnoremap <silent> <C-f> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>
nnoremap <silent> <C-b> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>
nnoremap <silent> gs <cmd>lua require('lspsaga.signaturehelp').signature_help()<CR>
nnoremap <silent>gr <cmd>lua require('lspsaga.rename').rename()<CR>
nnoremap <silent> gd <cmd>lua require'lspsaga.provider'.preview_definition()<CR>
nnoremap <silent><leader>cd <cmd>lua require'lspsaga.diagnostic'.show_line_diagnostics()<CR>
nnoremap <silent><leader>cc <cmd>lua require'lspsaga.diagnostic'.show_cursor_diagnostics()<CR>
nnoremap <silent> [e <cmd>lua require'lspsaga.diagnostic'.lsp_jump_diagnostic_prev()<CR>
nnoremap <silent> ]e <cmd>lua require'lspsaga.diagnostic'.lsp_jump_diagnostic_next()<CR>
]]

