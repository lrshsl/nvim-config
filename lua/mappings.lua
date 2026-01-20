local wk = require 'which-key'
local telescope = require 'telescope.builtin'
local session_man = require 'session_manager'
local noice = require 'noice'
-- local harpoon = require 'harpoon'

wk.add {
   --> Leader mappings
   {
      { 'gh',        '<cmd>Ouroboros<CR>',         desc = 'Goto header/source' },

      { '<space>m',  group = 'messages' },
      { '<space>ml', '<cmd>Noice last<CR>',        desc = 'Last message' },
      { '<space>mm', '<cmd>Noice history<CR>',     desc = 'History' },
      { '<space>md', '<cmd>Noice diagnostics<CR>', desc = 'Diagnostics' },
      { '<space>me', '<cmd>Noice errors<CR>',      desc = 'Errors' },
      { '<space>m;', '<cmd>Noice dismiss<CR>',     desc = 'Dismiss' },

      --> File navigation
      { '<space>o',  group = 'open' },
      { '<space>oo', '<cmd>Neotree toggle<cr>',    desc = 'File tree' },
      { '<space>od',
         '<cmd>Trouble lsp_errors toggle focus=true win.position=right<CR>',
         desc = 'Errors', silent = true, },
      { '<space>oD',
         '<cmd>Trouble diagnostics toggle focus=true win.position=right<CR>',
         desc = 'Diagnostics', silent = true, },
      { '<space>os',
         ':Trouble symbols toggle focus=true win.position=right<CR>',
         desc = 'Bufffer symbols', silent = true, },

      -- { '<leader>gh', function() harpoon.ui:toggle_quick_menu(harpoon:list()) end },
      -- { '<leader>ga', function() harpoon:list():append() end },
      -- { '<leader>gj', function() harpoon:list():select(1) end },
      -- { '<leader>gk', function() harpoon:list():select(2) end },
      -- { '<leader>gl', function() harpoon:list():select(3) end },
      -- { '<leader>g;', function() harpoon:list():select(4) end },

      --> Find
      { '<space>ft',       telescope.builtin,                                          desc = 'Find Telescope commands' },

      { '<space>f',        group = 'find' },
      { '<space>fd',       telescope.diagnostics,                                      desc = 'Find diagnostics' },
      { '<space>fr',       telescope.lsp_references,                                   desc = 'Find References' },
      { '<space>fh',       telescope.help_tags,                                        desc = 'Find Help' },

      { '<space>fg',       telescope.live_grep,                                        desc = 'Live grep' },

      { '<space>ff',       '<cmd>BrootWorkingDir<CR>',                                 desc = 'Find Files' },
      { '<space>fl',       '<cmd>BrootCurrentDir<CR>',                                 desc = 'Find local Files' },
      { '<space>fa',       '<cmd>Telescope find_files hidden=true<CR>',                desc = 'Find All Files (also hidden)' },
      { '<space>fA',       '<cmd>Telescope find_files hidden=true no_ignore=true<CR>', desc = 'Find All Files (hidden & ignored)' },
      { '<space>fb',       telescope.buffers,                                          desc = 'Find Buffers' },
      { '<space>fo',       telescope.oldfiles,                                         desc = 'Open Recent File' },

      { '<space>fs',       '<cmd>Vista finder<CR>',                                    desc = 'Find Document Symbols' },
      { '<space>fS',       telescope.symbols,                                          desc = 'Symbols' },
      { '<space>fw',       telescope.lsp_dynamic_workspace_symbols,                    desc = 'Workspace Symbols' },

      --> Git
      { '<space>g',        group = "git" },
      { '<space>g.',       '<cmd>Git<CR>',                                             desc = 'Git' },
      { '<space>g<space>', ':Git<space>',                                              desc = ':Git <CMD>' },

      { '<space>a',        group = "Harpoon" },

      --> Session
      { '<space>s',        group = 'session' },
      { '<space>ss',       session_man.save_current_session,                           desc = 'Save Session' },
      { '<space>sl',       session_man.load_session,                                   desc = 'Load Session' },
      { '<space>sL',       session_man.load_last_session,                              desc = 'Load Last Session' },
      { '<space>sd',       session_man.delete_session,                                 desc = 'Delete Session' },
      { '<space>sD', function()
         session_man.delete_current_dir_session()
         vim.cmd ":cd | bufdo bd!"
         session_man.load_session()
      end, desc = 'Delete Current Session' },
      { '<space>sc', [[ <cmd>cd | bufdo bd!<cr> ]], desc = 'Close Session' },

      --> Lsp
      { '<space>c',  group = 'code' },
      { '<space>ca', vim.lsp.buf.code_action,       desc = 'Code Action' },
      { '<space>ch', vim.lsp.buf.hover,             desc = 'Hover' },
      { '<space>cf', vim.lsp.buf.format,            desc = 'Format' },
      { '<space>cd', vim.diagnostic.open_float,     desc = 'Diagnostics' },
      { '<space>cr', function()
         return ":IncRename " .. vim.fn.expand("<cword>")
      end, desc = 'Rename', expr = true },

      { '<space>;u',  '<cmd>UndotreeToggle | UndotreeFocus<cr>', desc = 'Undo Tree' },
      { '<space>;z',  '<cmd>!zathura %:r.pdf &<cr>',             desc = 'Open in Zathura' },
      { '<space>;v',  '<cmd>Vista focus<cr>',                    desc = 'Focus / Open Vista' },

      --> Text editing
      { '<space>u',   'viw~',                                    desc = 'lower <-> UPPER' },
      { '<space>U',   'viW~',                                    desc = 'lower-word <-> UPPER-WORD' },
      { '<space>y',   '~<Left>',                                 desc = '~' },

      { '<space>;c',  group = "Change case" },
      { '<space>;cc', [[viw:s/\%V_\(\w\)/\u\1/g<CR>]],           desc = "snake_case -> camelCase" }, -- \%V represents the visual selection boundary. If not specified, s operates linewise
      { '<space>;cs', [[viw:s/\%V\(\u\)/_\l\1/g<CR>]],           desc = "camelCase -> snake_case" },

      --> Buffer
      { '<space>w',   ':w<CR>',                                  desc = 'write buffer' },
      { '<space>;w',  ':wa<CR>',                                 desc = 'write buffers' },
      { '<space>q',   ':q<CR>',                                  desc = 'quit buffer' },
      { '<space>;q',  ':qa<CR>',                                 desc = 'quit all' },

      --> Search and replace
      {
         mode = { 'n' },
         { '<space>*', ':%s/<C-r><C-w>/<C-r><C-w>/gc<Left><Left><Left>',
            desc = 'Search and replace (cursor)' },
         { '<space>;s', ':%s//gc<Left><Left><Left>',           desc = 'Search and replace' },
         { '<space>f*', '*<cmd>Telescope live_grep<CR><C-r>/', desc = 'Live grep' },

      },
      {
         mode = { 'v' },
         { '<space>*',  ':s/<C-r><C-w>/<C-r><C-w>/g<Left><Left>', desc = 'Search and replace (cursor)' },
         { '<space>;s', [[:s/\%V/g<Left><Left>]],                 desc = 'Search and replace' },
      },
   },

   --> Non prefix mappings
   {
      mode = { 'n', 'v' },
      { 'j', desc = 'which_key_ignore' }, -- Colemak remaps
      { 'h', desc = 'Left' },
      { 'n', desc = 'Down' },
      { 'e', desc = 'Up' },
      { 'i', desc = 'Right' },
      { 'l', desc = 'Insert' },
      { 'k', desc = 'End of word' },
      { 'H', desc = 'Start of line' },
      { 'I', desc = 'End of line' },

      { '$', desc = 'which_key_ignore' }, -- Shift-mappings
      { '^', desc = 'which_key_ignore' },
      { '_', desc = 'which_key_ignore' },
      { '0', desc = 'Start of line' },
   },

   { '-',  require 'oil'.open, desc = 'Oil' },

   { mode = { 'n', 'v', 'i' },
      { '<S-CR>', CustomShiftCR }
   },

   {
      mode = { 'n' },
      { '<A-h>', '<cmd>ClangdSwitchSourceHeader<CR>', desc = 'Switch source/header' },
   },

   --> Last macro
   { '\\', '@@',               desc = 'Last macro',              mode = 'n' },
   { '\\', ':normal @@<CR>',   desc = 'Last macro on each line', mode = 'v' },

   --> Insert mode mappings
   {
      mode = { 'i' },
      name = 'Abbreviations, umlauts and accents',
      { ';ae',  'ä', desc = 'ä', },
      { ';Ae',  'Ä', desc = 'Ä', },
      { ';AE',  'Ä', desc = 'Ä', },

      { ';oe',  'ö', desc = 'ö', },
      { ';Oe',  'Ö', desc = 'Ö', },
      { ';OE',  'Ö', desc = 'Ö', },

      { ';ue',  'ü', desc = 'ü', },
      { ';Ue',  'Ü', desc = 'Ü', },
      { ';UE',  'Ü', desc = 'Ü', },

      { ';ee',  'é', desc = 'é', },
      { ';eg',  'è', desc = 'è', },
      { ';ec',  'ê', desc = 'ê', },
      { ';cc',  'ç', desc = 'ç', },
      { ';ed',  'ë', desc = 'ë', },

      { ';ag',  'à', desc = 'à', },

      { ';yd',  'ÿ', desc = 'ÿ', },
      { ';aae', 'æ', desc = 'æ', },
      { ';ooe', 'œ', desc = 'œ', },
   }
}

