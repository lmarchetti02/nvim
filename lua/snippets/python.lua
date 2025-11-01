local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node

return {
	-- Print statement
	s("pr", {
		t("print("),
		i(1, "value"),
		t(")"),
	}),

	-- Main function
	s("main", {
		t({ "def main():", "    " }),
		i(1, "pass"),
		t({ "", "", 'if __name__ == "__main__":', "    main()" }),
	}),

	-- Class with __init__
	s("cls", {
		t("class "),
		i(1, "ClassName"),
		t({ ":", "    def __init__(self, " }),
		i(2, "args"),
		t({ "):", "        " }),
		i(3, "pass"),
	}),

	-- List comprehension
	s("lc", {
		t("["),
		i(1, "expr"),
		t(" for "),
		i(2, "item"),
		t(" in "),
		i(3, "iterable"),
		t("]"),
	}),

	-- Docstring
	s("doc", {
		t({ '"""' }),
		i(1, "Description"),
		t({ "", "", "Args:", "    " }),
		i(2, "param (type): description"),
		t({ "", "", "Returns:", "    " }),
		i(3, "return_type: description"),
		t({ "", '"""' }),
	}),
}
