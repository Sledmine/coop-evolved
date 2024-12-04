-- SPDX-License-Identifier: GPL-3.0-only
-- This file is used to document the Lua plugins engine API. It should not be included.

---@meta lfmt

local fmt = {}

---Format a string using the given arguments.
---@param text string @Format string.
---@param ... any @Arguments to be used in the format string.
function fmt.format(text, ...) end

return fmt
