local PLAYER = FindMetaTable("Player")

function PLAYER:AddRedMoney(amount)
    FRedMoney:DebugPrint("Adding " .. amount .. " to " .. self:Nick() .. "'s RedMoney")
    self:SetNWInt("RedMoney", self:GetNWInt("RedMoney") + amount)
end

function PLAYER:TakeRedMoney(amount)
    self:SetNWInt("RedMoney", self:GetNWInt("RedMoney") - amount)
end

if FRedMoney.Config.OverwriteDarkRPFunction then
    function PLAYER:addMoney(amount)
        FRedMoney:DebugPrint("Added Red money to" .. self:Nick() .. " @ " .. amount .. "\n RedMoney - sv_utils.lua : 7")
        self:AddRedMoney(amount)
    end
end

function PLAYER:SetRedMoney(amount)
    self:SetNWInt("RedMoney", amount)
end

function FRedMoney.PayoutPlayer(ply, amount)
    if not IsValid(ply) or not ply:IsPlayer() then return end
    amount = tonumber(amount)
    if not amount then
        FRedMoney:DebugPrint("   [FRedMoney.PayoutPlayer]   -> Amount is nil?")
        return
    end
    ply:addMoney(amount)
    hook.Run("FRedMoney.PayOut" , ply , amount) // For logs perchance
end

function FRedMoney:ChangeTax()
    assert( isnumber(FRedMoney.Config.RedMoneyRates["min"]) == true , "Well we fucked up FRedMoney.Config.RedMoneyRates.min is not a fucking number")
    assert( isnumber(FRedMoney.Config.RedMoneyRates["max"]) == true , "Well we fucked up FRedMoney.Config.RedMoneyRates.max is not a fucking number")
    for k, v in ipairs( ents.FindByClass( "flex_money_cleaner" ) ) do
        v:SetRate(math.floor(math.random(FRedMoney.Config.RedMoneyRates["min"], FRedMoney.Config.RedMoneyRates["max"])))
    end
end

timer.Create("FRedMoney.Config.RateRefreshTime" , FRedMoney.Config.RateRefreshTime or 30 , 0 , function()
	FRedMoney:ChangeTax()
    hook.Run("FRedMoney.TaxesUpdated") // For logs perchance
end)

function FRedMoney:CreateMoneyModel(position, amount)
    local ditrymoney_mdl = ents.Create("flex_money_ent")
    ditrymoney_mdl:SetPos(position)
    ditrymoney_mdl:SetDirtyMoneyAmount(tostring(amount) or 0)
    ditrymoney_mdl:Spawn()
    ditrymoney_mdl:Activate()
    return ditrymoney_mdl
end

hook.Add( "PlayerDeath", "FRedMoney.PlayerDeath", function( victim, inflictor, attacker )
    if FRedMoney.Config.LooseWhenDie then
	    local money = victim:GetRedMoney()
	    victim:SetRedMoney(0)
        if money > 0 then
            attacker:ChatPrint( victim:Nick() .. " has dropped " .. DarkRP.formatMoney(money) )
            FRedMoney:CreateMoneyModel(victim:GetPos() + Vector(0, 0, 10) , tostring(money))
            hook.Run("FRedMoney.LoseMoneyOnDeath" , victim , attacker , money) // For logs perchance
        end
    end
end)
