require("../CORE/Board")
PLAYER_MARKERS={}
function getOrCreatePlayerMarker(color)
    if PLAYER_MARKERS[color] == nil then
        local objs = getObjectsWithAllTags({color,"PlayerCube","PlayerMarker"})
        if #objs == 1 then
            PLAYER_MARKERS[color] = objs[1]
        elseif #objs == 0 then
            local bag = getPlayerBag(color)
            if bag != nil then
                local marker = bag.takeObject(bag.getPosition()+Vector(1,1,0))
                marker.addTag("PlayerMarker")
                marker.addTag(color)
                PLAYER_MARKERS[color] = marker
            end
        else
            log("Error more that one player marker")
            return objs[1]
        end
    end
    return PLAYER_MARKERS[color]
end

oxygenSnapMap = {}
oxygenBonusMap = {}
temperatureBonusMap={}
temperatureSnapMap={}
milestoneSnapMap={}
awardSnapMap={}
trSnapMap={}
tracks={
oxygen={marker={Grey=getTrackMarker("Oxygen")},snapMap=oxygenSnapMap,level={Grey=0},parent=self,bonusMap=oxygenBonusMap},
temperature={marker={Grey=getTrackMarker("Temperature")},snapMap=temperatureSnapMap,level={Grey=0},parent=self,bonusMap=temperatureBonusMap},
tr={marker={Grey=getTrackMarker("Generation")},snapMap=trSnapMap,level={Grey=0},parent=self}
}

oxygenTrackButton={button ={ index = 0,
    click_function = 'oxygenClick',
     function_owner = self,
     label = "",
     position = {0,1.2,0},
     rotation={0,0,0},
     width = 300,
     height = 300,
     font_size = 100,
     font_color={0,0,0,0},
     color=Color.fromString("Red"),
     hover_color={0,0,0,0},
     tooltip="Oxygen"
 },colorText="Red",track=tracks.oxygen,getCurrentColor=function() return getTurnToken().call("getCurrentPlayer") end,getNextColor= function(color) return Global.call("getNext",color) end}

temperatureTrackButton={button ={ index = 0,
    click_function = 'temperatureClick',
     function_owner = self,
     label = "",
     position = {0,1.2,0},
     rotation={0,0,0},
     width = 300,
     height = 300,
     font_size = 100,
     font_color={0,0,0,0},
     color=Color.fromString("Red"),
     hover_color={0,0,0,0},
     tooltip="Temperature"
 },colorText="Red",track=tracks.temperature,getCurrentColor=function() return getTurnToken().call("getCurrentPlayer") end,getNextColor= function(color) return Global.call("getNext",color) end}

 function temperatureClick(obj,player_clicker_color,alt_click)
     temperatureTrackButton:doClick(obj,player_clicker_color,alt_click,function(color,step) if color != "Grey" then log("temperature:"..color.."/"..step);tracks.temperature:updateLevel("Grey"); payTrackBonus({name="temperature",color=color,step=step}) end end)
 end

 function oxygenClick(obj,player_clicker_color,alt_click)
     oxygenTrackButton:doClick(obj,player_clicker_color,alt_click,function(color,step) if color != "Grey" then log("oxygen:"..color.."/"..step);tracks.oxygen:updateLevel("Grey"); payTrackBonus({name="oxygen",color=color,step=step})  end end)
 end


marsZone={matrix=matrixMap,parent=self,zoneTag=nil}



function powerPlantProject(obj,player_clicker_color,alt_click)
    setStandardProject(player_clicker_color,"Power Plant",{MC=11},{En=1},{})
    --getCardPlayTable(player_clicker_color).call("setProject",{label="Power Plant",cost={MC=11},prod={En=1}}) --,tags={"Power"}
end

function asteroidProject(obj,player_clicker_color,alt_click)
  setStandardProject(player_clicker_color,"Asteroid",{MC=14},{},{Temperature=1})
  --  getCardPlayTable(player_clicker_color).call("setProject",{label="Asteroid",cost={MC=14},rsrc={Temperature=1}})
end

function buildColonyProject(obj,player_clicker_color,alt_click)
  setStandardProject(player_clicker_color,"Build Colony",{MC=17},{},{})
  --  getCardPlayTable(player_clicker_color).call("setProject",{label="Build Colony",cost={MC=17}}) --,rsrc={Colony=1}
end

function aquiferProject(obj,player_clicker_color,alt_click)
  setStandardProject(player_clicker_color,"Aquifer",{MC=18},{},{Ocean=1})
  --  getCardPlayTable(player_clicker_color).call("setProject",{label="Aquifer",cost={MC=18},rsrc={Ocean=1}})
end

function greeneryProject(obj,player_clicker_color,alt_click)
  setStandardProject(player_clicker_color,"Greenery",{MC=23},{},{Greenery=1})
  --  getCardPlayTable(player_clicker_color).call("setProject",{label="Greenery",cost={MC=23},rsrc={Greenery=1}})
