return {
	'aohoyd/broot.nvim',
	lazy = false,
	opts = {
		broot_vim_conf = {
			"verbs: [",
			"  {",
			"    key: enter",
			'    external: "echo +{line} {file}"',
			'    apply_to: "file"',
			"  }",
			"  {",
			"    invocation: cr {subpath}",
			'    external: ["sh", "-c", "touch \\"{directory}/{subpath}\\" && echo \\"+0 {directory}/{subpath}\\""]',
			"    leave_broot: true",
			"  }",
			"]",
		},
	},
	keys = {
		{ '<space>ff', '<cmd>BrootWorkingDir<CR>', desc = 'Find Files' },
		{ '<space>fl', '<cmd>BrootCurrentDir<CR>', desc = 'Find local Files' },
	}
}
