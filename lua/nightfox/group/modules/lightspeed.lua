-- https://github.com/ggandor/lightspeed.nvim

local M = {}

function M.get(spec, config, opts)
  -- stylua: ignore
  return {
    LightspeedGreyWash = { fg = spec.palette.comment },
  }
end

return M
