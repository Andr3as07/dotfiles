local ls = require('luasnip')
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local c = ls.choice_node
local f = ls.function_node
local extras = require('luasnip.extras')
local rep = extras.rep
local d = ls.dynamic_node
local sn = ls.snippet_node
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta

-- Check if we're inside a class using Tree-sitter
local function in_class()
  local ts_utils = require("nvim-treesitter.ts_utils")
  local node = ts_utils.get_node_at_cursor()

  while node do
    if node:type() == "class_definition" then
      return true
    end
    node = node:parent()
  end
  return false
end

-- Dynamic node to insert 'self' if inside a class
local function self_or_empty(args, snip)
  if in_class() then
    return sn(nil, { t("self"), i(1) })
  else
    return sn(nil, { i(1) })
  end
end

-- Python snippets
ls.add_snippets("python", {
    s({
        name = "Function",
        trig = "function method",
        desc = "Function or Method definition"
    },
        fmt([[
            def {}({}):
                {}
            ]],
        { i(1, "function_name"), d(2, self_or_empty, {}), i(0, "pass") })
    ),

    s({ name = "For number in range", trig = "for range", desc = "For in Range" },
        fmta([[
        for <> in range(<>, <>):
            <>
        ]],
        { i(1, "i"), i(2, "1"), i(3, "5"), i(4, "pass") })
    ),

    s({ name = "If Statement", trig = "if", desc = "If Block" },
        fmt([[
            if {}:
                {}
            ]],
            { i(1, "condition"), i(2, "pass") }
        )
    ),
})

-- PHP snippets
ls.add_snippets("php", {
    s({ name = "Symfony Route", trig = "route" },
        fmt("#[Route('{}', name:'{}', methods:['{}'])]",
            { i(1, '/path/to/the/route'), i(2, "name"), i(3, "GET") })
    ),
})

-- Go snippets
ls.add_snippets("go", {
    s({ 
        trig='iferr call',
        name='Call function handled',
        dscr='Call function and return error'
    },
        fmta([[
            <>, <> = <>
            if <> != nil {
                return <>
            }

            ]],
            { i(1, "value"), i(2, "err"), i(3, "function_call"), rep(2), rep(2) }
        )
    ),
})

-- bash snippets
ls.add_snippets("sh", {
    s({ name = "Swtich Statement", trig = "switch case", desc = "Swtich Case" },
        fmt([[
            case {} in
                {} 
                *) {} ;;
            esac

            ]],
        { i(1, "expr"), i(2), i(3, "exit 1") })
    ),

    s({ name = "If Statement", trig = "if", desc = "If Block" },
        fmt([[
            if [ {} ];
            then
                {}
            fi

            ]],
            { i(1, "condition"), i(2) }
        )
    ),

    s({ name = "Function", trig = "function", desc = "Function" },
        fmta([[
        <>() {
            <>
        }

        ]],
        { i(1, "function_name"), i(2) })
    ),

    s({ name = "For number in range", trig = "for range", desc = "For in Range" },
        fmta([[
        for <> in {<>..<>}
        do
            <>
        done

        ]],
        { i(1, "i"), i(2, "1"), i(3, "5"), i(4) })
    ),
})
