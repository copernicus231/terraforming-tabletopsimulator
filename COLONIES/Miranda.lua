require("../COLONIES/BaseColony")
stepBonus = {0,1,1,2,2,3,3}
isActiveColony = false

function placementBonus(color)
    broadcastToAll("<COLONY>[==> "..getPlayerName(color).." get placement bonus 1 (Animal) resources from \""..self.getName().."\" ]",color)
    getPlayerBoard(color).call("addResource",{resource="ANIMAL",value=1})
end

function tradeBonus(color,position)
    broadcastToAll("<COLONY>[==> "..getPlayerName(color).." get trade bonus "..stepBonus[position].." (Animal) resources from \""..self.getName().."\" ]",color)
    getPlayerBoard(color).call("addResource",{resource="ANIMAL",value=stepBonus[position]})
end

function colonyBonus(color)
    broadcastToAll("<COLONY>[==> "..getPlayerName(color).." get colony bonus 1 Card from \""..self.getName().."\" ]",color)
    getDrawHolder("Project").call("dealCards",{colors={color},n=1})
end
