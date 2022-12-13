task.spawn(function()
    local gg = getrawmetatable(game)
    local old = gg.__namecall
    setreadonly(gg,false)
    gg.__namecall = newcclosure(function(...)
        local method = getnamecallmethod()
        local args = {...}
        if tostring(method) == "InvokeServer" then
            if tostring(args[1]) == "SkillAction" then
                if (args[3]) then
                    if args[3]["MouseHit"] and (SaveSettings["Main"]["AutoFarm"] or SaveSettings["Main"]["AutoSecondSea"] or SaveSettings["Main"]["AutoLPQuests"] or SaveSettings["Main"]["AutoSK"] or SaveSettings["Main"]["AutoGhostShip"] or SaveSettings["Main"]["AutoHydra"] or SaveSettings["Main"]["AutoFarmBosses"]) and MobP then
                        pcall(function()
                            args[3]["MouseHit"] = MobP
                            return old(unpack(args))
                        end)
                    end
                end
            end
        end
        return old(...)
    end)
end)
