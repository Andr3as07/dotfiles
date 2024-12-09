return {
    "rrethy/vim-illuminate",
    config = function(_, opts)
        require("illuminate").configure(opts)
    end
}
