require("../UTIL/Utility")
require("../UTIL/Track")
require("../UTIL/GetComponents")

function initColonySnap()
    for i = 1,7 do
        colonySnapMap[i] = i
    end
end

colonySnapMap={}
colonyBonus= function (color) broadcastToColor("DEFAUL COLONY BONUS FROM "..self.getName(),color) end
tradeBonus = function (color,position) print("DEFAULT TRADE: " .. color .. " position: ".. position) end
placementBonus = function (color) print("DEFAULT PLACE BONUS" .. color) end
bottomConf = {
    index = 0, click_function = 'activate', function_owner = self, label = "ACTIVATE",
    position = {1,0.25,-0.8}, width = 400, height = 200, font_size = 100,font_color={1,1,1,100},color={1,1,1,0},tooltip="ACTIVATE"
}

colonyTrack={marker={},snapMap=colonySnapMap,level={},parent=self}
hasFleet = false
isEnable = false
function onSave()
    local marker = {}
    for i,a in pairs(colonyTrack.marker) do
        marker[i] = a.getGUID()
    end
    local data_to_save = {isActiveColony=isActiveColony,isEnable=isEnable,markerGUID=marker,hasFleet=hasFleet}
    save_state = JSON.encode(data_to_save)
    return save_state
end
loadingGame = true
function onLoad(save_state)
    initColonySnap()
    Track:new(colonyTrack)
    colonyCount = 0
    if save_state != nil and save_state != '' then
        local json = JSON.decode(save_state)
        isActiveColony = json.isActiveColony
        isEnable = json.isEnable
        hasFleet = json.hasFleet
        local marker = json.markerGUID
        for i,a in pairs(marker) do
            colonyTrack.marker[i] = getObjectFromGUID(a)
            colonyTrack.level[i] = 0
            colonyTrack:updateLevel(i)
            colonyCount = colonyCount + 1
        end
        if colonyCount > 0 then
            colonyCount = colonyCount - 1
        end
    end
    if not isEnable then
        self.createButton(bottomConf)
    end
    loadingGame=false
end

function activate()
    if self.getLock() then
        isActiveColony = true
        setup()
        self.removeButton(bottomConf.index)
    else
        broadcastToAll("BLOCK FOR ACTIVATE")
    end
end

function setup()
  if isActiveColony then
    colonyTrack.marker["Grey"] = getBag("ColonyMarker").takeObject()
    colonyTrack.level["Grey"] = 0
    colonyTrack:setTrackPosition("Grey",2)
    isEnable = true
    self.removeButton(bottomConf.index)
  end
end



function addColony(colony)
    if colonyCount < 3 and colony.memo ==  nil then
        colonyCount = colonyCount + 1
        if colonyTrack:getTrackPosition("Grey") <= colonyCount then
            colonyTrack:setTrackPosition("Grey",colonyCount + 1)
        end
        colony.memo = tostring(colonyCount)
        colonyTrack.marker[tostring(colonyCount)]=colony
        colonyTrack.level[tostring(colonyCount)]=1
        colonyTrack:setTrackPosition(tostring(colonyCount),colonyCount)
        local ready = false
        Wait.condition(function() colony.setLock(true);colony.addTag("Placed"); end, function() return colony.resting end)
        placementBonus(toLColor(colony.getColorTint()))
    end
end

function removeColony(colony)
    if colony.memo != nil then
        colonyTrack.marker[colony.memo] = nil
        colonyTrack.level[colony.memo] = nil
        colony.memo=nil
        colonyCount = colonyCount - 1
    end
end

function trade(fleet)
    local delay = 0
    local tposition = colonyTrack:getTrackPosition("Grey")
    for i,a in pairs(colonyTrack.marker) do
        if i != "Grey" then
            Wait.frames(function() colonyBonus(toLColor(a.getColorTint()),tposition) end,delay)
            delay=delay + 20
        end
    end
    Wait.frames(function() tradeBonus(toLColor(fleet.getColorTint()),colonyTrack:getTrackPosition("Grey"));colonyTrack:setTrackPosition("Grey",colonyCount + 1) end,delay)
end

function incrementTrack()
    colonyTrack:moveTrack("Grey",1)
end

function onCollisionEnter(collision_info)

    -- collision_info table:
    --   collision_object    Object
    --   contact_points      Table     {Vector, ...}
    --   relative_velocity   Vector
    if loadingGame then
        return
    end
    local obj = collision_info.collision_object
    if not self.getLock() then
        log("COLONY TILE <"..self.getName() .. "> MUST BE LOCK AT TABLE FOR BE USE ")
        return
    end

    if obj.hasTag("ColonyMarker") and isEnable then
        colonyTrack:updateLevel("Grey")
        return
    end
    if obj.hasTag("Fleet") and not hasFleet then
        hasFleet = true
        trade(obj)
        return
    end
    if obj.hasTag("PlayerCube") and not obj.hasTag("Placed") then
       addColony(obj)
    end

end

function onCollisionExit(collision_info)
    -- collision_info table:
    --   collision_object    Object
    --   contact_points      Table     {Vector, ...}
    --   relative_velocity   Vector
    if loadingGame then
        return
    end
    local obj = collision_info.collision_object
    if obj.getLock() then
        return
    end

    if not self.getLock() then
        log("COLONY TILE <"..self.getName() .. "> MUST BE LOCK AT TABLE FOR BE USE")
        return
    end

    if obj.hasTag("PlayerCube") and  obj.hasTag("Placed") then
        obj.removeTag("Placed")
        removeColony(obj)
    end



end
