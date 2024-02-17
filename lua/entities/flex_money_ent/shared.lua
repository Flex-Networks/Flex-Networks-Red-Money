ENT.Type = "anim"
ENT.Base = "base_gmodentity"
ENT.PrintName = "Dirty Money"
ENT.Category    = "Flex Networks"
ENT.Spawnable = false
ENT.Model = "models/props/cs_assault/Money.mdl"

function ENT:SetupDataTables()
    self:NetworkVar("String", 0, "DirtyMoneyAmount") // Use this since i had issues with the int in testing
end