require("../COLONIES/BaseColony")
stepBonus = {"(Ore) resource","2 (St) resources ","2 (Ti) resources ","1 (Asteroid)","1 (Asteroid) + 1 (Ti) resource","1 (Asteroid) + 1 (St) + 1 (Ti)","2 (Asteroid)"}
isActiveColony = true

function placementBonus(color)
    broadcastToAll("<COLONY>[==> "..getPlayerName(color).." get placement bonus 1 Temperature increment or 2 Asteroid from \""..self.getName().."\" ]",color)
end

function tradeBonus(color,position)
    broadcastToAll("<COLONY>[==> "..getPlayerName(color).." get trade bonus "..stepBonus[position].." from \""..self.getName().."\" ]",color)
    if position == 1 then
        getPlayerBoard(color).call("moveProduction",{resource="Ore",step=1})
    elseif position == 2 then
        getPlayerBoard(color).call("addResource",{resource="St",value=2})
    elseif position == 3 then
        getPlayerBoard(color).call("addResource",{resource="Ti",value=2})
    elseif position == 4 then
        getPlayerBoard(color).call("addResource",{resource="Asteroid",value=1})
    elseif position == 5 then
        getPlayerBoard(color).call("addResource",{resource="Asteroid",value=1})
        getPlayerBoard(color).call("addResource",{resource="Ti",value=1})
    elseif position == 6 then
        getPlayerBoard(color).call("addResource",{resource="Asteroid",value=1})
        getPlayerBoard(color).call("addResource",{resource="Ti",value=1})
        getPlayerBoard(color).call("addResource",{resource="St",value=1})
    elseif position == 7 then
        getPlayerBoard(color).call("addResource",{resource="Asteroid",value=2})
    end
end

function colonyBonus(color)
    broadcastToAll("<COLONY>[==> "..getPlayerName(color).." get colony bonus 1 standard resource from \""..self.getName().."\" ]",color)
end
