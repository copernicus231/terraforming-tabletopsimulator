require("../COLONIES/BaseColony")
stepBonus = {1,2,3,4,6,8,10}
isActiveColony = true

function placementBonus(color)
    broadcastToAll("<COLONY>[==> "..getPlayerName(color).." get placement bonus increase 1 step (St) production from \""..self.getName().."\" ]",color)
    getPlayerBoard(color).call("moveProduction",{resource="St",step=1})
end

function tradeBonus(color,position)
    broadcastToAll("<COLONY>[==> "..getPlayerName(color).." get trade bonus "..stepBonus[position].." (St) resources from \""..self.getName().."\" ]",color)
    getPlayerBoard(color).call("addResource",{resource="St",value=stepBonus[position]})

end

function colonyBonus(color)
    broadcastToAll("<COLONY>[==> "..getPlayerName(color).." get colony bonus 2 (St) resources from \""..self.getName().."\" ]",color)
    getPlayerBoard(color).call("addResource",{resource="St",value=2})
end
