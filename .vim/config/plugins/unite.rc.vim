"---------------------------------------------------------------------------
" unite.vim

" call unite#custom#source('codesearch', 'max_candidates', 30)
" call unite#filters#matcher_default#use(['matcher_fuzzy'])
" call unite#filters#sorter_default#use(['sorter_rank'])
call unite#custom#profile('default', 'context', {
            \   'safe': 0,
            \   'start_insert': 1,
            \   'ignorecase' : 1,
            \   'short_source_names': 1,
            \   'update_time': 200,
            \   'direction': 'botright',
            \   'winwidth': 40,
            \   'winheight': 15,
            \   'max_candidates': 100,
            \   'no_auto_resize': 1,
            \   'vertical_preview': 0,
            \   'cursor_line_time': '0.10',
            \   'hide_icon': 0,
            \   'candidate-icon': ' ',
            \   'marked_icon': '?',
            \   'prompt' : ' ?'
            \ })
call unite#custom#profile('source/neobundle/update', 'context', {
            \   'start_insert' : 0,
            \ })
let g:unite_source_codesearch_ignore_case = 1
let g:unite_source_buffer_time_format = '(%m-%d-%Y %H:%M:%S) '
let g:unite_source_file_mru_time_format = '(%m-%d-%Y %H:%M:%S) '
let g:unite_source_directory_mru_time_format = '(%m-%d-%Y %H:%M:%S) '
let g:unite_source_directory_mru_limit = 80
let g:unite_source_file_rec_max_depth = 6
let g:unite_enable_ignore_case = 1
let g:unite_enable_smart_case = 1
let g:unite_data_directory='~/.cache/unite'
"let g:unite_enable_start_insert=1
let g:unite_source_history_yank_enable=1
let g:unite_split_rule = 'botright'
let g:unite_winheight=15
let g:unite_source_grep_default_opts = '-iRHn'
            \ . " --exclude='tags'"
            \ . " --exclude='cscope*'"
            \ . " --exclude='*.svn*'"
            \ . " --exclude='*.log*'"
            \ . " --exclude='*tmp*'"
            \ . " --exclude-dir='**/tmp'"
            \ . " --exclude-dir='CVS'"
            \ . " --exclude-dir='.svn'"
            \ . " --exclude-dir='.git'"
            \ . " --exclude-dir='node_modules'"
            \ . " --exclude-dir='bower_components'"
let g:unite_source_menu_menus = get(g:,'unite_source_menu_menus',{})
let g:unite_source_menu_menus.git = {
            \ 'description' : '            gestionar repositorios git
            \                            ? [espacio]g',
            \}
let g:unite_source_menu_menus.git.command_candidates = [
            \['? tig                                                        ? ,gt',
            \'normal ,gt'],
            \['? git status       (Fugitive)                                ? ,gs',
            \'Gstatus'],
            \['? git diff         (Fugitive)                                ? ,gd',
            \'Gdiff'],
            \['? git commit       (Fugitive)                                ? ,gc',
            \'Gcommit'],
            \['? git log          (Fugitive)                                ? ,gl',
            \'exe "silent Glog | Unite quickfix"'],
            \['? git blame        (Fugitive)                                ? ,gb',
            \'Gblame'],
            \['? git stage        (Fugitive)                                ? ,gw',
            \'Gwrite'],
            \['? git checkout     (Fugitive)                                ? ,go',
            \'Gread'],
            \['? git rm           (Fugitive)                                ? ,gr',
            \'Gremove'],
            \['? git mv           (Fugitive)                                ? ,gm',
            \'exe "Gmove " input("destino: ")'],
            \['? git push         (Fugitive, salida por buffer)             ? ,gp',
            \'Git! push'],
            \['? git pull         (Fugitive, salida por buffer)             ? ,gP',
            \'Git! pull'],
            \['? git prompt       (Fugitive, salida por buffer)             ? ,gi',
            \'exe "Git! " input("comando git: ")'],
            \['? git cd           (Fugitive)',
            \'Gcd'],
            \]
