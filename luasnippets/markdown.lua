
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
           _**<>**_
           : <> $ \boxed{<>} $ 
      ]],
            {
                i(1),
                i(2),
                i(3),
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
        s({trig="vmatrix", dscr="Verticle Matrix"},
          fmta(
          [[
                \begin{bmatrix}
                    <>_{1} \\
                    <>_{2} \\
                    \vdots \\
                    <>_{n}
                \end{bmatrix}
          ]],
                {
                    i(1),
                    rep(1),
                    rep(1)
                }
            )
        ),
        s({trig="nnmatrix", dscr="make a nxn matrix"},
          fmta(
          [[
                \begin{bmatrix}
                    <>_{1 1} & <>_{1 2} & <>_{1 3} & \cdots & <>_{1 n} \\
                    <>_{2 1} & <>_{2 2} & <>_{2 3} & \cdots & <>_{2 n} \\
                    \vdots   &   \vdots & \ddots   & \cdots & \ddots   \\
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
    s({trig="imatrix", dscr="identity matrix"},
      fmta(
      [[
        \begin{bmatrix}
        1                                  \\
        & 1             &   & \text{\huge0}\\
        &               & \ddots           \\
        & \text{\huge0} &   & 1            \\
        &               &   &   & 1
        \end{bmatrix}
      ]],{}
        )
    ),
    s({trig="umatrix", dscr="upper triangle matrix"},
      fmta(
      [[
        \begin{bmatrix}
        <>_{1 1} &      <>_{1 2} & \cdots  & \cdots & <>_{1 n} \\
                 &      <>_{2 2} &         &        & \vdots   \\
                 &               & \ddots \\
                 & \text{\huge0} &         & \ddots & \vdots   \\
                 &               &         &        & <>_{n n}
        \end{bmatrix}
      ]],
            {
                i(1),
                rep(1),
                rep(1),
                rep(1),
                rep(1),
            }
        )
    ),
    s({trig="lmatrix", dscr="lower triangle matrix"},
      fmta(
      [[
        \begin{bmatrix}
        <>_{1 1} &        &        &               &          \\
        <>_{2 1} & \ddots &        & \text{\huge0} &          \\
        \vdots   &        & \ddots &               &          \\
        \vdots   &        &        &        \ddots &          \\
        <>_{n 1} & \cdots & \cdots &        \cdots & <>_{n n} \\
        \end{bmatrix}
      ]],
            {
                i(1),
                rep(1),
                rep(1),
                rep(1),
            }
        )
    ),
},
{
        -- %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        -- AUTOSNIPPETS
    s({trig = "$$", wordTrig = false, regTrig = true},
        fmta(
            [[
            <>$$
            <>
            $$
      ]],
            {
                f( function(_, snip) return snip.captures[1] end ),
                i(1),
            }
        )
    ),
    s({trig = "([^%a])mm", wordTrig = false, regTrig = true},
        fmta(
            "<>$<>$",
            {
                f( function(_, snip) return snip.captures[1] end ),
                i(1),
            }
        )
    ),
    s({trig="\\tt", dscr="Text"},
      fmta(
      [[
            \text{ <>}
      ]],
            {
                i(1),
            }
        )
    ),
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
        s({trig=";hh", dscr="hat accent"},
          fmta(
          [[\hat{<>} ]],
                {
                    i(1),
                }
            )
        ),
        s({trig=";t", dscr="tilde accent"},
          fmta(
          [[\tilde{<>} ]],
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
        s({trig=";un", dscr="under brace Accents"},
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
        s({trig=";al", dscr="alpha symbol"},
           {t("\\alpha")}
        ),
        s({trig=";be", dscr="beta symbol"},
           {t("\\beta")}
        ),
        s({trig=";de", dscr="delta symbol"},
           {t("\\delta")}
        ),
        s({trig=";ep", dscr="epsilon symbol"},
           {t("\\epsilon")}
        ),
        s({trig=";th", dscr="theta symbol"},
           {t("\\theta")}
        ),
        s({trig=";la", dscr="lambda symbol"},
           {t("\\lambda")}
        ),
        s({trig=";pi", dscr="pi symbol"},
           {t("\\pi")}
        ),
        s({trig=";om", dscr="omega symbol"},
           {t("\\omega")}
        ),
        -- -- --
        s({trig=";fa", dscr="forall symbol"},
            {t(" \\forall ")}
        ),
        s({trig=";ex", dscr="exist symbol"},
           {t(" \\exist ")}
        ),
        s({trig=";of", dscr="in symbol "},
           {t(" \\in ")}
        ),
        s({trig=";nin", dscr="not in sym"},
           {t(" \\notin ")}
        ),
        s({trig=";->", dscr="implies"},
           {t(" \\implies ")}
        ),
        s({trig=";in", dscr="infinity sym"},
           {t(" \\infty ")}
        ),
        s({trig=";N", dscr="Natural Numbers"},
           {t(" \\natnums ")}
        ),
        s({trig=";C", dscr="Complex Numbers"},
           {t(" \\Complex ")}
        ),
        s({trig=";R", dscr="Real Numbers"},
           {t(" \\Reals ")}
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
        s({trig=";sq", dscr="square root"},
          fmta( [[ \sqrt{<>} ]],
                {
                    i(1),
                }
            )
        ),

}
