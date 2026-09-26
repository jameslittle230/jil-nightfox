local C = require("nightfox.lib.color")
local Shade = require("nightfox.lib.shade")

local meta = {
  name = "dayfox",
  light = true,
}

-- stylua: ignore
local palette = {
  black   = Shade.new("#352c24", 0.15, -0.15, true),
  red     = Shade.new("#a5222f", 0.15, -0.15, true),
  green   = Shade.new("#396847", 0.15, -0.15, true),
  yellow  = Shade.new("#AC5402", 0.15, -0.15, true),
  blue    = Shade.new("#2848a9", 0.15, -0.15, true),
  magenta = Shade.new("#6e33ce", 0.15, -0.15, true),
  cyan    = Shade.new("#287980", 0.15, -0.15, true),
  white   = Shade.new("#f2e9e1", 0.15, -0.15, true),
  orange  = Shade.new("#955f61", 0.15, -0.15, true),
  pink    = Shade.new("#a440b5", 0.15, -0.15, true),

  comment = "#837a72",

  bg0     = "#e4dcd4", -- Dark bg (status line and float)
  bg1     = "#f6f2ee", -- Default bg
  bg2     = "#dbd1dd", -- Lighter bg (colorcolm folds)
  bg3     = "#d3c7bb", -- Lighter bg (cursor line)
  bg4     = "#aab0ad", -- Conceal, border fg

  fg0     = "#302b5d", -- Lighter fg
  fg1     = "#3d2b5a", -- Default fg
  fg2     = "#643f61", -- Darker fg (status line)
  fg3     = "#824d5b", -- Darker fg (line numbers, fold colums)

  sel0    = "#e7d2be", -- Popup bg, visual selection bg
  sel1    = "#a4c1c2", -- Popup sel bg, search bg
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
    bracket     = dim,              -- Brackets and Punctuation
    builtin0    = spec.fg1,         -- Builtin variable
    builtin1    = spec.fg1,         -- Builtin type
    builtin2    = pal.green.base,   -- Builtin const
    builtin3    = spec.fg1,         -- Not used
    comment     = pal.magenta.dim,  -- Comment
    conditional = spec.fg1,         -- Conditional and loop
    const       = pal.green.base,   -- Constants and booleans
    dep         = spec.fg3,         -- Deprecated
    field       = spec.fg1,         -- Field
    func        = pal.yellow.dim,   -- Function declarations
    ident       = spec.fg1,         -- Identifiers
    keyword     = spec.fg1,         -- Keywords
    number      = pal.green.base,   -- Numbers
    operator    = dim,              -- Operators
    preproc     = spec.fg1,         -- PreProc
    regex       = pal.green.base,   -- Regex
    statement   = spec.fg1,         -- Statements
    string      = pal.green.base,   -- Strings
    type        = spec.fg1,         -- Types
    variable    = spec.fg1,         -- Variables
    var_decl    = pal.blue.dim,     -- Variable declarations and titles
  }

  spec.diag = {
    error = pal.red.base,
    warn  = pal.yellow.base,
    info  = pal.blue.base,
    hint  = pal.green.base,
    ok    = pal.green.base,
  }

  spec.diag_bg = {
    error = C(spec.bg1):blend(C(spec.diag.error), 0.3):to_css(),
    warn  = C(spec.bg1):blend(C(spec.diag.warn), 0.3):to_css(),
    info  = C(spec.bg1):blend(C(spec.diag.info), 0.3):to_css(),
    hint  = C(spec.bg1):blend(C(spec.diag.hint), 0.3):to_css(),
    ok    = C(spec.bg1):blend(C(spec.diag.ok), 0.3):to_css(),
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
