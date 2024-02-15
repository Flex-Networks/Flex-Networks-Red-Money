AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")

function ENT:Initialize()
	self:SetModel(FRedMoney.Config.NPCModel or "models/player/Group03/female_01.mdl")
	self:PhysicsInit(SOLID_VPHYSICS)
	self:SetSolid(SOLID_BBOX)
    self.NextThink = CurTime()
    self:SetRate(math.floor(math.random(FRedMoney.Config.RedMoneyRates["min"], FRedMoney.Config.RedMoneyRates["max"])))
end

function ENT:AcceptInput(i,p,a,z)
    if IsFirstTimePredicted() and !p._l_asttime then 
        p._l_asttime = true
        timer.Simple(1, function()
            p._l_asttime = false
        end)
        local amt = p:GetRedMoney()
        if not amt then
            if not IsFirstTimePredicted() then return end
            p:ChatPrint('[RedMoney] : Error, Fetching Data.')
        end

        local percent = self:GetRate()

        if percent > 0 and amt >= 0 then
            if not IsFirstTimePredicted() then return end
            local amount = DarkRP.formatMoney(math.floor(amt - (amt * (percent / 100))))
            p:ChatPrint("Here is your " .. amount .. " after my tax")-- debugging 
            p:SetRedMoney(0)
            FRedMoney.PayoutPlayer(p, math.floor(amt - (amt * (percent / 100))))
        end

        if amt <= 0 then
            if not IsFirstTimePredicted() then return end
            p:ChatPrint('[RedMoney] : Error You Have No Red Money')
            return false 
        end
    end
end

-- fml omfg