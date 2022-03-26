vim.cmd[[
set wrap
let g:vimtex_compiler_method = 'latexrun'
let g:vimtex_compiler_latexmk = {
            \ 'build_dir' : 'build',
            \}
let g:latex_view_general_viewer = 'zathura'
let g:vimtex_view_method = "zathura"
let g:vimtex_quickfix_ignore_filters = [
      \ 'DeclareDelimAlias*',
      \]
]]
