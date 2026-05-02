local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local fmt = require("luasnip.extras.fmt").fmt

-- Helper for simple commands without arguments (e.g., \ds -> \ds)
local function simple(trig)
	return s(trig, t("\\" .. trig))
end

-- Snippets
return {
	-- --------------------------------------
	-- 1. TITLE PAGE
	-- --------------------------------------
	simple("maketitlepage"),
	s("makeabstract", fmt("\\makeabstract{{{}}}{{{}}}", { i(1, "title"), i(2, "text") })),
	s("setsubtitle", fmt("\\setsubtitle{{{}}}", { i(1, "name") })),
	s("setaccyear", fmt("\\setaccyear{{{}}}", { i(1, "year") })),
	s("setdep", fmt("\\setdep{{{}}}", { i(1, "name") })),
	s("setuni", fmt("\\setuni{{{}}}", { i(1, "name") })),
	s("setlogo", fmt("\\setlogo{{{}}}", { i(1, "path") })),

	-- --------------------------------------
	-- 2. MATH COMMANDS (No Arguments)
	-- --------------------------------------
	simple("ds"),
	-- Integrals
	simple("upint"),
	simple("upiint"),
	simple("upiiint"),
	simple("upiiiint"),
	simple("upidotsint"),
	simple("upoint"),
	simple("upoiint"),
	simple("upoiiint"),
	simple("upintclockwise"),
	simple("upointclockwise"),
	simple("upointctrclockwise"),
	-- Operators and Functions
	simple("Im"),
	simple("Re"),
	simple("argmax"),
	simple("argmin"),
	-- Symbols and Spacing
	simple("p"),
	simple("e"),
	simple("so"),
	simple("sos"),
	simple("idr"),
	simple("idx"),
	simple("spazio"),
	simple("w"),
	simple("vq"),
	-- Fractions
	simple("oh"),
	simple("ohs"),
	-- Greek and Physics
	simple("ve"),
	simple("vp"),
	simple("la"),
	simple("sg"),
	simple("al"),
	simple("be"),
	simple("ga"),
	simple("ep"),
	simple("om"),
	simple("hb"),
	simple("kb"),
	simple("Sch"),
	simple("hp"),
	simple("hH"),
	simple("hpv"),
	simple("hx"),
	simple("hU"),
	simple("hO"),
	simple("M"),
	simple("m"),
	simple("T"),
	simple("HC"),
	simple("qed"),

	-- --------------------------------------
	-- 3. MATH COMMANDS (With Arguments)
	-- --------------------------------------
	s("mathscr", fmt("\\mathscr{{{}}}", { i(1, "text") })),
	s("pt", fmt("\\pt{{{}}}", { i(1, "expression") })),
	s("pq", fmt("\\pq{{{}}}", { i(1, "expression") })),
	s("pg", fmt("\\pg{{{}}}", { i(1, "expression") })),
	s("sci", fmt("\\sci{{{}}}", { i(1, "exponent") })),
	s("td", fmt("\\td{{{}}}", { i(1, "expression") })),

	-- Vectors & Products
	s("vc", fmt("\\vc{{{}}}", { i(1, "name") })),
	s("vcs", fmt("\\vcs{{{}}}", { i(1, "name") })),
	s("dpr", fmt("\\dpr{{{}}}{{{}}}", { i(1, "a"), i(2, "b") })),
	s("dpr*", fmt("\\dpr*{{{}}}{{{}}}", { i(1, "a"), i(2, "b") })),
	s("dprs", fmt("\\dprs{{{}}}{{{}}}", { i(1, "a"), i(2, "b") })),
	s("dprs*", fmt("\\dprs*{{{}}}{{{}}}", { i(1, "a"), i(2, "b") })),
	s("cpr", fmt("\\cpr{{{}}}{{{}}}", { i(1, "a"), i(2, "b") })),
	s("cpr*", fmt("\\cpr*{{{}}}{{{}}}", { i(1, "a"), i(2, "b") })),
	s("cprs", fmt("\\cprs{{{}}}{{{}}}", { i(1, "a"), i(2, "b") })),
	s("cprs*", fmt("\\cprs*{{{}}}{{{}}}", { i(1, "a"), i(2, "b") })),

	-- Sets & Subsets
	s("set", fmt("\\set{{{}}}", { i(1, "name") })),
	s("subs", fmt("\\subs{{{}}}{{{}}}", { i(1, "subset"), i(2, "set") })),
	s("subs*", fmt("\\subs*{{{}}}{{{}}}", { i(1, "subset"), i(2, "set") })),
	s("ins", fmt("\\ins{{{}}}", { i(1, "set") })),
	s("notins", fmt("\\notins{{{}}}", { i(1, "set") })),

	-- Functions & Limits
	s("f", fmt("\\f{{{}}}{{{}}}", { i(1, "name"), i(2, "dom") })),
	s("fcod", fmt("\\f{{{}}}{{{}}}[{}]", { i(1, "name"), i(2, "dom"), i(3, "cod") })),
	s("fs", fmt("\\fs{{{}}}{{{}}}", { i(1, "name"), i(2, "dom") })),
	s("fscod", fmt("\\fs{{{}}}{{{}}}[{}][{}]", { i(1, "name"), i(2, "dom"), i(3, "super"), i(4, "cod") })),
	s("limit", fmt("\\limit{{{}}}{{{}}}{{{}}}", { i(1, "func"), i(2, "var"), i(3, "value") })),
	s("llimit", fmt("\\llimit{{{}}}{{{}}}{{{}}}", { i(1, "func"), i(2, "var"), i(3, "value") })),
	s("rlimit", fmt("\\rlimit{{{}}}{{{}}}{{{}}}", { i(1, "func"), i(2, "var"), i(3, "value") })),
	s("appr", fmt("\\appr{{{}}}{{{}}}", { i(1, "var"), i(2, "value") })),

	-- Sequences & Integrals
	s("seq", fmt("\\s{{{}}}{{{}}}{{{}}}", { i(1, "seq"), i(2, "i"), i(3, "start") })),
	s("seqstop", fmt("\\s{{{}}}{{{}}}{{{}}}[{}]", { i(1, "seq"), i(2, "i"), i(3, "start"), i(4, "stop") })),
	s("ing", fmt("\\ing{{{}}}{{{}}}{{{}}}{{{}}}", { i(1, "f"), i(2, "a"), i(3, "b"), i(4, "x") })),
	s(
		"iing",
		fmt(
			"\\iing{{{}}}{{{}}}{{{}}}{{{}}}{{{}}}{{{}}}{{{}}}",
			{ i(1, "f"), i(2, "a"), i(3, "b"), i(4, "c"), i(5, "d"), i(6, "x"), i(7, "y") }
		)
	),

	-- Lists
	s("dlist", fmt("\\dlist{{{}}}", { i(1, "var") })),
	s("dlistd", fmt("\\dlistd{{{}}}", { i(1, "var") })),

	-- Misc math with arguments
	s("eik", fmt("\\eik[{}]", { i(1, "x") })),
	s("eik*", fmt("\\eik*[{}]", { i(1, "x") })),
	s("idrvar", fmt("\\idr[{}]", { i(1, "var") })),
	s("idxvar", fmt("\\idx[{}]", { i(1, "var") })),
	s("pw", fmt("\\pw{{{}}}{{{}}}{{{}}}{{{}}}", { i(1, "a"), i(2, "b"), i(3, "ifa"), i(4, "ifb") })),
	s(
		"pwt",
		fmt(
			"\\pwt{{{}}}{{{}}}{{{}}}{{{}}}{{{}}}{{{}}}",
			{ i(1, "a"), i(2, "b"), i(3, "c"), i(4, "ifa"), i(5, "ifb"), i(6, "ifc") }
		)
	),
	s("me", fmt("\\me{{{}}}", { i(1, "operator") })),
	s("su", fmt("\\su{{{}}}", { i(1, "text") })),
}