"===============================================================================
" HTTP Status Code Definitions
"===============================================================================
let g:unite_source_menu_menus.StatusCodeDefinitions = {'description': 'HTTP status code definitions             <leader>sc'}
let g:unite_source_menu_menus.StatusCodeDefinitions.command_candidates = [
    \['? 100 Continue                                                   ', 'echo "Continue"'],
    \['? 101 Switching Protocols                                        ', 'echo "Switching Protocols"'],
    \['? 200 OK                                                         ', 'echo "OK"'],
    \['? 201 Created                                                    ', 'echo "Created"'],
    \['? 202 Accepted                                                   ', 'echo "Accepted"'],
    \['? 203 Non-Authoritative Information                              ', 'echo "Non-Authoritative Information"'],
    \['? 204 No Content                                                 ', 'echo "No Content"'],
    \['? 205 Reset Content                                              ', 'echo "Reset Content"'],
    \['? 206 Partial Content                                            ', 'echo "Partial Content"'],
    \['? 300 Multiple Choices                                           ', 'echo "Multiple Choices"'],
    \['? 301 Moved Permanently                                          ', 'echo "Moved Permanently"'],
    \['? 302 Found                                                      ', 'echo "Found"'],
    \['? 303 See Other                                                  ', 'echo "See Other"'],
    \['? 304 Not Modified                                               ', 'echo "Not Modified"'],
    \['? 305 Use Proxy                                                  ', 'echo "Use Proxy"'],
    \['? 307 Temporary Redirect                                         ', 'echo "Temporary Redirect"'],
    \['? 400 Bad Request                                                ', 'echo "Bad Request"'],
    \['? 401 Unauthorized                                               ', 'echo "Unauthorized"'],
    \['? 402 Payment Required                                           ', 'echo "Payment Required"'],
    \['? 403 Forbidden                                                  ', 'echo "Forbidden"'],
    \['? 404 Not Found                                                  ', 'echo "Not Found"'],
    \['? 405 Method Not Allowed                                         ', 'echo "Method Not Allowed"'],
    \['? 406 Not Acceptable                                             ', 'echo "Not Acceptable"'],
    \['? 407 Proxy Authentication Required                              ', 'echo "Proxy Authoritative Required"'],
    \['? 408 Request Timeout                                            ', 'echo "Request Timeout"'],
    \['? 409 Conflict                                                   ', 'echo "Conflict"'],
    \['? 410 Gone                                                       ', 'echo "Gone"'],
    \['? 411 Length Required                                            ', 'echo "Length Required"'],
    \['? 412 Precondition Failed                                        ', 'echo "Precondition Failed"'],
    \['? 413 Request Entity Too Large                                   ', 'echo "Request Entity Too Large"'],
    \['? 414 Request-URI Too Long                                       ', 'echo "Request-URI Too Long"'],
    \['? 415 Unsupported Media Type                                     ', 'echo "Unsupported Media Type"'],
    \['? 416 Requested Range Not Satisfiable                            ', 'echo "Requested Range Not Satisfiable"'],
    \['? 417 Expectation Failed                                         ', 'echo "Expectation Failed"'],
    \['? 422 Unprocessable Entity                                       ', 'echo "Unprocessable Entity"'],
    \['? 500 Internal Server Error                                      ', 'echo "Internal Server Error"'],
    \['? 501 Not Implemented                                            ', 'echo "Not Implemented"'],
    \['? 502 Bad Gateway                                                ', 'echo "Bad Gateway"'],
    \['? 503 Service Unavailable                                        ', 'echo "Service Unavailable"'],
    \['? 504 Gateway Timeout                                            ', 'echo "Gateway Timeout"'],
    \['? 505 HTTP Version Not Supported                                 ', 'echo "HTTP Version Not Supported"'],
    \]
