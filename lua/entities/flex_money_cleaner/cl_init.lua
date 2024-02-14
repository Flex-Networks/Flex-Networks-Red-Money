include("shared.lua")

function ENT:Initialize()
    surface.CreateFont("Roboto24", {
        font = "Roboto",
        size = 24,
        weight = 1000,
        antialias = true,
        shadow = false
    })
    surface.CreateFont("Roboto18", {
        font = "Roboto",
        size = 18,
        weight = 1000,
        antialias = true,
        shadow = false
    })
    surface.CreateFont("Roboto14", {
        font = "Roboto",
        size = 14,
        weight = 1000,
        antialias = true,
        shadow = false
    })
end

function ENT:Draw()
  	self:DrawModel()

    local pos = self:GetPos()
    local ang = self:GetAngles()
    ang:RotateAroundAxis(ang:Up(), 90)
    ang:RotateAroundAxis(ang:Forward(), 90)

    cam.Start3D2D(pos + ang:Up() * 0.5, ang, 0.1)
       local w = surface.GetTextSize("Dirty Money Exchanger"), 
       
        
        draw.RoundedBox(0, -w / 2, -50, w, 100, Color(0, 0, 0, 200))

        draw.SimpleText(self:GetRate(), "Roboto14", 0, -10, Color(189, 12, 12), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        draw.SimpleText("Dirty Money Exchanger", "Roboto24", 0, 0, Color(255, 255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        draw.SimpleText("Press E to exchange your dirty money", "Roboto18", 0, 30, Color(255, 255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)

    cam.End3D2D()
end


