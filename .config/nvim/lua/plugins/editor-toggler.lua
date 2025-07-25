return {
    'nguyenvukhang/nvim-toggler',
    event = { "BufReadPre", "BufNewFile" },
    opts = {
        inverses = {
            ['vim'] = 'emacs',
            ['true'] = 'false',
            ['True'] = 'False',
            ['yes'] = 'no',
            ['on'] = 'off',
            ['left'] = 'right',
            ['up'] = 'down',
            ['enable'] = 'disable',
            ['!='] = '==',
            ['1'] = '0',
            ['0'] = '1',
            ['in'] = 'out',
            ['out'] = 'in',
            ['break'] = 'continue',
            ['continue'] = 'break',
            ['get'] = 'set',
            ['Get'] = 'Set',
            ['set'] = 'get',
            ['Set'] = 'Get',
            ['struct'] = 'class',
            ['class'] = 'enum',
            ['enum'] = 'union',
            ['union'] = 'struct',
            ['||'] = '&&',
            ['&&'] = '||',
            ['|'] = '&',
            ['&'] = '|',
            ['++'] = '--',
            ['--'] = '++',
            ['->'] = '.',
            ['.'] = '->',
            ['and'] = 'or',
            ['or'] = 'and',
        },
        remove_default_keybinds = false, -- default: <leader>i
        remove_default_inverses = true,
        autoselect_longest_match = true
    },
    config = function (_, opts)
        require('nvim-toggler').setup(opts)
    end
}
