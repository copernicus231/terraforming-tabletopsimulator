require("../UTIL/Utility")
require("../UTIL/Track")
require("../UTIL/TrackMarkerButton")
require("../UTIL/TileButton")
require("../UTIL/TileZone")
require("../UTIL/GetComponents")

function payTrackBonus(params)
     local name = params.name
     local color = params.color
     local step = params.step
     local bonusTrack = tracks[name]:getBonus("Grey",step)
     local bonus = {}
     for i,a in pairs(bonusTrack) do
             if i == "PLAYER" then
                 if color != "Grey" then
                     bonus[color] = bonus[color] or {}
                     for x,y in pairs(a) do
                         bonus[color][x] = (bonus[color][x] or 0) + y
                     end
                 end
             elseif i == "EVERYONE" then
                 for _,kolor in pairs(Global.call("getPlayers",{})) do
                     bonus[kolor] = bonus[kolor] or {}
                     for x,y in pairs(a) do
                         bonus[kolor][x] = (bonus[kolor][x] or 0) + y
                     end
                 end
             end
     end
     applyBonusC(bonus)
     --bonus.PLAYER
end

function applyBonusC(bonus)
    for i,x in pairs(bonus) do
        applyBonus(x,i)
   end
end

function applyBonus(bonus,color)
    for resource,total in pairs(bonus) do
        --ADD OTHER CASES
        if resource == "Card" then
            getDrawHolder("Project").call("dealCards",{colors={color},n=total})
            broadcastToAll("<BOARD>[==> "..getPlayerName(color).." get "..total.. " Cards ]",Color.fromString(color))
        elseif resource == "Temperature" then
            if getBoard("BaseGame").call("moveTrack",{name="temperature",step=total,color=color})then
                broadcastToAll("<BOARD>[==> "..getPlayerName(color).." increment temperature "..total.." steps ]",Color.fromString(color))
            end
        elseif resource == "Oxygen" then
            if getBoard("BaseGame").call("moveTrack",{step=total,color=color,name="oxygen"}) then
                broadcastToAll("<BOARD>[==> "..getPlayerName(color).." increase Oxygen "..total.." steps ]",Color.fromString(color))
            end
        elseif resource == "VenusScale" then
            if getBoard("VenusNext").call("moveTrack",{name="venusScale",step=total,color=color}) then
                broadcastToAll("<BOARD>[==> "..getPlayerName(color).." increase Venus parameter "..total.." steps ]",Color.fromString(color))
            end
        elseif resource == "Delegate" then
            broadcastToAll("<BOARD>[==> "..getPlayerName(color).." get "..total.." delegate ]",Color.fromString(color))
        elseif resource == "Colony" then
            broadcastToAll("<BOARD>[==> "..getPlayerName(color).." get "..total.." colony ]",Color.fromString(color))
        elseif resource == "City" or resource == "Greenery" or resource == "Ocean" then
            if total > 0 then
                local pos = getCardPlayTable(color).positionToWorld(Vector(0,1,-2.7))
                if getBag(resource) != nil and getBag(resource) != Global then
                    for i=1,total do
                        if getBag(resource).getQuantity() >= 1 then
                            getBag(resource).takeObject({position = pos})
                            broadcastToAll("<BOARD>[==> "..getPlayerName(color).." get "..total.." ("..resource..") ]",Color.fromString(color))
                        end
                    end
                else
                    broadcastToAll("<BOARD>[==> "..getPlayerName(color).." must take "..total.." ("..resource..") ]",Color.fromString(color))
                end
            end
        elseif resource == "TERRAFORM" then
            getBoard("BaseGame").call("moveTrack",{name="tr",step=total,color=color})
            broadcastToAll("<BOARD>[==> "..getPlayerName(color).." increase "..total.. " step terraform ]",Color.fromString(color))
        elseif resource == "CardBuilding" then
            broadcastToAll("<BOARD>[==> "..getPlayerName(color).." take "..total.. " building Card ]",Color.fromString(color))
        elseif resource == "ProdEn" then
            getPlayerBoard(color).call("moveProduction",{resource="En",step=total})
            if total > 0 then
                broadcastToAll("<BOARD>[==> "..getPlayerName(color).." increase "..(total).." steps (En) production ]",Color.fromString(color))
            else
                broadcastToAll("<BOARD>[==> "..getPlayerName(color).." reduce "..(total).." steps (En) production ]",Color.fromString(color))
            end
        elseif resource == "ProdHe" then
            getPlayerBoard(color).call("moveProduction",{resource="He",step=total})
            if total > 0 then
                broadcastToAll("<BOARD>[==> "..getPlayerName(color).." increase "..(total).." steps (He) production ]",Color.fromString(color))
            else
                broadcastToAll("<BOARD>[==> "..getPlayerName(color).." reduce "..(total).." steps (He) production ]",Color.fromString(color))
            end
        elseif resource == "ProdPl" then
            getPlayerBoard(color).call("moveProduction",{resource="Pl",step=total})
            if total > 0 then
                broadcastToAll("<BOARD>[==> "..getPlayerName(color).." increase "..(total).." steps (Pl) production ]",Color.fromString(color))
            else
                broadcastToAll("<BOARD>[==> "..getPlayerName(color).." reduce "..(total).." steps (Pl) production ]",Color.fromString(color))
            end
        elseif resource == "ProdSt" then
            getPlayerBoard(color).call("moveProduction",{resource="St",step=total})
            if total > 0 then
                broadcastToAll("<BOARD>[==> "..getPlayerName(color).." increase "..(total).." steps (St) production ]",Color.fromString(color))
            else
                broadcastToAll("<BOARD>[==> "..getPlayerName(color).." reduce "..(total).." steps (St) production ]",Color.fromString(color))
            end
        elseif resource == "ProdTi" then
            getPlayerBoard(color).call("moveProduction",{resource="Ti",step=total})
            if total > 0 then
                broadcastToAll("<BOARD>[==> "..getPlayerName(color).." increase "..(total).." steps (Ti) production ]",Color.fromString(color))
            else
                broadcastToAll("<BOARD>[==> "..getPlayerName(color).." reduce "..(total).." steps (Ti) production ]",Color.fromString(color))
            end
        elseif resource == "ProdMC" then
            getPlayerBoard(color).call("moveProduction",{resource="MC",step=total})
            if total > 0 then
                broadcastToAll("<BOARD>[==> "..getPlayerName(color).." increase "..(total).." steps (MC) production ]",Color.fromString(color))
            else
                broadcastToAll("<BOARD>[==> "..getPlayerName(color).." reduce "..(total).." steps (MC) production ]",Color.fromString(color))
            end
        elseif resource == "Rsrc" then
            broadcastToAll("<BOARD>[==> "..getPlayerName(color).." get "..(total).." standard or not standard resource ]",Color.fromString(color))
        elseif resource == "StdRsrc" then
            broadcastToAll("<BOARD>[==> "..getPlayerName(color).." get "..(total).." standard resource ]",Color.fromString(color))
        elseif string.sub(resource,string.len(resource)-2) == "Tag" then
            getTagTable(color).call("addTags",{tags = {string.sub(resource,1,string.len(resource)-3)}})
            broadcastToAll("<BOARD>[==> "..getPlayerName(color).." get "..total.." ("..resource..") ]",Color.fromString(color))
        elseif string.sub(resource,1,4) == "Prod" then
            broadcastToAll("<BOARD>[==> "..getPlayerName(color).." get "..total.." ("..resource..") ]",Color.fromString(color))
        elseif string.sub(resource,1,11) == "NuclearTile" then
            for i,a in pairs(getBag("SpecialTile").getObjects()) do
                if a.name == "Nuclear Tile "..string.sub(resource,12,12)  then
                    local pos = getCardPlayTable(color).positionToWorld(Vector(0,1,-2.7))
                    getBag("SpecialTile").takeObject({index = a.index,position=pos})
                    broadcastToAll("<BOARD>[==> "..getPlayerName(color).." put "..a.name.." ]",Color.fromString(color))
                end
            end
        else
            if total > 0 then
                getPlayerBoard(color).call("addResource",{resource=resource,value=total})
                broadcastToAll("<BOARD>[==> "..getPlayerName(color).." get "..total.." ("..resource..") ]",Color.fromString(color))
            elseif total < 0 then
                if getPlayerBoard(color).call("payResource",{resource=resource,value=(total*-1)}) then
                    broadcastToAll("<BOARD>[==> "..getPlayerName(color).." pay "..(total*-1).." ("..resource..") ]",Color.fromString(color))
                else
                    broadcastToAll("<BOARD>[==> "..getPlayerName(color).." must pay "..(total*-1).." ("..resource..") ]",Color.fromString(color))
                end
            else
                log("Resource Bonus "..resource.." is 0 due it cancel")
            end

        end
    end
