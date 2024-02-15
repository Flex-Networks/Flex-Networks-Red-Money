FRedMoney = FRedMoney or {}
FRedMoney.Config = FRedMoney.Config or {}

FRedMoney.Config.RedMoneyRates = {
    ["min"] = 1,
    ["max"] = 10,-- max it takes in tax
}

FRedMoney.Config.LooseWhenDie = true -- loose money when you die

FRedMoney.Config.NPCModel = "models/player/Group03/female_01.mdl" -- model of the npc

FRedMoney.Config.RateRefreshTime = 20 -- how often the tax rate refreshes

FRedMoney.Config.OverwriteDarkRPFunction = true -- overwrites addMoney so it adds redmoney instead

FRedMoney.Config.Debug = true -- Debug

FRedMoney.Config.DefaultHud = true -- basic hud

--  PLAYER:GetRedMoney() -- is how to get redmoney 