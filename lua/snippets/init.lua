-- Aggregates and registers all per-filetype LuaSnip snippet tables; required
-- from nvim-cmp's config function (after LuaSnip/cmp are set up).

local ls = require("luasnip")

-- Load Python snippets
ls.add_snippets("python", require("snippets.python"))
ls.add_snippets("c", require("snippets.c"))
ls.add_snippets("tex", require("snippets.tex"))