-- wk.show{
-- 	keys = '<C-w>',
-- 	loop = true,
-- } -- ??
--
--> Resize splits with arrow keys
Nmap('<C-up>', ':res +5<CR>')
Nmap('<C-down>', ':res -5<CR>')
Nmap('<C-left>', ':vertical resize-2<CR>')
Nmap('<C-right>', ':vertical resize+2<CR>')

--> Terminal
require 'dropdown_terminal'

-- Tmap('<C-up>', '<cmd>res +5<CR>')
-- Tmap('<C-down>', '<cmd>res -5<CR>')
-- Tmap('<C-left>', '<cmd>vertical resize-2<CR>')
-- Tmap('<C-right>', '<cmd>vertical resize+2<CR>')

Nmap('<S-up>', MoveTermUp)
Nmap('<S-down>', MoveTermDown)
Nmap('<S-left>', MoveTermLeft)
Nmap('<S-right>', MoveTermRight)

--> Toggle terminal
Nmap('<leader>t', ToggleTerminal)
Tmap('tn', ToggleTerminal)
Tmap('<Esc><Esc>', '<C-\\><C-n>')

require 'settings'

--> Increase font size
Nmap('+', ChangeFontSize(0.5))
Nmap('_', ChangeFontSize(-0.5))

--> Code/text actions
Nmap('<space>;r', ':!')

