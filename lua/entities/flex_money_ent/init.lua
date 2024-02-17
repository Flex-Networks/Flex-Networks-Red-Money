AddCSLuaFile("shared.lua")
AddCSLuaFile("cl_init.lua")
include("shared.lua")

function ENT:Initialize()
    self:SetModel(self.Model)
    self:PhysicsInit(SOLID_VPHYSICS)
    self:SetMoveType(MOVETYPE_NONE)
    self:SetSolid(SOLID_VPHYSICS)
    self.InUse = false
    local phys = self:GetPhysicsObject()
    if phys:IsValid() then
        phys:Wake()
    end
end


function ENT:Use(activator, player)
    if IsValid(player) and player:IsPlayer() && !self.InUse then
        self.InUse = true
        local dirtyMoneyAmount = tonumber(self:GetDirtyMoneyAmount())
        player:AddRedMoney(dirtyMoneyAmount)
        self:Remove()
    end
end