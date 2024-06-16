local conditions = require("heirline.conditions")
local utils = require("heirline.utils")

local MODE_NAMES = {
  -- change the strings if you like it vvvvverbose!
  n = "NORMAL",
  no = "N?",
  nov = "N?",
  noV = "N?",
  ["no\22"] = "N?",
  niI = "Ni",
  niR = "Nr",
  niV = "Nv",
  nt = "Nt",
  v = "VISUAL",
  vs = "Vs",
  V = "V_",
  Vs = "Vs",
  ["\22"] = "VISUAL_B",
  ["\22s"] = "VISUAL_B",
  s = "S",
  S = "S_",
  ["\19"] = "^S",
  i = "INSERT",
  ic = "Ic",
  ix = "Ix",
  R = "REPLACE",
  Rc = "Rc",
  Rx = "Rx",
  Rv = "Rv",
  Rvc = "Rv",
  Rvx = "Rv",
  c = "COMMAND",
  cv = "Ex",
  r = "...",
  rm = "M",
  ["r?"] = "?",
  ["!"] = "!",
  t = "TERMINAL",
}

--- @param hl_tbl table | nil
--- @return table
local function make_hl(hl_tbl)
  local statusline = utils.get_highlight("StatusLine")
  local base_hl = { bg = statusline.bg, fg = statusline.fg }

  if not hl_tbl then
    return base_hl
  end

  return vim.tbl_deep_extend("force", base_hl, hl_tbl)
end

local ViMode = {
  static = {
    mode_names = MODE_NAMES,
  },
  update = {
    "ModeChanged",
    pattern = "*:*",
    callback = vim.schedule_wrap(function()
      vim.cmd("redrawstatus")
    end),
  },
  init = function(self)
    self.mode = vim.fn.mode()
  end,
  hl = function()
    return make_hl({ bold = true })
  end,
  provider = function(self)
    return self.mode_names[self.mode]
  end,
}

local FilenameBlock = {
  init = function(self)
    self.filename = vim.api.nvim_buf_get_name(0)
  end,
}

local FileIcon = {
  init = function(self)
    local filename = self.filename
    local extension = vim.fn.fnamemodify(filename, ":e")
    self.icon, self.icon_color = require("nvim-web-devicons").get_icon_color(filename, extension, { default = true })
  end,
  hl = function(self)
    return make_hl({ fg = self.icon_color })
  end,
  provider = function(self)
    return self.icon and (self.icon .. " ")
  end,
}

local FilenameModifier = {
  hl = function()
    if vim.bo.modified then
      return make_hl({ fg = "cyan", bold = true, force = true })
    end
  end,
}

local Filename = {
  hl = make_hl(),
  provider = function(self)
    local filename = vim.fn.fnamemodify(self.filename, ":.")
    if filename == "" then
      return
    end

    if not conditions.width_percent_below(#filename, 0.25) then
      filename = vim.fn.pathshorten(filename)
    end

    return filename
  end,
}

local FileFlags = {
  {
    condition = function()
      return vim.bo.modified
    end,
    provider = "[+] ",
    hl = make_hl(),
  },
  {
    condition = function()
      return not vim.bo.modifiable or vim.bo.readonly
    end,
    provider = " ",
    hl = make_hl({ fg = "orange" }),
  },
}

-- stylua: ignore
FilenameBlock = utils.insert(
  FilenameBlock,
  FileFlags,
  FileIcon,
  utils.insert(FilenameModifier, Filename),
  { provider = "%<"}
)

local FileType = {
  provider = function()
    return string.upper(vim.bo.filetype)
  end,
  hl = make_hl({ bold = true }),
}

local FileEncoding = {
  provider = function()
    local enc = (vim.bo.fenc ~= "" and vim.bo.fenc) or vim.o.enc
    return (enc ~= "utf-8" and enc:upper()) or ""
  end,
}

local Ruler = {
  -- %l = current line number
  -- %L = number of lines in the buffer
  -- %c = column number
  -- %P = percentage through file of displayed window
  -- provider = "%7(%l/%3L%):%2c %P",
  provider = "[%l, %c]",
  hl = make_hl(),
}

local Diagnostics = {
  static = {
    error_icon = " ",
    warn_icon = " ",
  },
  update = { "DiagnosticChanged", "BufEnter" },
  init = function(self)
    self.errors = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR })
    self.warnings = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.WARN })
  end,
  {
    hl = make_hl(),
    provider = function(self)
      return (self.error_icon .. self.errors .. " ")
    end,
  },
  {
    hl = make_hl(),
    provider = function(self)
      return (self.warn_icon .. self.warnings .. " ")
    end,
  },
}

local Git = {
  condition = conditions.is_git_repo,
  init = function(self)
    self.status_dict = vim.b.gitsigns_status_dict
    self.has_changes = self.status_dict.added ~= 0 or self.status_dict.removed ~= 0 or self.status_dict.changed ~= 0
  end,
  provider = function(self)
    return " " .. self.status_dict.head
  end,
  hl = make_hl(),
}

local Align = { provider = "%=", hl = make_hl() }
local Space = { provider = " ", hl = make_hl() }

-- stylua: ignore
local LeftBlock = { ViMode, Space, Git, Space, Diagnostics, Space }
local CenterBlock = { FilenameBlock, Space }
local RightBlock = { Ruler, Space, FileEncoding, Space, FileType }

-- stylua: ignore
local StatusLine = {
  LeftBlock,
  Align,
  CenterBlock,
  Align,
  RightBlock
}

return StatusLine