end

function placeSpaceTile(obj,color)
    obj.memo=color
    return obj.hasTag("SpaceTile")
end

function placeTile(obj,color,zone)
    local position = zone:getZonePosition(obj)
    if position > 0 then
        obj.memo=color
        zone:placeTile(obj,position)
        if color != "Grey" then
            local bonus = zone:getPlacementBonusColor(position)
            for i,a in pairs(extraBonus(obj)) do
                bonus[color][i] = (bonus[color][i] or 0) + a
            end
            applyBonusC(bonus)
        end
        return true
    end
    return false
end

function placeReplaceTile(obj,color,zone)
    local position = zone:getZonePosition(obj)
    if position > 0 then
        obj.memo=color
        zone:placeTile(obj,position)
        if color != "Grey" then
            local bonus = zone:getAdjacencyBonusColor(position,color)
            for i,a in pairs(extraBonus(obj)) do
                bonus[color][i] = (bonus[color][i] or 0) + a
            end
            applyBonusC(bonus)
        end
        return true
    end
    return false
end

function extraBonus(obj)
    return {}
end

function moveTrack(params)
    local step = params.step
    local color = params.color
    local name = params.name
    if name != "tr" then
        if tracks[name]:moveTrack("Grey",step) then
            Wait.frames(function() payTrackBonus(params) end, 100)
            return true
        end
    else
        if tracks[name]:moveTrack(color,step) then
            return true
        end
    end
    return false
end