vim.cmd [[

" Usable scrolling for non-vim people
set mouse=a
noremap <ScrollWheelUp> <C-Y>
noremap <ScrollWheelDown> <C-E>
noremap <S-ScrollWheelUp> 5<C-Y>
noremap <S-ScrollWheelDown> 5<C-E>
noremap <C-ScrollWheelUp> <C-+>
noremap <C-ScrollWheelDown> <C-->

" Paste in all modes "
nnoremap <MiddleMouse> i<MiddleMouse>
inoremap <C-S-v> <MiddleMouse>
nnoremap <C-S-v> i<MiddleMouse>

nnoremap <C-v> "+p
nnoremap <space>v <C-v>

" Yank to clipboard in visual with Y / ctrl-c ctrl-v "
vnoremap Y "+y
vnoremap <C-c> "+y
vnoremap <C-v> "+p

" Put yanked content in reg k "
noremap <space>P <cmd>let @k=@"<CR>
noremap <space>p "kp

" Paste on new line "
nnoremap <space>;p <cmd>pu<CR>==$
nnoremap <space>;P <cmd>pu!<CR>==$

" Scroll using Ctrl "
noremap <C-e> 10<C-e>
noremap <C-n> 10<C-y>

" <C-u> is already mapped
noremap <C-y> <C-d>

" Window navigation
"map <C-S-i> <cmd>wincmd l<CR>
"map <C-S-h> <cmd>wincmd h<CR>
"map <C-S-n> <cmd>wincmd j<CR>
"map <C-S-e> <cmd>wincmd k<CR>

tnoremap <C-S-i> <cmd>wincmd l<CR>
tnoremap <C-S-h> <cmd>wincmd h<CR>
tnoremap <C-S-n> <cmd>wincmd j<CR>
tnoremap <C-S-e> <cmd>wincmd k<CR>

nnoremap <space>i <cmd>wincmd l<CR>
nnoremap <space>h <cmd>wincmd h<CR>
nnoremap <space>n <cmd>wincmd j<CR>
nnoremap <space>e <cmd>wincmd k<CR>

" Stop highlight "
noremap <C-;> <cmd>noh<CR>
]]