end

function cityProject(obj,player_clicker_color,alt_click)
  setStandardProject(player_clicker_color,"City",{MC=25},{MC=1},{City=1})
  --  getCardPlayTable(player_clicker_color).call("setProject",{label="City",cost={MC=25},prod={MC=1},rsrc={City=1}})
end
loadingGame = true

oceanTileButton={button = {
        index = 0, click_function = 'placeOceanClick', function_owner = self, label = "",
        position = {0,0.1,0},rotation={0,0,0},width = 300, height = 300, font_size = 100,font_color={0,0,0,0},color=Color.fromString("Red"),hover_color={0,0,0,0},tooltip="Place"
    },colorText="Red",getCurrentColor=function() return getTurnToken().call("getCurrentPlayer") end,getNextColor= function(color) return Global.call("getNext",color) end}

greeneryTileButton={button = {
            index = 0, click_function = 'placeGreeneryClick', function_owner = self, label = "",
            position = {0,0.1,0},rotation={0,0,0},width = 300, height = 300, font_size = 100,font_color={0,0,0,0},color=Color.fromString("Red"),hover_color={0,0,0,0},tooltip="Place"
        },colorText="Red",getCurrentColor=function() return getTurnToken().call("getCurrentPlayer") end,getNextColor= function(color) return Global.call("getNext",color) end}
genericTileButton={button = {
                    index = 0, click_function = 'placeGenericClick', function_owner = self, label = "",
                    position = {0,0.1,0},rotation={0,0,0},width = 300, height = 300, font_size = 100,font_color={0,0,0,0},color=Color.fromString("Red"),hover_color={0,0,0,0},tooltip="Place"
                },colorText="Red",getCurrentColor=function() return getTurnToken().call("getCurrentPlayer") end,getNextColor= function(color) return Global.call("getNext",color) end}

replaceTileButton={button = {
        index = 0, click_function = 'placeReplaceClick', function_owner = self, label = "",
        position = {0,0.1,0},rotation={0,0,0},width = 300, height = 300, font_size = 100,font_color={0,0,0,0},color=Color.fromString("Red"),hover_color={0,0,0,0},tooltip="Place"
    },colorText="Red",getCurrentColor=function() return getTurnToken().call("getCurrentPlayer") end,getNextColor= function(color) return Global.call("getNext",color) end}


disasterTileButton={button = {
    index = 0, click_function = 'placeDisasterClick', function_owner = self, label = "",
    position = {0,0.1,0},rotation={0,0,0},width = 300, height = 300, font_size = 100,font_color={0,0,0,0},color=Color.fromString("Red"),hover_color={0,0,0,0},tooltip="Place"
},colorText="Red",getCurrentColor=function() return getTurnToken().call("getCurrentPlayer") end,getNextColor= function(color) return Global.call("getNext",color) end}

function placeDisasterClick(obj,player_clicker_color,alt_click)
    disasterTileButton:doClick(obj,player_clicker_color,alt_click,function(obj,color)
        if color != 'Grey' then
            local pos = marsZone:getZonePosition(obj)
            if pos > 0 then
                marsZone:changePositionBonus(pos,obj)
                obj.setDescription("")
                if obj.hasTag("DustStorm") then
                    getBag("DustStorm").putObject(obj)
                elseif obj.hasTag("Erosion") then
                    getBag("Erosion").putObject(obj)
                end
            end
        elseif placeDisaster(obj) then
            broadcastToAll("<BOARD>[==> Disaster was place]")
        end
        
    end)
end
--{"replace":{"MC":-8,"TERRAFORM":1}}
function placeGreeneryClick(obj,player_clicker_color,alt_click)
    greeneryTileButton:doClick(obj,player_clicker_color,alt_click,function(obj,color)
        if placeTile(obj,color,marsZone) then
            if color != "Grey" then
                broadcastToAll("<BOARD>[==> "..getPlayerName(color).." place greenery ]", Color.fromString(color))
                local cube = getPlayerBag(color).takeObject({position=obj.getPosition()+vector(0, 3, 0)})
                Wait.condition(function() cube.lock() end, function() return cube.resting end)
                if moveTrack({name="oxygen",step=1,color=color}) then
                    broadcastToAll("<BOARD>[==> "..getPlayerName(color).." increase Oxygen 1 step ]",Color.fromString(color))
                end
            end
        end
    end)
end
function placeOceanClick(obj,player_clicker_color,alt_click)
    oceanTileButton:doClick(obj,player_clicker_color,alt_click,function(obj,color)
        if placeTile(obj,color,marsZone) then
            if color != "Grey" then
                broadcastToAll("<BOARD>[==> "..getPlayerName(color).." place ocean ]", Color.fromString(color))
                --tracks.tr:moveTrack(color,1)
                if moveTrack({name="tr",step=1,color=color}) then
                  broadcastToAll("<BOARD>[==> "..getPlayerName(color).." increase 1 step terraform ]",Color.fromString(color))
                end
            end
        end
    end)
