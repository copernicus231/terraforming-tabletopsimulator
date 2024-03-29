require("../COLONIES/BaseColony")
stepBonus = {0,1,1,2,2,3,4}
isActiveColony = true

function placementBonus(color)
    broadcastToAll("<COLONY>[==> "..getPlayerName(color).." get placement bonus 1 planetary tag and 2 Science Tag from \""..self.getName().."\" ]",color)
    --getPlayerBoard(color).call("addResource",{resource="MC",value=5})
end

function tradeBonus(color,position)
    broadcastToAll("<COLONY>[==> "..getPlayerName(color).." get trade bonus increase "..stepBonus[position].." steps lowest planetary track from \""..self.getName().."\" ]",color)
end

function colonyBonus(color)
    broadcastToAll("<COLONY>[==> "..getPlayerName(color).." get colony bonus 2 (MC) from \""..self.getName().."\" ]",color)
    getPlayerBoard(color).call("addResource",{resource="MC",value=2})
end
