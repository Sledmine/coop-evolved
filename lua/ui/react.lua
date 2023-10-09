local react = {}

local mounted = {}

function react.mount(component, tagId)
    console_debug("Mounting component: " .. component)
    if not mounted[tagId] then
        mounted[tagId] = require("coop.ui.components." .. component)()
    end
    return mounted[tagId]
end

function react.render(tagId)
    local render = mounted[tagId]
    if render then
        return render()
    end
    return nil
end

function react.unmountAll()
    for k, v in pairs(mounted) do
        console_debug("Unmounting component " .. k)
        mounted[k] = nil
    end
end

--- Create a React watcher metatable that observes changes in the given table.
---@table table
---@return table
function react.watch(table)
    local mt = {
        __index = table,
        __newindex = function(t, k, v)
            console_debug("React watcher: " .. k .. " changed to " .. v)
            rawset(t, k, v)
        end
    }
    return setmetatable({}, mt)
end

return react
