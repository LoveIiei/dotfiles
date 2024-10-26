local ls = require "luasnip"
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local d = ls.dynamic_node
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local rep = require("luasnip.extras").rep

ls.add_snippets("tex", {
  s("st", {
    t {
      "\\documentclass{article}",
      "\\usepackage{amsfonts,amssymb,amsthm,amsmath,fullpage,setspace}",
      "    ",
      "\\begin{document}",
      " ",
    },
    i(1),
    t {
      "",
      "\\end{document}",
    },
  }),
  s("fpg", {
    t {
      "\\begin{center}",
      "{\\Large \\bf MATB24",
      "Linear Algebra: Assignment 2",
      "}",
      "\\newline (Owen Hua), %Name",
      "\\newline Tutorial \\#: (), %tutorial number",
      "\\newline S\\#:(), %student number",
      "\\newline Email: () %student number",
      "\\newline Professor: ()",
      "\\end{center}",
      "\\vspace{5mm}",
      "\\pagebreak",
      "",
    },
  }),
})