nnoremap <silent><leader>sc :Unite -silent -winheight=17 -start-insert menu:StatusCodeDefinitions<CR>
let g:unite_source_grep_max_candidates = 200
if executable('hw')
    " Use hw (highway)
    " https://github.com/tkengo/highway
    let g:unite_source_grep_command = 'hw'
    let g:unite_source_grep_default_opts = '--no-group --no-color'
    let g:unite_source_grep_recursive_opt = ''
elseif executable('ag')
    " Use ag (the silver searcher)
    " https://github.com/ggreer/the_silver_searcher
    let g:unite_source_grep_command = 'ag'
    let g:unite_source_grep_default_opts =
                \ '-i --line-numbers --nocolor --nogroup --hidden --ignore ' .
                \  '''.hg'' --ignore ''.svn'' --ignore ''.git'' --ignore ''.bzr'' --ignore ''bower_components'' --ignore ''node_modules'''
    let g:unite_source_grep_recursive_opt = ''
elseif executable('pt')
    " Use pt (the platinum searcher)
    " https://github.com/monochromegane/the_platinum_searcher
    let g:unite_source_grep_command = 'pt'
    let g:unite_source_grep_default_opts = '--nogroup --nocolor'
    let g:unite_source_grep_recursive_opt = ''
elseif executable('ack-grep')
    " Use ack
    " http://beyondgrep.com/
    let g:unite_source_grep_command = 'ack-grep'
    let g:unite_source_grep_default_opts =
                \ '-i --no-heading --no-color -k -H'
    let g:unite_source_grep_recursive_opt = ''
elseif executable('ack')
    let g:unite_source_grep_command = 'ack'
    let g:unite_source_grep_default_opts = '-i --no-heading --no-color -k -H'
    let g:unite_source_grep_recursive_opt = ''
elseif executable('jvgrep')
    " Use jvgrep
    " https://github.com/mattn/jvgrep
    let g:unite_source_grep_command = 'jvgrep'
    let g:unite_source_grep_default_opts = '-i --exclude ''\.(git|svn|hg|bzr)'''
    let g:unite_source_grep_recursive_opt = '-R'
endif
let g:unite_source_rec_async_command =
            \ ['ag', '--follow', '--nocolor', '--nogroup',
            \  '--hidden', '-g', '']
"nnoremap <silent><leader>ufa :<C-u>Unite -no-split -buffer-name=Mixed -start-insert file file_mru file_rec buffer<cr>
nnoremap <silent><C-p> :<C-u>Unite -buffer-name=files file_rec/async:!<cr>
"nnoremap <silent><leader>ufg :<C-u>Unite -buffer-name=git-repo file_rec/git<cr>
call unite#custom#profile('file_rec/async,file_rec/git', 'context', {
            \   'start_insert' : 1,
            \   'quit'         : 1,
            \   'split'        : 1,
            \   'keep_focus'   : 1,
            \   'winheight'    : 20,
            \ })
call unite#custom#source('file_rec/async', 'ignore_globs',['*.png','.git/','*.ttf', 'bower_components/', 'node_modules/'])
"nnoremap <silent><leader>uf  :<C-u>Unite -no-split -buffer-name=files -start-insert file<cr>
"nnoremap <silent><leader>ufm :<C-u>Unite -no-split -buffer-name=mru   -start-insert file_mru<cr>
"nnoremap <silent><leader>utb :<C-u>Unite -buffer-name=buffer_tab  buffer_tab<cr>
call unite#custom#profile('buffer,buffer_tab', 'context', {
            \   'start_insert' : 0,
            \   'quit'         : 1,
            \   'keep_focus'   : 1,
            \ })
