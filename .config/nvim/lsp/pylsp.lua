return {
    cmd = {
        "pylsp",
    },
	filetypes = {
		"python",
	},
    root_markers = {
        "pyproject.toml",
        "setup.py",
        "setup.cfg",
        "requirements.txt",
        "Pipfile",
    },
	settings = {
	    python = {
	    },
	},

	single_file_support = true,
	log_level = vim.lsp.protocol.MessageType.Warning,
}
