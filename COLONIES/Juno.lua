require("../COLONIES/BaseColony")
stepBonus = {0,0,1,1,2,3,4}
isActiveColony = true

function placementBonus(color)
    broadcastToAll("<COLONY>[==> "..getPlayerName(color).." get placement bonus perform 1 card action without pay there cost from \""..self.getName().."\" ]",color)
end

function tradeBonus(color,position)
    broadcastToAll("<COLONY>[==> "..getPlayerName(color).." get trade bonus move "..stepBonus[position].." resources around cards from \""..self.getName().."\" ]",color)
end

function colonyBonus(color)
    broadcastToAll("<COLONY>[==> "..getPlayerName(color).." get colony bonus mark as used one blue card of any player from \""..self.getName().."\" ]",color)
end
