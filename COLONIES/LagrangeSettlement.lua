require("../COLONIES/BaseColony")
stepBonus = {"1 Card","1 Card","1 (MC) Production","1 Terraform","Increment Venus","1 Colony","1 City"}
isActiveColony = true

function placementBonus(color)
    broadcastToAll("<COLONY>[==> "..getPlayerName(color).." get placement bonus 8 (MC) from \""..self.getName().."\" ]",color)
    getPlayerBoard(color).call("addResource",{resource="MC",value=8})
end

function tradeBonus(color,position)

    if position == 1 or position == 2 then
        broadcastToAll("<COLONY>[==> "..getPlayerName(color).." get trade bonus "..stepBonus[position].." from \""..self.getName().."\" ]",color)
        getDrawHolder("Project").call("dealCards",{colors={color},n=1})
    elseif position == 3 then
        broadcastToAll("<COLONY>[==> "..getPlayerName(color).." get trade bonus "..stepBonus[position].." from \""..self.getName().."\" ]",color)
        getPlayerBoard(color).call("moveProduction",{resource="MC",step=1})
    elseif position == 4 then
        if getBoard("BaseGame").call("moveTrack",{step=1,color=color,name="tr"}) then
            broadcastToAll("<COLONY>[==> "..getPlayerName(color).." increase Terraform 1 steps from \""..self.getName().."\" ]",color)
        end
    elseif position == 5 then
        if getBoard("VenusNext").call("moveTrack",{name="venusScale",step=1,color=color}) then
            broadcastToAll("<COLONY>[==> "..getPlayerName(color).." get placement bonus increment 1 step Venus Scale from \""..self.getName().."\" ]",color)
        end
    elseif position == 6 then
        broadcastToAll("<COLONY>[==> "..getPlayerName(color).." get trade bonus "..stepBonus[position].." from \""..self.getName().."\" ]",color)
    elseif position == 7 then
        local bag = getBag("City")
        local pos = getCardPlayTable(color).positionToWorld(Vector(0,1,-2.7))
        if bag != nil and bag != Global then
            bag.takeObject({position = pos})
            broadcastToAll("<COLONY>[==> "..getPlayerName(color).." get trade bonus "..stepBonus[position].." from \""..self.getName().."\" ]",color)
        end
    end
end

function colonyBonus(color)
    broadcastToAll("<COLONY>[==> "..getPlayerName(color).." get colony bonus 3 (MC) from \""..self.getName().."\" ]",color)
    getPlayerBoard(color).call("addResource",{resource="MC",value=3})
end
