hook.Add("DarkRPFinishedLoading", "FMoney:DarkRPFinishedLoading", function()
    FRedMoney.IncludeDir("flexredmoney/sh_config.lua")
    FRedMoney.IncludeDir("flexredmoney/sh_utils.lua")
    FRedMoney.IncludeDir("flexredmoney/sv_utils.lua")
end)

print([[
    ------------------------------------------------
    |                                              |
    |       FLEX REDMONEY LOADED SUCCESSFULLY      |
    |          Created By: YoWaitAMinute           |
    |               Version: 1.0.0                 |
    |                                              |
    ------------------------------------------------
]])