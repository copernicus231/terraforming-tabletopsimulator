require("../COLONIES/BaseColony")
stepBonus = {2,3,4,6,8,10,13}
isActiveColony = true

function placementBonus(color)
    broadcastToAll("<COLONY>[==> "..getPlayerName(color).." get placement bonus increase 1 step (He) production from \""..self.getName().."\" ]",color)
    getPlayerBoard(color).call("moveProduction",{resource="He",step=1})
end

function tradeBonus(color,position)
    broadcastToAll("<COLONY>[==> "..getPlayerName(color).." get trade bonus "..stepBonus[position].." (He) resources from \""..self.getName().."\" ]",color)
    getPlayerBoard(color).call("addResource",{resource="He",value=stepBonus[position]})
end

function colonyBonus(color)
    broadcastToAll("<COLONY>[==> "..getPlayerName(color).." get colony bonus 2 (He) resources from \""..self.getName().."\" ]",color)
    getPlayerBoard(color).call("addResource",{resource="He",value=2})
end
