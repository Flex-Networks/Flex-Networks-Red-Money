ENT.Type = "anim"
ENT.Base = "base_gmodentity"
ENT.PrintName = "Dirty Money Seller"
ENT.Author = "Flex Networks Development"
ENT.Category = "Flex Networks"
ENT.Spawnable = true
ENT.FadeTime = 5

function ENT:SetupDataTables()
	self:NetworkVar("Float", 0, "Rate")
end