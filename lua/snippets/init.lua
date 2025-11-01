local ls = require("luasnip")

-- Load Python snippets
ls.add_snippets("python", require("snippets.python"))
ls.add_snippets("c", require("snippets.c"))
