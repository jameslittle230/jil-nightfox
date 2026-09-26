local C = require("nightfox.lib.color")
local Shade = require("nightfox.lib.shade")

local meta = {
  name = "nordfox",
  light = false,
}

-- stylua: ignore
local palette = {
  black   = Shade.new("#3b4252", "#465780", "#353a45"),
  red     = Shade.new("#bf616a", "#d06f79", "#a54e56"),
  green   = Shade.new("#a3be8c", "#b1d196", "#8aa872"),
  yellow  = Shade.new("#ebcb8b", "#f0d399", "#d9b263"),
  blue    = Shade.new("#81a1c1", "#8cafd2", "#668aab"),
  magenta = Shade.new("#b48ead", "#c895bf", "#9d7495"),
  cyan    = Shade.new("#88c0d0", "#93ccdc", "#69a7ba"),
  white   = Shade.new("#e5e9f0", "#e7ecf4", "#bbc3d4"),
  orange  = Shade.new("#c9826b", "#d89079", "#b46950"),
  pink    = Shade.new("#bf88bc", "#d092ce", "#a96ca5"),

  comment = "#60728a",

  bg0     = "#232831", -- Dark bg (status line and float)
  bg1     = "#2e3440", -- Default bg
  bg2     = "#39404f", -- Lighter bg (colorcolm folds)
  bg3     = "#444c5e", -- Lighter bg (cursor line)
  bg4     = "#5a657d", -- Conceal, border fg

  fg0     = "#c7cdd9", -- Lighter fg
  fg1     = "#cdcecf", -- Default fg
  fg2     = "#abb1bb", -- Darker fg (status line)
  fg3     = "#7e8188", -- Darker fg (line numbers, fold colums)

  sel0    = "#3e4a5b", -- Popup bg, visual selection bg
  sel1    = "#4f6074", -- Popup sel bg, search bg
}

local function generate_spec(pal)
  -- stylua: ignore start
  local spec = {
    bg0  = pal.bg0,  -- Dark bg (status line and float)
    bg1  = pal.bg1,  -- Default bg
    bg2  = pal.bg2,  -- Lighter bg (colorcolm folds)
    bg3  = pal.bg3,  -- Lighter bg (cursor line)
    bg4  = pal.bg4,  -- Conceal, border fg

    fg0  = pal.fg0,  -- Lighter fg
    fg1  = pal.fg1,  -- Default fg
    fg2  = pal.fg2,  -- Darker fg (status line)
    fg3  = pal.fg3,  -- Darker fg (line numbers, fold colums)

    sel0 = pal.sel0, -- Popup bg, visual selection bg
    sel1 = pal.sel1, -- Popup sel bg, search bg
  }

  -- punctuation and operators sit three-quarters of the way from default to line-number fg
  local dim = C(spec.fg1):blend(C(spec.fg3), 0.75):to_css()

  spec.syntax = {
    bracket     = dim,                -- Brackets and Punctuation
    builtin0    = spec.fg1,           -- Builtin variable
    builtin1    = spec.fg1,           -- Builtin type
    builtin2    = pal.green.base,     -- Builtin const
    builtin3    = spec.fg1,           -- Not used
    comment     = pal.magenta.base,   -- Comment
    conditional = spec.fg1,           -- Conditional and loop
    const       = pal.green.base,     -- Constants and booleans
    dep         = spec.fg3,           -- Deprecated
    field       = spec.fg1,           -- Field
    func        = pal.yellow.base,    -- Function declarations
    ident       = spec.fg1,           -- Identifiers
    keyword     = spec.fg1,           -- Keywords
    number      = pal.green.base,     -- Numbers
    operator    = dim,                -- Operators
    preproc     = spec.fg1,           -- PreProc
    regex       = pal.green.base,     -- Regex
    statement   = spec.fg1,           -- Statements
    string      = pal.green.base,     -- Strings
    type        = spec.fg1,           -- Types
    variable    = spec.fg1,           -- Variables
    var_decl    = pal.blue.bright,    -- Variable declarations and titles
  }

  spec.diag = {
    error = pal.red.base,
    warn  = pal.yellow.base,
    info  = pal.blue.base,
    hint  = pal.green.base,
    ok    = pal.green.base,
  }

  spec.diag_bg = {
    error = C(spec.bg1):blend(C(spec.diag.error), 0.2):to_css(),
    warn  = C(spec.bg1):blend(C(spec.diag.warn), 0.2):to_css(),
    info  = C(spec.bg1):blend(C(spec.diag.info), 0.2):to_css(),
    hint  = C(spec.bg1):blend(C(spec.diag.hint), 0.2):to_css(),
    ok    = C(spec.bg1):blend(C(spec.diag.ok), 0.2):to_css(),
  }

  spec.diff = {
    add    = C(spec.bg1):blend(C(pal.green.dim), 0.15):to_css(),
    delete = C(spec.bg1):blend(C(pal.red.dim), 0.15):to_css(),
    change = C(spec.bg1):blend(C(pal.blue.dim), 0.15):to_css(),
    text   = C(spec.bg1):blend(C(pal.cyan.dim), 0.25):to_css(),
  }

  spec.git = {
    add      = pal.green.base,
    removed  = pal.red.base,
    changed  = pal.yellow.base,
    conflict = pal.orange.base,
    ignored  = pal.comment,
  }

  -- stylua: ignore start

  return spec
end

return { meta = meta, palette = palette, generate_spec = generate_spec }
