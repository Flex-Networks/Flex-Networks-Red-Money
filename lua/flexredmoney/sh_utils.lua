FRedMoney = FRedMoney or {}


local PLAYER = FindMetaTable("Player")

function PLAYER:GetRedMoney()
    return self:GetNWInt("RedMoney", 0)
end

function FRedMoney:DebugPrint(str)
    if !FRedMoney.Config.Debug then return end
    assert( isstring(str) == true , "Sending a debug print with out a string?")
    print( "[FredMoney] -> Debug "  .. tostring(str) )
end

-- I am not creating a file for 1 hook
if CLIENT then
    if FRedMoney.Config.DefaultHud then 
        surface.CreateFont("Roboto40", {
            font = "Roboto",
            size = 60,
            weight = 1000,
            antialias = true,
            shadow = false
        })
        hook.Add("HUDPaint", "FlexRedMoney_DrawHud", function()
            if not localPly then localPly = LocalPlayer() end
            local amt = localPly:GetRedMoney()
            local amt = DarkRP.formatMoney(amt)
            local w,h = ScrW(), ScrH()
            draw.SimpleTextOutlined("Dirty Money: " .. amt, "Roboto40", w * 0.0025, h * 0.02, Color(255,0,0,75), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER, 1, Color(0, 0, 0))
        end)
    end
end