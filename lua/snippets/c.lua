local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node

return {
	-- Main function
	s("mn", {
		t({ "int main(void) {", "    " }),
		i(1, "// code here"),
		t({ "", "    return 0;", "}" }),
	}),

	s("main", {
		t({ "int main(int argc, char *argv[]) {", "    " }),
		i(1, "// code here"),
		t({ "", "    return 0;", "}" }),
	}),

	-- Include guard
	s("header", {
		t("#ifndef "),
		i(1, "HEADER_H"),
		t({ "", "#define " }),
		f(function(args)
			return args[1][1]
		end, { 1 }),
		t({ "", "", "" }),
		i(2, "// declarations"),
		t({ "", "", "#endif // " }),
		f(function(args)
			return args[1][1]
		end, { 1 }),
	}),

	-- Switch statement
	s("switch", {
		t("switch ("),
		i(1, "var"),
		t({ ") {", "    case " }),
		i(2, "value"),
		t({ ":", "        " }),
		i(3, "break;"),
		t({ "", "    default:", "        " }),
		i(4, "break;"),
		t({ "", "}" }),
	}),
}
