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
  s("|(", {
    t("\\left( "),
    i(1),
    t(" \\right)"),
    i(0),
  }),
  s("|_", {
    t("_{"),
    i(1),
    t("}"),
    i(0),
  }),
  s("|align", {
    t({"$$", "\\begin{align*}", ""}),
    i(1),
    t({"", "\\end{align*}", "$$", ""}),
    i(0),
  }),
}, {
  s("autotrig", t("autoloaded!")) -- example
}
