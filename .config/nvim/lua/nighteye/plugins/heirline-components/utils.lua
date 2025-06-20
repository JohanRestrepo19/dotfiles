local utils = require("heirline.utils")
local sep = package.config:sub(1, 1)

local M = {}

--- @param hl_tbl table | nil
--- @return table
function M.make_hl(hl_tbl)
    local statusline = utils.get_highlight("StatusLine")
    local base_hl = { bg = statusline.bg, fg = statusline.fg }
    if not hl_tbl then
        return base_hl
    end
    return vim.tbl_deep_extend("force", base_hl, hl_tbl)
end

--- checks if name is valid
---@param name string
---@return boolean
function M.is_valid_filename(name)
    local invalid_chars = "[^a-zA-Z0-9_. -]"
    return name:find(invalid_chars) == nil
end

---loads a theme from lua module
---prioritizes external themes (from user config or other plugins) over the bundled ones
---@param theme_name string
---@return table theme definition from module
function M.load_theme(theme_name)
    local retval
    local path = table.concat({ "lua/lualine/themes/", theme_name, ".lua" })
    local files = vim.api.nvim_get_runtime_file(path, true)
    if #files <= 0 then
        path = table.concat({ "lua/lualine/themes/", theme_name, "/init.lua" })
        files = vim.api.nvim_get_runtime_file(path, true)
    end
    local n_files = #files
    if n_files == 0 then
        -- No match found on runtimepath. Fall back to package.path
        local file = assert(
            package.searchpath("lualine.themes." .. theme_name, package.path),
            "Theme " .. theme_name .. " not found"
        )
        retval = dofile(file)
    elseif n_files == 1 then
        -- when only one is found run that and return it's return value
        retval = dofile(files[1])
    else
        -- put entries from user config path in front
        local user_config_path = vim.fn.stdpath("config")
        table.sort(files, function(a, b)
            local pattern = table.concat({ user_config_path, sep })
            return string.match(a, pattern) or not string.match(b, pattern)
        end)
        -- More then 1 found . Use the first one that isn't in lualines repo
        local lualine_repo_pattern = table.concat({ "lualine.nvim", "lua", "lualine" }, sep)
        local file_found = false
        for _, file in ipairs(files) do
            if not file:find(lualine_repo_pattern) then
                retval = dofile(file)
                file_found = true
                break
            end
        end
        if not file_found then
            -- This shouldn't happen but somehow we have multiple files but they
            -- appear to be in lualines repo . Just run the first one
            retval = dofile(files[1])
        end
    end
    return retval
end

---@param theme table definition from module
---@return table mode_colors definition from module
function M.mode_highlights(theme)
    local fallback_colors = utils.get_highlight("StatusLine")
    local mode_colors = {
        normal_bg = (theme.normal and theme.normal.a.bg) or fallback_colors.bg,
        insert_bg = (theme.insert and theme.insert.a.bg) or fallback_colors.bg,
        visual_bg = (theme.visual and theme.visual.a.bg) or fallback_colors.bg,
        command_bg = (theme.command and theme.command.a.bg) or fallback_colors.bg,
        select_bg = (theme.visual and theme.visual.a.bg) or fallback_colors.bg,
        replace_bg = (theme.replace and theme.replace.a.bg) or fallback_colors.bg,
        terminal_bg = (theme.normal and theme.normal.a.bg) or fallback_colors.bg,
    }

    return mode_colors
end

return M
