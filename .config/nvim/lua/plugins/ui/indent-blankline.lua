return {
    'lukas-reineke/indent-blankline.nvim',
    main = 'ibl',
    event = { 'BufReadPost', 'BufNewFile' },
    opts = {
        indent = {
            char = '▏', -- VS Code uses a thin line character
            tab_char = '▏', -- Same for tab indentation
        },
        scope = {
            enabled = false, -- Scope highlighting is generally not used in VS Code
        },
        exclude = {
            filetypes = {
                'help',
                'dashboard',
                'neo-tree',
                'Trouble',
                'lazy',
                'mason',
                'notify',
                'toggleterm',
                'lazyterm',
                'NvimTree', -- Exclude file explorer
                'fugitive', -- Exclude Git status files
            },
        },
    },
    config = function(_, opts)
        require('ibl').setup(opts)

        -- Mimic VS Code’s indentation guide color
        vim.api.nvim_set_hl(0, 'IblIndent', { fg = '#dcdcdc', nocombine = true }) -- Light gray color
    end,
}
