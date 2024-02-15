
function FRedMoney.AddFile(File, dir)
    local fileSide = string.lower(string.Left(File, 3))
    if SERVER and fileSide == "sv_" then
        include(dir..File)
        print("[FRedMoney] SV INCLUDE: " .. File)
    elseif fileSide == "sh_" then
        if SERVER then 
            AddCSLuaFile(dir..File)
            print("[FRedMoney] SH ADDCS: " .. File)
        end
        include(dir..File)
        print("[FRedMoney] SH INCLUDE: " .. File)
    elseif fileSide == "cl_" then
        if SERVER then 
            AddCSLuaFile(dir..File)
            print("[FRedMoney] CL ADDCS: " .. File)
        else
            include(dir..File)
            print("[FRedMoney] CL INCLUDE: " .. File)
        end
    end
end

function FRedMoney.IncludeDir(dir)
    dir = dir .. "/"
    local File, Directory = file.Find(dir.."*", "LUA")

    for k, v in ipairs(File) do
        if string.EndsWith(v, ".lua") then
            FRedMoney.AddFile(v, dir)
        end
    end

    for k, v in ipairs(Directory) do
        print("[FRedMoney] Directory: " .. v)
        FRedMoney.IncludeDir(dir..v)
    end
end



hook.Add("DarkRPFinishedLoading", "FMoney:DarkRPFinishedLoading", function()
    FRedMoney.IncludeDir("flexredmoney")
    print('FRedMoney : Loaded')
    print([[
        ------------------------------------------------
        |                                              |
        |       FLEX REDMONEY LOADED SUCCESSFULLY      |
        |          Created By: YoWaitAMinute           |
        |               Version: 1.0.0                 |
        |                                              |
        ------------------------------------------------
    ]])
        
end)
