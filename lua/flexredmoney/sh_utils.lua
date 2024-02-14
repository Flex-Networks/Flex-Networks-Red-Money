FRedMoney = FRedMoney or {}


local PLAYER = FindMetaTable("Player")

function PLAYER:AddRedMoney(amount)
    self:SetNWInt("RedMoney", self:GetNWInt("RedMoney") + amount)
end

function PLAYER:TakeRedMoney(amount)
    self:SetNWInt("RedMoney", self:GetNWInt("RedMoney") - amount)
end

function PLAYER:SetRedMoney(amount)
    self:SetNWInt("RedMoney", amount)
end

function PLAYER:GetRedMoney()
    return self:GetNWInt("RedMoney", 0)
end