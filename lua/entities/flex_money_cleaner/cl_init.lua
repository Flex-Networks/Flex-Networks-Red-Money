include("shared.lua")
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

function ENT:Initialize()
end

function ENT:Draw()
  	self:DrawModel()

    local pos = self:GetPos()
    local ang = self:GetAngles()
    ang:RotateAroundAxis(ang:Up(), 90)
    ang:RotateAroundAxis(ang:Forward(), 90)

    cam.Start3D2D(pos + ang:Up() * 0.2, ang, 0.1)
       local w = surface.GetTextSize("Dirty Money Exchanger")

       -- draw.RoundedBox(10, -w / 2, -800, w, 100, Color(0, 0, 0, 225))
        draw.SimpleTextOutlined("Dirty Money Exchanger", "Roboto24", 0, -780, Color(255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, 1, Color(0, 0, 0))
        draw.SimpleTextOutlined("Exchange your dirty money for clean money", "Roboto18", 0, -750, Color(255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, 1, Color(0, 0, 0))
        draw.SimpleTextOutlined("Exchange Rate : " .. self:GetRate() .. '%', "Roboto18", 0, -730, Color(255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, 1, Color(0, 0, 0))
    cam.End3D2D()
end
