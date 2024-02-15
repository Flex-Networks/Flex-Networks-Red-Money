AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")

function ENT:Initialize()
	self:SetModel(FRedMoney.Config.NPCModel or "models/player/Group03/female_01.mdl")
	self:PhysicsInit(SOLID_VPHYSICS)
	self:SetSolid(SOLID_BBOX)
    self:SetRate(math.floor(math.random(FRedMoney.Config.RedMoneyRates["min"], FRedMoney.Config.RedMoneyRates["max"])))

    self:SetUseType(SIMPLE_USE) // this is what u need makes it so ENT:Use only gets called once
end

function ENT:Use(ply)
    if ply.RedCooldown and CurTime() < ply.RedCooldown then return end
    ply.RedCooldown = ply.RedCooldown + CurTime() + 1

    local amt = ply:GetRedMoney()
    if not amt then
        ply:ChatPrint("[RedMoney] : Error, Fetching Data.")
        return
    end

    if amt <= 0 then
        ply:ChatPrint("[RedMoney] : Error You Have No Red Money")
        return
    end

    local percent = self:GetRate()
    if percent > 0 and amt >= 0 then
        local amount = DarkRP.formatMoney(math.floor(amt - (amt * (percent / 100))))
        ply:ChatPrint("Here is your " .. amount .. " after my tax") 
        ply:SetRedMoney(0)
        FRedMoney.PayoutPlayer(ply, math.floor(amt - (amt * (percent / 100))))
    end
end

-- fml omfg // you overcomplicate things too much
// also stop switching between "" and '' i cant tell if your pasting