return {
   "lervag/vimtex",
   dependencies = { { "barreiroleo/ltex-extra.nvim", opts = {} } },
   ft = "tex", -- Lazy load on tex files
   init = function()
      vim.cmd [[
         filetype plugin indent on
         syntax enable
      ]]

      vim.g.vimtex_view_method = 'zathura'
      vim.g.vimtex_compiler_method = 'latexmk'

      vim.g.vimtex_compiler_latexmk = {
         build_dir = 'build',
         options = {
            '-pdf',
            '-interation=nonstopmode',
            '-file-line-error',
         }
      }

      vim.g.vimtex_syntax_enabled = 1
      vim.g.vimtex_complete_enabled = 1
   end,
   config = function()
      vim.api.nvim_create_autocmd('FileType', {
         pattern  = { 'tex', 'md' },
         callback = function()
            local opts = { noremap = true, silent = true, buffer = true }
            local imap = function(key, val)
               vim.keymap.set('i', key, val, opts)
            end

            imap('`` ', '\\texttt{}<left>')
            imap('__', '\\emph{}<left>')
            imap('**', '\\textbf{}<left>')
            imap(';_', '\\underline{}<left>')

            imap('xx ', '\\cdot ')
            imap('// ', '\\frac{}<left>')

            imap('```', '\\begin{lstlisting}<CR><CR>\\end{lstlisting}<up><tab>')
            imap(';-', '\\begin{itemize}<CR><CR>\\end{itemize}<up><tab>')
            imap(';1', '\\begin{enumerate}<CR><CR>\\end{enumerate}<up><tab>')
            imap('* ', '\\item ')

            imap(';# ', '\\section{}<left>')
            imap(';## ', '\\subsection{}<left>')

            imap(';beg', '\\begin{}<CR>\\end{}<left>')

            imap(';temp', [[\documentclass[12pt]{article}
\usepackage{amsmath}
\usepackage{amsfonts}
\usepackage{geometry}
\usepackage{graphicx}
\usepackage{fancyhdr}
\usepackage{hyperref}
\usepackage{enumerate}
\usepackage{tikz}
\usepackage{listings}

\geometry{top=3cm, bottom=2cm, left=2cm, right=2cm}
\setlength{\headheigt}{14.5pt}

\pagestyle{fancy}
\fancyhead[L]{}
\fancyhead[C]{}
\fancyhead[R]{}
\fancyhead[C]{\thepage}

\title{}
\author{lrs}
\date{\today}

\begin{document}

\maketitle
\newpage

\tableofcontents
\newpage

\end{document}
]])
         end
      })
   end
}