--vim.cmd " map [[ [{ "
--vim.cmd " map ]] [}<CR> "

vim.cmd [[
" Move to line
"map <space>l <Plug>(easymotion-bd-jk)
"nmap <space>l <Plug>(easymotion-overwin-line)

" Move to word
"map  <space>w <Plug>(easymotion-bd-w)
"nmap <space>w <Plug>(easymotion-overwin-w)

" Run commands "
nnoremap <space>rr :!
nnoremap <space>rs :so ~/.config/nvim/init.lua<CR>
nnoremap <space>rm :make<space>

nnoremap <space>ra :lua ToggleTerminal()<CR>
nnoremap <space>rf :lua ToggleTerminal()<CR>

augroup CMD_RUN
	autocmd!

	" Rust "
	autocmd BufReadPre *.rs,Cargo.*               nnoremap <space>ra   :!cargo r --<space>
	autocmd BufReadPre *.rs,Cargo.*               nnoremap <space>rf   :!rustc -o rs.out % && ./rs.out

	" Make | CMake | C | C++ "
	autocmd BufNewFile,BufRead *.c,*.h,Makefile   nnoremap <space>ra   :!make<space>
	autocmd BufNewFile,BufRead *.cpp,*.hh,*.hpp   nnoremap <space>ra   :!make<space>
	autocmd BufNewFile,BufRead *.c,*.h            nnoremap <space>rf   :!gcc -Wall -Wextra -std=c11 -pedantic -o c.out % ; ./c.out
	autocmd BufNewFile,BufRead *.c,*.h            setlocal ft=c
	autocmd BufNewFile,BufRead *.cpp,*.hh,*.hpp   nnoremap <space>rf   :!g++ -Wall -Wextra -std=c++17 -pedantic -o a.out % ; ./a.out

	autocmd BufNewFile,BufRead *.c,*.h            nnoremap <space>re   :!gcc -E -Wall -Wextra -std=c11 -pedantic -o c.out % ; ./c.out
	autocmd BufNewFile,BufRead *.cpp,*.hh,*.hpp   nnoremap <space>re   :%!g++ -E -Wall -Wextra -std=c++17 -pedantic -o a.out % ; ./a.out

	autocmd BufNewFile,BufRead *.hs               nnoremap <space>ra   :!stack run
	autocmd BufNewFile,BufRead *.hs               nnoremap <space>rf   :!ghc % -no-keep-hi-files -no-keep-o-files ; %:r

	" Python, js, go "
	autocmd BufNewFile,BufRead *.py               nnoremap <space>ra   :!python main.py
	autocmd BufNewFile,BufRead *.py               nnoremap <space>cf   :!autopep8 -i %<CR>
	autocmd BufNewFile,BufRead *.py               nnoremap <space>rf   :!python %
	autocmd BufNewFile,BufRead *.js               nnoremap <space>ra   :!node<space>
	autocmd BufNewFile,BufRead *.go               nnoremap <space>ra   :!go run<space>

	" Lua | Vim "
	autocmd BufNewFile,BufRead *.lua              nnoremap <space>ra   :!lua<space>
	autocmd BufNewFile,BufRead *.lua,*.vim        nnoremap <space>rf   :so %

	" V "
	autocmd BufNewFile,BufRead *.v                nnoremap <space>ra   :!v crun .<space>
	autocmd BufNewFile,BufRead *.v                nnoremap <space>rf   :!v crun %

	autocmd BufNewFile,BufRead *.rkt              nnoremap <space>rf   :!racket %
	autocmd BufNewFile,BufRead *.rkt              nnoremap <space>rr   :vertical rightbelow Repl<CR>

	" Nim "
	autocmd BufNewFile,BufRead *.nim              nnoremap <space>ra   :!nimble run --<space>
	autocmd BufNewFile,BufRead *.nim              nnoremap <space>rf   :!nim c -r %

	" Java && Gradle "
	autocmd BufNewFile,BufRead *.java             nnoremap <space>ra   :!./gradlew run
	autocmd BufNewFile,BufRead *.java             nnoremap <space>rf   :!javac % && java %:t:r
	autocmd BufNewFile,BufRead *.java             nnoremap <space>rb   :!gradle build

	" Br*infuck "
	autocmd BufNewFile,BufRead *.bf               nnoremap <space>ra   :!bf % && ./a.out

	" Assembly "
	autocmd BufNewFile,BufRead *.asm              nnoremap <space>ra   :!make && ./a.out
	autocmd BufNewFile,BufRead *.asm              nnoremap <space>rf   :!nasm -f elf64 -o out.o % && ld -o out out.o && ./out

	" Markdown -> PDF "
	autocmd BufNewFile,BufRead *.md,*.tex         nnoremap <space>ra   :!pandoc % -o out.pdf

	autocmd BufNewFile,BufRead *.typ              nnoremap <space>rf   :!typst compile %
	autocmd BufNewFile,BufRead *.typ              nnoremap <space>ra   :!typst watch % &
	autocmd BufNewFile,BufRead *.typ              nnoremap <space>rn   :!typst c % --root ../../

	autocmd BufNewFile,BufRead *.exr              nnoremap <space>rf   :!cargo r -- expand %
augroup END
]]

