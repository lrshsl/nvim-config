
return {
	"lervag/vimtex",
	ft = "tex", -- Lazy load on tex files
	config = function()
		vim.cmd[[
		filetype plugin indent on
		syntax enable

		let g:vimtex_view_method = 'zathura'

		" see ":help vimtex-compiler".
		let g:vimtex_compiler_method = 'latexmk'

		let maplocalleader = '\'
		]]
	end
}
