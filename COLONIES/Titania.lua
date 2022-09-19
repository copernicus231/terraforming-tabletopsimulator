require("../COLONIES/BaseColony")
stepBonus = {12,12,12,12,11,10,9}
isActiveColony = true

function placementBonus(color)
    broadcastToAll("<COLONY>[==> "..getPlayerName(color).." get placement bonus 3 Victory Points from \""..self.getName().."\" ]",color)
    getTagTable(color).call("addVps",{count=3})
end

function tradeBonus(color,position)
    broadcastToAll("<COLONY>[==> "..getPlayerName(color).." get trade bonus "..stepBonus[position].." (MC) from \""..self.getName().."\" ]",color)
    getPlayerBoard(color).call("addResource",{resource="MC",value=stepBonus[position]})
end

function colonyBonus(color)

    if getPlayerBoard(color).call("payResource",{value = 3,resource = "MC"}) then
        broadcastToAll("<COLONY>[==> "..getPlayerName(color).." pay colony bonus -3 (MC) from \""..self.getName().."\" ]",color)
    else
        broadcastToAll("<COLONY>[==> "..getPlayerName(color).." must pay colony bonus -3 (MC) from \""..self.getName().."\" ]",color)
    end
end
