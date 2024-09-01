return {
    "windwp/nvim-ts-autotag",
    event = "BufRead",
    config = function()
        require('nvim-ts-autotag').setup({
            filetypes = {
                'html', 'javascript', 'typescript', 'javascriptreact', 'typescriptreact', 'svelte', 'vue', 'tsx', 'jsx',
                'rescript',
                'xml',
                'php',
                'markdown',
                'astro', 'glimmer', 'handlebars', 'hbs', 'liquid'
            }
        })
    end
}
