require("../COLONIES/BaseColony")
stepBonus = {"(Ore)","2 (Ore)","Space =< 20","Space =< 20","Space =< 20","Space > 20","Space > 20"}
isActiveColony = true

function placementBonus(color)
    broadcastToAll("<COLONY>[==> "..getPlayerName(color).." get placement bonus increase 1 step (Ti) production from \""..self.getName().."\" ]",color)
    getPlayerBoard(color).call("moveProduction",{resource="Ti",step=1})
end

function tradeBonus(color,position)
    broadcastToAll("<COLONY>[==> "..getPlayerName(color).." get trade bonus "..stepBonus[position].." from \""..self.getName().."\" ]",color)
    if position == 1 then
        getPlayerBoard(color).call("addResource",{resource="Ore",value=1})
    elseif position == 2 then
        getPlayerBoard(color).call("addResource",{resource="Ore",value=2})
    end
end

function colonyBonus(color)
    broadcastToAll("<COLONY>[==> "..getPlayerName(color).." can use Ore as 2 for pay space cards from \""..self.getName().."\" ]",color)
end