end
function placeGenericClick(obj,player_clicker_color,alt_click)
    genericTileButton:doClick(obj,player_clicker_color,alt_click,function(obj,color)
        if placeTile(obj,color,marsZone) then
            broadcastToAll("<BOARD>[==> "..getPlayerName(color).." place "..obj.getName().." ]", Color.fromString(color))
            if obj.hasTag("City") then
                local cube = getPlayerBag(color).takeObject({position=obj.getPosition()+vector(0, 3, 0)})
                Wait.condition(function() cube.lock() end, function() return cube.resting end)
                --print("INCREMENT CITY COUNTER")
                getCityCounter().call("addCount",{color=color,type="City",count=1})
                --INCREMENT CITY COUNTER
            else
                local cube = getPlayerBag(color).takeObject({position=obj.getPosition()+vector(0, 3, 0)})
                Wait.condition(function() cube.lock() end, function() return cube.resting end)
            end
        elseif placeSpaceTile(obj,color) then
            --fix this
            broadcastToAll("<BOARD>[==> "..getPlayerName(color).." place "..obj.getName().." ]", Color.fromString(color))
            local cube = getPlayerBag(color).takeObject({position=obj.getPosition()+vector(0, 3, 0)})
            Wait.condition(function() cube.lock() end, function() return cube.resting end)
            --getCityCounter().Counter.increment()
            getCityCounter().call("addCount",{color=color,type="spaceCity",count=1})
            --print("INCREMENT SPACE CITY COUNTER")
        end
    end)
end

function placeReplaceClick(obj,player_clicker_color,alt_click)
    replaceTileButton:doClick(obj,player_clicker_color,alt_click,function(obj,color)
        if placeReplaceTile(obj,color,marsZone) then
            broadcastToAll("<BOARD>[==> "..getPlayerName(color).." place "..obj.getName().." ]", Color.fromString(color))
            if obj.hasTag("City") then
                local cube = getPlayerBag(color).takeObject({position=obj.getPosition()+vector(0, 3, 0)})
                Wait.condition(function() cube.lock() end, function() return cube.resting end)
                --print("INCREMENT CITY COUNTER")
                getCityCounter().call("addCount",{color=color,type="City",count=1})
                --getCityCounter().Counter.increment()
                --INCREMENT CITY COUNTER
            else
                local cube = getPlayerBag(color).takeObject({position=obj.getPosition()+vector(0, 3, 0)})
                Wait.condition(function() cube.lock() end, function() return cube.resting end)
            end
        end
    end)
end

function extraBonus(obj)
    if getBoard("WorldGoverment").getVar("currentIndex") == 4 then
        if obj.hasTag("Greenery") then
            return {MC=4}
        end
    elseif getBoard("WorldGoverment").getVar("currentIndex") == 1 then
        return {St=1}
    end
    return {}
end

function initZone()
    local objs = getObjectsWithAllTags({"MarsTile"})
    for i,a in ipairs(objs) do
        if a.getLock() then
            local pos = marsZone:getZonePosition(a)
            if pos != 0 then
                marsZone:placeTile(a,pos)
            end
        end
    end
end
function getTrackLevel(params)
    return tracks[params.track]:getTrackPosition(params.color)
end
function onLoad(save_state)
    log("new version 1.2")
    initOxygenSnapMap()
    Track:new(tracks.oxygen)
    tracks.oxygen:updateLevel("Grey")
    TrackMarkerButton:new(oxygenTrackButton)

    initTemperatureSnapMap()
    Track:new(tracks.temperature)
    tracks.temperature:updateLevel("Grey")
    TrackMarkerButton:new(temperatureTrackButton)

    initTrSnapMap()
    Track:new(tracks.tr)
    for i,marker in pairs(getObjectsWithAllTags({"PlayerMarker"})) do
        local color = toLColor(marker.getColorTint())
        tracks.tr.marker[color]=marker
        tracks.tr.level[color] = 0
        tracks.tr:updateLevel(color)
    end
    tracks.tr:updateLevel("Grey")

    TileButton:new(oceanTileButton)
    TileButton:new(greeneryTileButton)
    TileButton:new(genericTileButton)
    TileButton:new(replaceTileButton)
    TileButton:new(disasterTileButton)
    initMap()
    TileBoard:new(marsZone)
    initZone()
    for i,a in pairs(projects) do
            self.createButton(a)
    end
    initOtherSnap()
    loadingGame = false
end