local function exactly(keys)
   return vim.api.nvim_replace_termcodes(keys, true, true, true)
end

local function contains(t, key)
   for k, _ in pairs(t) do
      if k == key then
         return true
      end
   end
   return false
end

local function get_line_ending(ft)
   if contains({ 'rust', 'c', 'cpp' }, ft) then
      return ';'
   end
   return ''
end

-- Function to map Shift-CR to custom behavior
function CustomShiftCR()
   local ft = vim.bo.filetype
   print(ft)
   if ft == 'typst' then
      vim.api.nvim_feedkeys(exactly '<cr><cr><up><tab>')
      return
   end

   local ending = get_line_ending(ft)
   vim.api.nvim_feedkeys(exactly '<down>' .. ending .. '<left>' * #ending, 'n', false)
end

vim.cmd [[

" Codeium "
"imap <script><silent><nowait><expr> <C-y> codeium#Accept()
imap <C-;>   <Cmd>call codeium#CycleCompletions(1)<CR>
imap <C-:>   <Cmd>call codeium#CycleCompletions(1)<CR>
imap <C-[>   <Cmd>call codeium#Clear()<CR>

" Correct last spelling mistake "
noremap <C-l> <C-g>u<esc>[s1z=`]a<C-g>u

" Colemak Mappings
inoremap tn <esc>
inoremap TN <esc>

nnoremap m n
nnoremap M N

noremap n j
noremap e k
noremap k e
noremap E K
noremap K E

noremap i l
noremap l i
noremap I L
noremap L I

" Needed for some reason
nnoremap dl dl
nnoremap di di
nnoremap vl vl
nnoremap vi vi
nnoremap cl cl
nnoremap ci ci

" Alias beginning and end of line "
noremap H 0
noremap I <end>

" Jump Up/Down with Shift "
noremap N 5<down>
noremap E 5<up>

" Left and right without leaving insert mode
"inoremap <C-h> <C-o><Left>
"inoremap <C-i> <right>
"inoremap <C-e> <up>
"inoremap <C-n> <down>

]]
