local C = require("nightfox.lib.color")
local Shade = require("nightfox.lib.shade")

local meta = {
  name = "duskfox",
  light = false,
}

-- stylua: ignore
local palette = {
  black   = Shade.new("#393552", "#47407d", "#322e42"),
  red     = Shade.new("#eb6f92", "#f083a2", "#d84f76"),
  green   = Shade.new("#a3be8c", "#b1d196", "#8aa872"),
  yellow  = Shade.new("#f6c177", "#f9cb8c", "#e6a852"),
  blue    = Shade.new("#569fba", "#65b1cd", "#4a869c"),
  magenta = Shade.new("#c4a7e7", "#ccb1ed", "#a580d2"),
  cyan    = Shade.new("#9ccfd8", "#a6dae3", "#7bb8c1"),
  white   = Shade.new("#e0def4", "#e2e0f7", "#b1acde"),
  orange  = Shade.new("#ea9a97", "#f0a4a2", "#d6746f"),
  pink    = Shade.new("#eb98c3", "#f0a6cc", "#d871a6"),

  comment = "#817c9c",

  bg0     = "#191726", -- Dark bg (status line and float)
  bg1     = "#232136", -- Default bg
  bg2     = "#2d2a45", -- Lighter bg (colorcolm folds)
  bg3     = "#373354", -- Lighter bg (cursor line)
  bg4     = "#4b4673", -- Conceal, border fg

  fg0     = "#eae8ff", -- Lighter fg
  fg1     = "#e0def4", -- Default fg
  fg2     = "#cdcbe0", -- Darker fg (status line)
  fg3     = "#6e6a86", -- Darker fg (line numbers, fold colums)

  sel0    = "#433c59", -- Popup bg, visual selection bg
  sel1    = "#63577d", -- Popup sel bg, search bg
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

  spec.syntax = {
    bracket     = spec.fg2,           -- Brackets and Punctuation
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
    operator    = spec.fg1,           -- Operators
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
    error = C(spec.bg1):blend(C(spec.diag.error), 0.15):to_css(),
    warn  = C(spec.bg1):blend(C(spec.diag.warn), 0.15):to_css(),
    info  = C(spec.bg1):blend(C(spec.diag.info), 0.15):to_css(),
    hint  = C(spec.bg1):blend(C(spec.diag.hint), 0.15):to_css(),
    ok    = C(spec.bg1):blend(C(spec.diag.ok), 0.15):to_css(),
  }

  spec.diff = {
    add    = C(spec.bg1):blend(C(pal.green.base), 0.2):to_css(),
    delete = C(spec.bg1):blend(C(pal.red.base), 0.2):to_css(),
    change = C(spec.bg1):blend(C(pal.blue.base), 0.2):to_css(),
    text   = C(spec.bg1):blend(C(pal.blue.base), 0.4):to_css(),
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
