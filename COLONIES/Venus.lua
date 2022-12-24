require("../COLONIES/BaseColony")
stepBonus = {0,1,1,2,3,5,7}
isActiveColony = true

function placementBonus(color)
    if getBoard("VenusNext").call("moveTrack",{name="venusScale",step=1,color=color}) then
        broadcastToAll("<COLONY>[==> "..getPlayerName(color).." get placement bonus increment 1 step Venus Scale from \""..self.getName().."\" ]",color)
    end
end

function tradeBonus(color,position)
    broadcastToAll("<COLONY>[==> "..getPlayerName(color).." get trade bonus "..stepBonus[position].." (Standard) different resources from \""..self.getName().."\" ]",color)
end

function colonyBonus(color)
    broadcastToAll("<COLONY>[==> "..getPlayerName(color).." get colony bonus increment or decrement any other colony track 1 step from \""..self.getName().."\" ]",color)
end
