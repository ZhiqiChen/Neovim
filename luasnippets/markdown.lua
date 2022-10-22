
-- get visual function
local get_visual = function(args, parent)
  if (#parent.snippet.env.SELECT_RAW > 0) then
    return sn(nil, i(1, parent.snippet.env.SELECT_RAW))
  else  -- If SELECT_RAW is empty, return a blank insert node
    return sn(nil, i(1))
  end
end

-- vimtex doesn't work in markdown files
-- local in_mathzone = function(args, parent)
--     return vim.fn['vimtex#syntax#in_mathzone']() == 1
-- end

return {
    s({trig="link", dscr="markdown link"},
        fmta(
        [[
           [<>](<>) 
        ]], 
            {
                i(1, "title"),
                i(2, "link")
            }
        )
    ),
    s({trig="linkInternal", dscr="link to header/sub-headers"},
        fmta(
        [[
            [<>](#<>)
      ]],
            {
                i(1, "title"),
                i(2, "link")
            }
        )
    ),
    s({trig="image", dscr="markdown image"},
      fmta(
      [[
            ![<>](<>)
      ]],
            {
                i(1, "title"),
                i(2, "link")
            }
        )
    ),
    s({trig="table", dscr="markdown table 3x3"},
        fmta(
            [[
            |   <>   |   <>   |   <>   |
            | --------- |-------------  | ------- |
            |        |           |        |
            |        |           |        | 
      ]],
            {
                i(1),
                i(2),
                i(3)
            }
        )
    ),
    s({trig="env", dscr="begin environment"},
        fmta(
            [[
              \begin{<>}
                  <>
              \end{<>}
            ]],
            {
                i(1),
                i(0),
                rep(1),  -- this node repeats insert node i(1)
            }
        )
    ),
    s({trig="definition", dscr="Definition"},
        fmta(
            [[
           <>
           : <> $\boxed{<>}$ 
      ]],
            {
                i(1),
                i(2),
                i(3),
            }
        )
    ),
    s({trig = "([^%a])mm", wordTrig = true},
        fmta(
            "<>$<>$",
            {
                f( function(_, snip) return snip.captures[1] end ),
                i(1),
            }
        )
    ),
        s({trig="matrix", dscr="make a matrix"},
          fmta(
          [[
                \begin{bmatrix}
                    <>
                \end{bmatrix}
          ]],
                {
                    i(1),
                }
            )
        ),
        s({trig="nnmatrix", dscr="make a nxn matrix"},
          fmta(
          [[
                \begin{bmatrix}
                    <>_{1 1} & <>_{1 2} & <>_{1 3} & \cdots & <>_{1 n} \\
                    <>_{2 1} & <>_{2 2} & <>_{2 3} & \cdots & <>_{2 n} \\
                    \vdots & \vdots & \ddots & \cdots & \ddots  \\
                    <>_{n 1} & <>_{n 2} & <>_{n 3} & \cdots & <>_{n n} \\
                \end{bmatrix}
          ]],
                {
                    i(1),
                    rep(1),
                    rep(1),
                    rep(1),
                    rep(1),
                    rep(1),
                    rep(1),
                    rep(1),
                    rep(1),
                    rep(1),
                    rep(1),
                    rep(1)
                }
            )
        ),
},
{
        -- %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        -- AUTOSNIPPETS
        s({trig="ii", dscr="italic"},
            fmta(
                [[*<>*]],
                {
                    i(1),
                }
            )
        ),
        s({trig="bb", dscr="bold"},
            fmta(
                [[**<>**]],
                {
                    i(1),
                }
            )
        ),
        -- %%%%%% MATH Accents%%%%%%%%%
        s({trig=";h", dscr="hat accent"},
          fmta(
          [[\hat{<>} ]],
                {
                    i(1),
                }
            )
        ),
        s({trig=";t", dscr="tilda accent"},
          fmta(
          [[\tilda{<>} ]],
                {
                    i(1),
                }
            )
        ),
        s({trig=";v", dscr="vector accent"},
          fmta(
          [[\vec{<>} ]],
                {
                    i(1),
                }
            )
        ),
        s({trig=";u", dscr="under brace Accents"},
          fmta(
          [[\underbrace{<>}_{\text{<>}} ]],
                {
                    i(1),
                    i(2),
                }
            )
        ),
        -- %%%%%% MATH environment%%%%%%%%%
        s({trig="((", dscr="large brackets"},
          fmta(
          [[\left( <> \right) ]],
                {
                    i(1),
                }
            )
        ),
        -- %%%%%% MATH Symbols%%%%%%%%%
        s({trig=";fa", dscr="forall symbol"},
            {t("\\forall ")}
        ),
        s({trig=";ex", dscr="exist symbol"},
           {t("\\exist ")}
        ),
        s({trig=";of", dscr="in symbol "},
           {t("\\in ")}
        ),
        s({trig=";nin", dscr="not in sym"},
           {t("\\notin ")}
        ),
        s({trig=";=>", dscr="implies"},
           {t("\\implies ")}
        ),
        s({trig=";in", dscr="infinity sym"},
           {t("\\infty ")}
        ),
        s({trig=";N", dscr="Natural Numbers"},
           {t("\\natnums ")}
        ),
        s({trig=";C", dscr="Complex Numbers"},
           {t("\\Complex ")}
        ),
        s({trig=";R", dscr="Real Numbers"},
           {t("\\Reals ")}
        ),
        -- %%%%%% MATH operators%%%%%%%%%
        s({trig=";sum", dscr="Sum from i=1 to n"},
          fmta(
          [[
               \displaystyle\sum_{i=<>}^{<>} 
          ]],
                {
                    i(1, "1"),
                    i(2, "n"),
                }
            )
        ),
        s({trig=";lim", dscr="Limit as x->infty"},
          fmta(
          [[
               \lim\limits_{x \rightarrow <>}
          ]],
                {
                    i(1, "\\infty"),
                }
            )
        ),
    -- %%%%%% MATH %%%%%%%%%
        s({trig = '([%a%)%]%}])__', regTrig = true, wordTrig = false, dscr="subscript only for letter/brackets" },
          fmta(
            "<>_{<>}",
            {
              f( function(_, snip) return snip.captures[1] end ),
              i(1)
            }
          )
        ),
        s({trig = '([%a%)%]%}])^^', regTrig = true, wordTrig = false, dscr="superscript only for letter/brackets" },
          fmta(
            "<>^{<>}",
            {
              f( function(_, snip) return snip.captures[1] end ),
              i(1)
            }
          )
        ),
    s({trig = '([^%a])ff', regTrig = true, wordTrig = false},
      fmta(
        [[<>\frac{<>}{<>}]],
        {
          f( function(_, snip) return snip.captures[1] end ),
          i(1),
          i(2)
        }
      )
    ),

}
