-- Local shortcuts
-- local ls = require("luasnip")
-- local s = ls.snippet
-- local sn = ls.snippet_node
-- local t = ls.text_node
-- local i = ls.insert_node
-- local f = ls.function_node
-- local d = ls.dynamic_node
-- local fmt = require("luasnip.extras.fmt").fmt
-- local fmta = require("luasnip.extras.fmt").fmta
-- local rep = require("luasnip.extras").rep
return {
    -- a snippet for snippet creation
    s({trig="snippet", dscr="Basic Snippet with text"},
        fmta( 
        [[
             s({trig="<>", dscr="<>"},
               fmta(
               [[
                     <>
               ]<>],
                     {
                         i(1),<>
                     }
                 )
             ),
        ]],
            {
                i(1, "trigger"),
                i(2, "description"),
                i(3, "body"),
                i(4),
                i(5)
            }
        )
    ),
    s({trig="symbol", dscr="Snippet with simple text"},
        fmta( 
        [[
             s({trig="<>", dscr="<>"},
                {t("\\<>")}
             ),
        ]],
            {
                i(1, "trigger"),
                i(2, "description"),
                i(3, "text"),
            }
        )
    ),
}, {
    -- %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    -- AUTOSNIPPETS HERE 
}
