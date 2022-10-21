-- a snippet for snippet creation
s({trig=";a", snippetType="autosnippet"},
    {
        t("\\alpha"),
    }
)
s({trig=";b", snippetType="autosnippet"},
    {
        t("\\beta"),
    }
)


-- s({trig="snippet", dscr="Basic Snippet with text"},
--     fmta( 
--     [[
--         s({trig="<>"},
--           fmta(
--                 <>
--                 {
--                     i(1),
--                 }
--             )
--         ),
--     ]],
--         {
--             i(1),
--             i(2)
--         }
--     )
-- ),
-- s({trig="asnippet", dscr="Autosnippet"},
--     fmta(
--     [[
--         s({trig="<>", snippetType="autosnippet"},
--           fmta(
--             \[\[
--                 <>
--             \]\],
--                 {
--                     i(1),
--                 }
--             )
--         ),
--     ]],
--         {
--             i(1),
--             i(2)
--         }
--     )
-- ),
