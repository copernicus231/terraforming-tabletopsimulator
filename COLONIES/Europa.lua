require("../COLONIES/BaseColony")
stepBonus = {"MC","MC","En","En","Pl","Pl","Pl"}
isActiveColony = true

function placementBonus(color)
  local pos = getCardPlayTable(color).positionToWorld(Vector(0,1,-2.7))
  if getBag("Ocean") != nil and getBag("Ocean") != Global then
          if getBag("Ocean").getQuantity() >= 1 then
              getBag("Ocean").takeObject({position = pos})
                broadcastToAll("<COLONY>[==> "..getPlayerName(color).." get placement bonus 1 Ocean from \""..self.getName().."\" ]",color)
          end
  end
end

function tradeBonus(color,position)
    broadcastToAll("<COLONY>[==> "..getPlayerName(color).." get trade bonus 1 ("..stepBonus[position]..") production from \""..self.getName().."\" ]",color)
    getPlayerBoard(color).call("moveProduction",{resource=stepBonus[position],step=1})
end

function colonyBonus(color)
    broadcastToAll("<COLONY>[==> "..getPlayerName(color).." get colony bonus 1 (MC) from \""..self.getName().."\" ]",color)
    getPlayerBoard(color).call("addResource",{resource="MC",value=1})
end
