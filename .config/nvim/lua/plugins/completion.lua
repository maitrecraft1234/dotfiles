return {
    {
        'saghen/blink.cmp',
        dependencies = {
            "fang2hou/blink-copilot",
            'rafamadriz/friendly-snippets',
            'saghen/blink.compat',
        },

        version = '1.*',

        opts = {
            completion = {
                documentation = { auto_show = true, auto_show_delay_ms = 200 },
                ghost_text = { enabled = true },
                accept = { auto_brackets = { enabled = true } },
            },

            keymap = {
                preset = 'default',
                ["<C-y>"] = { "accept", "fallback" },
            },

            sources = {
                default = { "copilot", "lsp", "path", "snippets", "buffer" },
                providers = {
                    copilot = {
                        module = "blink-copilot",
                        -- score_offset = 100,
                        -- async = true,
                    },
                },
            },
            appearance = {
                use_nvim_cmp_as_default = true,
                nerd_font_variant = 'mono'
            },

            signature = { enabled = true }
        },

        config = function(_, opts)
            require('blink.cmp').setup(opts)
        end,
    },
}
