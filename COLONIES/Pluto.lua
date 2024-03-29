require("../COLONIES/BaseColony")
stepBonus = {0,1,2,2,3,3,4}
isActiveColony = true

function placementBonus(color)
    broadcastToAll("<COLONY>[==> "..getPlayerName(color).." get placement bonus 2 Cards from \""..self.getName().."\" ]",color)
    getDrawHolder("Project").call("dealCards",{colors={color},n=2})
end

function tradeBonus(color,position)
    broadcastToAll("<COLONY>[==> "..getPlayerName(color).." get trade bonus "..stepBonus[position].." Cards from \""..self.getName().."\" ]",color)
    getDrawHolder("Project").call("dealCards",{colors={color},n=stepBonus[position]})
end

function colonyBonus(color)
    broadcastToAll("<COLONY>[==> "..getPlayerName(color).." get colony bonus 1 Card and then discard 1 Card from \""..self.getName().."\" ]",color)
    getDrawHolder("Project").call("dealCards",{colors={color},n=1})
end
