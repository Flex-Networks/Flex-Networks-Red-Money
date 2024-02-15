ENT.Type = "anim"
ENT.Base = "base_gmodentity"
ENT.PrintName = "Money Washer" -- thanks to cappy for the name
ENT.Author = "Flex Networks Development"
ENT.Category = "Flex Networks"
ENT.Spawnable = true

function ENT:SetupDataTables()
	self:NetworkVar("Float", 0, "Rate")
end