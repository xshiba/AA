local mt = getrawmetatable(game)
local old = mt.__namecall
setreadonly(mt,false)
mt.__namecall = function(...)
    local args = {...}
    local method = getnamecallmethod()
    if method == "InvokeServer" then
        if tostring(args[1]) == "SkillAction" then
            if _G.ActiveSkill then
                if MobP ~= nil then
                    if not args[3] then
                        return old(...)
                    end
                    if args[3].Type == "Up" or args[3].Type == "Down" then
                        args[3].MouseHit = MobP
                        return old(unpack(args))
                    end
                end
            end
        end
    end
    return old(...)
end
