AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")

function ENT:Initialize()
	self:SetModel(FRedMoney.Config.NPCModel or "models/player/Group03/female_01.mdl")
	self:PhysicsInit(SOLID_VPHYSICS)
	self:SetMoveType(MOVETYPE_VPHYSICS)
	self:SetSolid(SOLID_VPHYSICS)
	self:GetPhysicsObject():Wake()
	self:SetUseType(SIMPLE_USE)
	self:GetPhysicsObject():EnableMotion(false)
	self.Owner = self:CPPIGetOwner()
end

function ENT:Use(p)
    local amt = p:GetRedMoney()
    if not amt then
        p:ChatPrint('[RedMoney] : Error, Fetching Data.')
    end

    local percent = 

end

function ENT:Think()
    local time = CurTime()
    if self.NextThink and self.NextThink > time then return end

    self:SetNWVar("RedMoney", math.floor(math.random(FRedMoney.Config.RedMoneyRates["min"], FRedMoney.Config.RedMoneyRates["max"])))

    self.NextThink = time + FRedMoney.Config.RateRefreshTime
end