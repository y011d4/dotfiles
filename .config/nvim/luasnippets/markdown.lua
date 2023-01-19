return {
  s("|frac", {
    t("\\frac{"),
    i(1),
    t("}{"),
    i(2),
    t("}"),
    i(0),
  }),
  s("|array", {
    t({
      "\\left(",
      "  \\begin{array}{",
    }),
    i(1),
    t({
      "}",
      "    ",
    }),
    i(2),
    t({
      "",
      "  \\end{array}",
      "\\right)",
      "",
    }),
  }),
}, {
  s("autotrig", t("autoloaded!")) -- example
}
