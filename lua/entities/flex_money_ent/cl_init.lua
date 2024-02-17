include("shared.lua")

function ENT:Draw()
    self:DrawModel()

    local Pos = self:GetPos()
    local Ang = self:GetAngles()

    surface.SetFont("Roboto24")
    local text = DarkRP.formatMoney(tonumber(self:GetDirtyMoneyAmount()))
    local TextWidth = surface.GetTextSize(text)

    Ang:RotateAroundAxis(Ang:Up(), 90)

    cam.Start3D2D(Pos + Ang:Up() * 0.9, Ang, 0.1)
        draw.WordBox(2, -TextWidth * 0.5, -30, text, "Roboto24", Color(0, 0, 0, 100), Color(255, 255, 255, 255))
    cam.End3D2D()
end