function setup()
        tracks.oxygen:setTrackPosition("Grey",1)
        tracks.temperature:setTrackPosition("Grey",1)
        local delay = 0
        for i,color in pairs(Global.call("getPlayers")) do
            tracks.tr.marker[color] = getOrCreatePlayerMarker(color)
            tracks.tr.level[color] = 1
            Wait.frames(function() tracks.tr:setTrackPosition(color,20) end,delay)
            delay = delay + 40
        end
        Wait.frames(function() tracks.tr:setTrackPosition("Grey",1) end,20)
        
        getBag("Ocean").setLock(false);getBag("Ocean").setPositionSmooth(getOceanSnapPosition()+Vector(0,1,0))
        Wait.condition(function()
            getBag("Ocean").setLock(true)
        end,function() return not getBag("Ocean").spawning and getBag("Ocean").resting and not getBag("Ocean").isSmoothMoving() end)
end

function getOceanSnapPosition()
    return self.positionToWorld(self.getSnapPoints()[oceanSnap].position)
end
function getMilestoneSnapPosition(params)
    return self.positionToWorld(self.getSnapPoints()[milestoneSnapMap[params.index]].position)
end
function getAwardSnapPosition(params)
    return self.positionToWorld(self.getSnapPoints()[awardSnapMap[params.index]].position)
end

function getDustStormSnapPosition()
    return self.positionToWorld(self.getSnapPoints()[dustStormSnap].position)
end

function getErosionSnapPosition()
    return self.positionToWorld(self.getSnapPoints()[erosionSnap].position)
end

function onCollisionEnter(collision_info)
        if loadingGame then
            return
        end
        local obj = collision_info.collision_object
        --WORK AROUND WITH LOCK OBJECTS TRIGGER AN onCollisionExit
        if obj.getLock() then
            return
        end
        if obj.hasTag("TrackMarker") then
            if obj.hasTag("Oxygen") then
                oxygenTrackButton:add(obj)
            elseif obj.hasTag("Temperature") then
                temperatureTrackButton:add(obj)
            end
        elseif obj.hasTag("PlayerMarker") then
            tracks.tr:updateLevel(toLColor(obj.getColorTint()))
        end

        -- Add check when gets faster geometric algoritms for marsZone:getZonePosition(obj) > 0

        if obj.hasTag("MarsTile") and marsZone:getZonePosition(obj) > 0 then
            if obj.hasTag("Ocean") and not obj.hasTag("ReplaceTile") and not obj.hasTag("SpecialTile") then
                oceanTileButton:add(obj)
            elseif obj.hasTag("Greenery") and not obj.hasTag("ReplaceTile") and not obj.hasTag("SpecialTile") then
                greeneryTileButton:add(obj)
            elseif obj.hasTag("ReplaceTile") then
                replaceTileButton:add(obj)
            elseif obj.hasTag("DustStorm")  or obj.hasTag("Erosion") then
                disasterTileButton:add(obj)
            else
                genericTileButton:add(obj)
            end
        elseif obj.hasTag("SpaceTile") then
            genericTileButton:add(obj)
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
    --WORK AROUND WITH LOCK OBJECTS TRIGGER AN onCollisionExit
    if obj.getLock() then
        return
    end
    if obj.hasTag("TrackMarker") then
        if obj.hasTag("Oxygen") then
            oxygenTrackButton:remove(obj)
        elseif obj.hasTag("Temperature") then
            temperatureTrackButton:remove(obj)
        end
    elseif obj.hasTag("PlayerMarker") then

    end
    if obj.hasTag("MarsTile") then
        if obj.memo != nil then
            local pos = marsZone:getZonePosition(obj)
            if pos > 0 then
                marsZone:cleanPosition(pos)
            end
            obj.memo = nil
        end

        if obj.hasTag("Ocean") and not obj.hasTag("ReplaceTile")  and not obj.hasTag("SpecialTile") then
            oceanTileButton:remove(obj)
        elseif obj.hasTag("Greenery") and not obj.hasTag("ReplaceTile")  and not obj.hasTag("SpecialTile") then
            greeneryTileButton:remove(obj)
        elseif obj.hasTag("ReplaceTile") then
            replaceTileButton:remove(obj)
        elseif obj.hasTag("DustStorm") or obj.hasTag("Erosion") then
            disasterTileButton:remove(obj)
        else
            genericTileButton:remove(obj)
        end
    elseif obj.hasTag("SpaceTile") then
        genericTileButton:remove(obj)
    end

end

function onNumberTyped(player_color, number_typed)
    return true
end

function getEmptyN(params)
    local n = params.n
    local reverse = params.reverse
    return marsZone:getEmptyPosition(n,reverse)
end

function placeDisaster(tile)
    local pos = marsZone:getZonePosition(tile)
    if pos > 0 then
        tile.memo="Grey"
        marsZone:placeTile(tile,pos)
        return true
    end
    return false
end
