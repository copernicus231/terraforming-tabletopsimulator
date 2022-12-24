require("../COLONIES/BaseColony")
stepBonus = {"He","He","He","St","St","Ti","Ti"}
isActiveColony = true

function placementBonus(color)
    broadcastToAll("<COLONY>[==> "..getPlayerName(color).." get as placement bonus any colony trade bonus from \""..self.getName().."\" ]",color)
end

function tradeBonus(color,position)
    broadcastToAll("<COLONY>[==> "..getPlayerName(color).." get trade bonus increase 1 step ("..stepBonus[position]..") production from \""..self.getName().."\" ]",color)
    getPlayerBoard(color).call("moveProduction",{resource=stepBonus[position],step=1})
end

function colonyBonus(color)
    broadcastToAll("<COLONY>[==> "..getPlayerName(color).." get colony bonus 2 (MC) from \""..self.getName().."\" ]",color)
    getPlayerBoard(color).call("addResource",{resource="MC",value=2})
end
