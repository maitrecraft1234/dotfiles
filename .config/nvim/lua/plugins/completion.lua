return {
    {
        'saghen/blink.cmp',
        dependencies = {
            "fang2hou/blink-copilot",
            'rafamadriz/friendly-snippets',
        },

        version = '1.*',

        opts = {
            keymap = {
                preset = 'default',
                ["<C-y>"] = { "accept", "fallback" },
            },

            sources = {
                default = { "copilot", "lsp", "path", "snippets", "buffer" },
                providers = {
                    copilot = {
                        name = "copilot",
                        module = "blink-copilot",
                        score_offset = 100,
                        async = true,
                    },
                },
            },
            appearance = {
                use_nvim_cmp_as_default = true,
                nerd_font_variant = 'mono'
            },

            signature = { enabled = true }
        },
    },
}