"nnoremap <silent><leader>um  :<C-u>Unite -start-insert mapping<CR>
"nnoremap <C-h>  :<C-u>Unite -start-insert help<CR>
"nnoremap <silent> g<C-h>  :<C-u>UniteWithCursorWord help<CR>
"" Tag search
""" For searching the word in the cursor in tag file
"nnoremap <silent><leader>f :<c-u>Unite tag/include:<C-R><C-w><CR>
"nnoremap <silent><leader>ff :<c-u>Unite tag/include -start-insert<CR>
"" grep dictionay
""" For searching the word in the cursor in the current directory
nnoremap <silent>K :Unite -auto-preview -no-split grep:.::<C-R><C-w><CR>
nnoremap <silent><leader>g :Unite -auto-preview -no-split grep:.::<CR>
"nnoremap <space>/ :Unite -auto-preview grep:.<cr>
""" For searching the word handin
"nnoremap <silent><leader>vs :Unite -auto-preview -no-split grep:.<CR>
""" For searching the word in the cursor in the current buffer
"noremap <silent><leader>vf :Unite -auto-preview -no-split grep:%::<C-r><C-w><CR>
""" For searching the word in the cursor in all opened buffer
"noremap <silent><leader>va :Unite -auto-preview -no-split grep:$buffers::<C-r><C-w><CR>
"nnoremap <silent><Leader>bl :<C-u>Unite -start-insert -buffer-name=buffer buffer<cr>
"" outline
"nnoremap <silent><leader>o :<C-u>Unite -buffer-name=outline -start-insert -auto-preview -no-split outline<cr>
"" Line search
"nnoremap <silent><leader>l :Unite line -start-insert  -auto-preview -no-split<CR>
"" Yank history
"nnoremap <silent><leader>y :<C-u>Unite -no-split -buffer-name=yank history/yank<cr>
" search plugin
" :Unite neobundle/search
"for Unite menu{
"nnoremap <silent><leader>ug :Unite -silent -start-insert menu:git<CR>
" The prefix key.
"nnoremap    [unite]   <Nop>
"nmap    f [unite]
"nnoremap <silent> [unite]c  :<C-u>UniteWithCurrentDir
            "\ -buffer-name=files buffer bookmark file<CR>
"nnoremap <silent> [unite]b  :<C-u>UniteWithBufferDir
            "\ -buffer-name=files -prompt=%\  buffer bookmark file<CR>
"nnoremap <silent> [unite]r  :<C-u>Unite
            "\ -buffer-name=register register<CR>
"nnoremap <silent> [unite]o  :<C-u>Unite outline<CR>
"nnoremap <silent> [unite]s  :<C-u>Unite session<CR>
"nnoremap <silent> [unite]n  :<C-u>Unite session/new<CR>
"nnoremap <silent> [unite]fr
            "\ :<C-u>Unite -buffer-name=resume resume<CR>
"nnoremap <silent> [unite]ma
            "\ :<C-u>Unite mapping<CR>
"nnoremap <silent> [unite]me
            "\ :<C-u>Unite output:message<CR>
"nnoremap  [unite]f  :<C-u>Unite source<CR>
"nnoremap <silent> [unite]w
            "\ :<C-u>Unite -buffer-name=files -no-split
            "\ jump_point file_point buffer_tab
            "\ file_rec:! file file/new<CR>
"nnoremap <silent>[unite]<Space> :Unite -silent -ignorecase -winheight=17 -start-insert menu:CustomKeyMaps<CR>
"nnoremap <silent><Leader>ls :Unite -silent -ignorecase -winheight=17 -start-insert menu:MyStarredrepos<CR>
augroup unite_buffer_feature
    autocmd FileType unite call s:unite_my_settings()
augroup END
function! s:unite_my_settings()
  let b:SuperTabDisabled=1
  imap <buffer> <C-j> <Plug>(unite_select_next_line)
  imap <buffer> <C-k> <Plug>(unite_select_previous_line)
  inoremap <silent><buffer><expr> <CR>     unite#do_action('open')
  inoremap <silent><buffer><expr> <C-v>     unite#do_action('vsplit')
  inoremap <silent><buffer><expr> <C-x>     unite#do_action('split')
endfunction