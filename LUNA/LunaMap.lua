require("../CORE/Board")
require("../CORE/SmallestMatrix")
habitatTileButton={button = {
click_function = 'habitatTileClick', function_owner = self, label = "",
    position = {0,0.1,0},rotation={0,0,0},width = 300, height = 300, font_size = 100,font_color={0,0,0,0},color=Color.fromString("Red"),hover_color={0,0,0,0},tooltip="Place"
},getCurrentColor=function() return getTurnToken().call("getCurrentPlayer") end,getNextColor= function(color) return Global.call("getNext",color) end}

mineTileButton={button = {
click_function = 'mineTileClick', function_owner = self, label = "",
    position = {0,0.1,0},rotation={0,0,0},width = 300, height = 300, font_size = 100,font_color={0,0,0,0},color=Color.fromString("Red"),hover_color={0,0,0,0},tooltip="Place"
},getCurrentColor=function() return getTurnToken().call("getCurrentPlayer") end,getNextColor= function(color) return Global.call("getNext",color) end}

roadTileButton={button = {
click_function = 'roadTileClick', function_owner = self, label = "",
    position = {0,0.1,0},rotation={0,0,0},width = 300, height = 300, font_size = 100,font_color={0,0,0,0},color=Color.fromString("Red"),hover_color={0,0,0,0},tooltip="Place"
},getCurrentColor=function() return getTurnToken().call("getCurrentPlayer") end,getNextColor= function(color) return Global.call("getNext",color) end}

specialTileButton={button = {
click_function = 'specialTileClick', function_owner = self, label = "",
    position = {0,0.1,0},rotation={0,0,0},width = 300, height = 300, font_size = 100,font_color={0,0,0,0},color=Color.fromString("Red"),hover_color={0,0,0,0},tooltip="Place"
},getCurrentColor=function() return getTurnToken().call("getCurrentPlayer") end,getNextColor= function(color) return Global.call("getNext",color) end}

replaceTileButton={button = {
click_function = 'replaceTileClick', function_owner = self, label = "",
    position = {0,0.1,0},rotation={0,0,0},width = 300, height = 300, font_size = 100,font_color={0,0,0,0},color=Color.fromString("Red"),hover_color={0,0,0,0},tooltip="Place"
},getCurrentColor=function() return getTurnToken().call("getCurrentPlayer") end,getNextColor= function(color) return Global.call("getNext",color) end}


cityTileButton={button = {
click_function = 'cityTileClick', function_owner = self, label = "",
    position = {0,0.1,0},rotation={0,0,0},width = 300, height = 300, font_size = 100,font_color={0,0,0,0},color=Color.fromString("Red"),hover_color={0,0,0,0},tooltip="Place"
},getCurrentColor=function() return getTurnToken().call("getCurrentPlayer") end,getNextColor= function(color) return Global.call("getNext",color) end}


lunaZone={matrix=matrixMap,parent=self,zoneTag=nil}

projects={
    lunarHabitat={
    click_function = 'lunarHabitatProject', function_owner = self, label = "",
        position = {-1.08,0.1,0.11},rotation={0,0,0},width = 30, height = 30, font_size = 30,font_color={0,0,0,0},color={0,0,0,0.7},hover_color={0,0,0,0},tooltip="Lunar Habitat"
    },
    lunarMine={
    click_function = 'lunarMineProject', function_owner = self, label = "",
        position = {-1.08,0.1,0.015},rotation={0,0,0},width = 30, height = 30, font_size = 30,font_color={0,0,0,0},color={0,0,0,0.7},hover_color={0,0,0,0},tooltip="Lunar Mine"
    },
    road={
    click_function = 'roadProject', function_owner = self, label = "",
        position = {-1.08,0.1,-0.08},rotation={0,0,0},width = 30, height = 30, font_size = 30,font_color={0,0,0,0},color={0,0,0,0.7},hover_color={0,0,0,0},tooltip="Road"
    },
}
function lunarHabitatProject(obj,player_clicker_color,alt_click)
    setStandardProject(player_clicker_color,"Lunar Habitat",{MC=25},{MC=1},{LunarHabitat=1})
    --getCardPlayTable(player_clicker_color).call("setProject",{label="Lunar Habitat",cost={MC=25},prod={MC=1},rsrc={LunarHabitat=1}})
end

function lunarMineProject(obj,player_clicker_color,alt_click)
  setStandardProject(player_clicker_color,"Lunar Mine",{MC=23},{St=1},{LunarMine=1})
  --  getCardPlayTable(player_clicker_color).call("setProject",{label="Lunar Mine",cost={MC=23},prod={St=1},rsrc={LunarMine=1}})
end

function roadProject(obj,player_clicker_color,alt_click)
  setStandardProject(player_clicker_color,"Road",{MC=20},{},{Road=1})
    --getCardPlayTable(player_clicker_color).call("setProject",{label="Road",cost={MC=20},rsrc={Road=1}})
end

colonizationRateSnapMap={}
miningRateSnapMap={}
logisticRateSnapMap={}
colonizationRateBonusMap={}
miningRateBonusMap={}
logisticRateBonusMap={}
tracks={
colonizationRate={marker={Grey=getTrackMarker("ColonizationRate")},snapMap=colonizationRateSnapMap,level={Grey=0},parent=self,bonusMap=colonizationRateBonusMap},
miningRate={marker={Grey=getTrackMarker("MiningRate")},snapMap=miningRateSnapMap,level={Grey=0},parent=self,bonusMap=miningRateBonusMap},
logisticRate={marker={Grey=getTrackMarker("LogisticRate")},snapMap=logisticRateSnapMap,level={Grey=0},parent=self,bonusMap=logisticRateBonusMap},

}
--function payTrackBonus()
--end
colonizationRateTrackButton={button ={ index = 0,
    click_function = 'colonizationRateClick',
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
     tooltip="colonizationRate"
 },colorText="Red",track=tracks.colonizationRate,getCurrentColor=function() return getTurnToken().call("getCurrentPlayer") end,getNextColor= function(color) return Global.call("getNext",color) end}

miningRateTrackButton={button ={ index = 0,
     click_function = 'miningRateClick',
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
      tooltip="miningRate"
  },colorText="Red",track=tracks.miningRate,getCurrentColor=function() return getTurnToken().call("getCurrentPlayer") end,getNextColor= function(color) return Global.call("getNext",color) end}

logisticRateTrackButton={button ={ index = 0,
      click_function = 'logisticRateClick',
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
       tooltip="logisticRate"
   },colorText="Red",track=tracks.logisticRate,getCurrentColor=function() return getTurnToken().call("getCurrentPlayer") end,getNextColor= function(color) return Global.call("getNext",color) end}


function colonizationRateClick(obj,player_clicker_color,alt_click)
   colonizationRateTrackButton:doClick(obj,player_clicker_color,alt_click,function(color,step) if color != "Grey" then log("colonizationRate:"..color.."/"..step); tracks.colonizationRate:updateLevel("Grey"); payTrackBonus({name="colonizationRate",color=color,step=step}) end end)
end
function miningRateClick(obj,player_clicker_color,alt_click)
   miningRateTrackButton:doClick(obj,player_clicker_color,alt_click,function(color,step) if color != "Grey" then log("miningRate:"..color.."/"..step); tracks.miningRate:updateLevel("Grey"); payTrackBonus({name="miningRate",color=color,step=step}) end end)
end
function logisticRateClick(obj,player_clicker_color,alt_click)
   logisticRateTrackButton:doClick(obj,player_clicker_color,alt_click,function(color,step) if color != "Grey" then log("logisticRate:"..color.."/"..step); tracks.logisticRate:updateLevel("Grey"); payTrackBonus({name="logisticRate",color=color,step=step}) end end)
end

function habitatTileClick(obj,player_clicker_color,alt_click)
    habitatTileButton:doClick(obj,player_clicker_color,alt_click,function(obj,color)
      if placeTile(obj,color,lunaZone) then
          if color != "Grey" then
              local cube = getPlayerBag(color).takeObject({position=obj.getPosition()+vector(0, 3, 0)})
              Wait.condition(function() cube.lock() end, function() return cube.resting end)
              getBoard("Luna").call("moveTrack",{step=1,color=color,name="colonizationRate"})
              broadcastToAll("<LUNA>[==> "..getPlayerName(color).." place "..obj.getName().. " ]", Color.fromString(color))
          end
      end
    end)
end

function mineTileClick(obj,player_clicker_color,alt_click)
    mineTileButton:doClick(obj,player_clicker_color,alt_click,function(obj,color)
        if placeTile(obj,color,lunaZone) then
            if color != "Grey" then
                local cube = getPlayerBag(color).takeObject({position=obj.getPosition()+vector(0, 3, 0)})
                Wait.condition(function() cube.lock() end, function() return cube.resting end)
                getBoard("Luna").call("moveTrack",{step=1,color=color,name="miningRate"})
                broadcastToAll("<LUNA>[==> "..getPlayerName(color).." place "..obj.getName().. " ]", Color.fromString(color))
            end
        end
     end)
end

function roadTileClick(obj,player_clicker_color,alt_click)
    roadTileButton:doClick(obj,player_clicker_color,alt_click,function(obj,color)
      if placeTile(obj,color,lunaZone) then
          if color != "Grey" then
              local cube = getPlayerBag(color).takeObject({position=obj.getPosition()+vector(0, 3, 0)})
              Wait.condition(function() cube.lock() end, function() return cube.resting end)
              getBoard("Luna").call("moveTrack",{step=1,color=color,name="logisticRate"})
              broadcastToAll("<LUNA>[==> "..getPlayerName(color).." place "..obj.getName().. " ]", Color.fromString(color))
          end
      end
    end)
end

function specialTileClick(obj,player_clicker_color,alt_click)
    specialTileButton:doClick(obj,player_clicker_color,alt_click,function(obj,color)
      if placeTile(obj,color,lunaZone) then
          if color != "Grey" then
              local cube = getPlayerBag(color).takeObject({position=obj.getPosition()+vector(0, 3, 0)})
              Wait.condition(function() cube.lock() end, function() return cube.resting end)
              broadcastToAll("<LUNA>[==> "..getPlayerName(color).." place "..obj.getName().. " ]", Color.fromString(color))
          end
      end
    end)
end

function replaceTileClick(obj,player_clicker_color,alt_click)
    specialTileButton:doClick(obj,player_clicker_color,alt_click,function(obj,color)
      if placeReplaceTile(obj,color,lunaZone) then
          if color != "Grey" then
              local cube = getPlayerBag(color).takeObject({position=obj.getPosition()+vector(0, 3, 0)})
              Wait.condition(function() cube.lock() end, function() return cube.resting end)
              broadcastToAll("<LUNA>[==> "..getPlayerName(color).." place "..obj.getName().. " ]", Color.fromString(color))
          end
      end
    end)
end

function cityTileClick(obj,player_clicker_color,alt_click)
    cityTileButton:doClick(obj,player_clicker_color,alt_click,function(obj,color)
      if placeTile(obj,color,lunaZone) then
          if color != "Grey" then
              local cube = getPlayerBag(color).takeObject({position=obj.getPosition()+vector(0, 3, 0)})
              Wait.condition(function() cube.lock() end, function() return cube.resting end)
              getCityCounter().call("addCount",{color=color,type="lunarCity",count=1})
              obj.addTag("LunaTile")
              broadcastToAll("<LUNA>[==> "..getPlayerName(color).." place "..obj.getName().. " ]", Color.fromString(color))
          end
      else
        if color != "Grey" then
            local cube = getPlayerBag(color).takeObject({position=obj.getPosition()+vector(0, 3, 0)})
            Wait.condition(function() cube.lock() end, function() return cube.resting end)
            getCityCounter().call("addCount",{color=color,type="lunarCity",count=1})
            obj.addTag("LunaTile")
            broadcastToAll("<LUNA>[==> "..getPlayerName(color).." place "..obj.getName().. " ]", Color.fromString(color))
        end
      end
    end)
end


function initZone()
    local objs = getObjectsWithAllTags({"LunaTile"})
    for i,a in ipairs(objs) do
        if a.getLock() then
            local pos = lunaZone:getZonePosition(a)
            if pos != 0 then
                lunaZone:placeTile(a,pos)
            end
        end
    end
end

function initMap()
    for i = 1,35 do
        matrixMap[i].snap = i
    end
    matrixMap[2].bonus = {Ti=1,Card=1}
    matrixMap[4].bonus = {St=1}
    matrixMap[5].bonus = {St=2}
    matrixMap[7].bonus = {Ti=1}
    matrixMap[11].bonus = {Ti=1}
    matrixMap[12].bonus = {MC=5}

    matrixMap[14].bonus = {St=1}
    matrixMap[15].bonus = {Ti=2}
    matrixMap[16].bonus = {Ti=1}
    matrixMap[19].bonus = {St=1}
    matrixMap[20].bonus = {St=1}

    matrixMap[22].bonus = {St=1}
    matrixMap[24].bonus = {Card=2}
    matrixMap[26].bonus = {Ti=1}
    matrixMap[28].bonus = {Ti=1}
    matrixMap[29].bonus = {Ti=1}
    matrixMap[31].bonus = {Ti=1}


    matrixMap[32].bonus = {Card=2}
    matrixMap[33].bonus = {St=1}
    matrixMap[34].bonus = {St=2}

end
function initLunaTracks()
  for i = 1,10 do
      colonizationRateSnapMap[i] = 11-i + 45
      colonizationRateBonusMap[i]={PLAYER={TERRAFORM=1},EVERYONE={}}
      miningRateSnapMap[i] = 11-i + 55
      miningRateBonusMap[i]={PLAYER={TERRAFORM=1},EVERYONE={}}
      logisticRateSnapMap[i] = 11-i + 35
      logisticRateBonusMap[i]={PLAYER={TERRAFORM=1},EVERYONE={}}
  end
  colonizationRateBonusMap[4]={PLAYER={TERRAFORM=1,Card=1},EVERYONE={}}
  logisticRateBonusMap[4]={PLAYER={TERRAFORM=1,Card=1},EVERYONE={}}
  logisticRateBonusMap[8]={PLAYER={TERRAFORM=1,ProdTi=1},EVERYONE={}}
  miningRateBonusMap[4]={PLAYER={TERRAFORM=1,Card=1},EVERYONE={}}
  miningRateBonusMap[8]={PLAYER={TERRAFORM=1,ProdSt=1},EVERYONE={}}
end
function setup()
    tracks.colonizationRate:setTrackPosition("Grey",1)
    tracks.miningRate:setTrackPosition("Grey",1)
    tracks.logisticRate:setTrackPosition("Grey",1)
end
loadingGame = true
function onLoad(save_state)
    initLunaTracks()
    Track:new(tracks.colonizationRate)
    tracks.colonizationRate:updateLevel("Grey")
    TrackMarkerButton:new(colonizationRateTrackButton)

    Track:new(tracks.miningRate)
    tracks.miningRate:updateLevel("Grey")
    TrackMarkerButton:new(miningRateTrackButton)

    Track:new(tracks.logisticRate)
    tracks.logisticRate:updateLevel("Grey")
    TrackMarkerButton:new(logisticRateTrackButton)

    TileButton:new(habitatTileButton)
    TileButton:new(mineTileButton)
    TileButton:new(roadTileButton)
    TileButton:new(specialTileButton)
    TileButton:new(replaceTileButton)
    TileButton:new(cityTileButton)
    initMap()
    TileBoard:new(lunaZone)
    initZone()
    for i,a in pairs(projects) do
            self.createButton(a)
    end


    loadingGame = false
end

function onCollisionExit(collision_info)
    if loadingGame then
        return
    end
    local obj = collision_info.collision_object
    --WORK AROUND WITH LOCK OBJECTS TRIGGER AN onCollisionExit
    if obj.getLock() then
        return
    end
    if obj.hasTag("LunaTile") then
        if obj.hasTag("SpecialTile") then
            if obj.hasTag("ReplaceTile") then
                replaceTileButton:remove(obj)
            else
                specialTileButton:remove(obj)
            end
        elseif obj.hasTag("Habitat") then
            habitatTileButton:remove(obj)
        elseif obj.hasTag("LunarMine") then
            mineTileButton:remove(obj)
        elseif obj.hasTag("Road") then
            roadTileButton:remove(obj)
        end
    elseif obj.hasTag("TrackMarker") then
        if obj.hasTag("ColonizationRate") then
            colonizationRateTrackButton:remove(obj)
        elseif obj.hasTag("MiningRate") then
            miningRateTrackButton:remove(obj)
        elseif obj.hasTag("LogisticRate") then
            logisticRateTrackButton:remove(obj)
        end
    elseif obj.hasTag("City") then
        cityTileButton:remove(obj)
    end

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
        if obj.hasTag("LunaTile") and lunaZone:getZonePosition(obj) > 0 then
            if obj.hasTag("SpecialTile") then
                if obj.hasTag("ReplaceTile") then
                    replaceTileButton:add(obj)
                else
                    specialTileButton:add(obj)
                end
            elseif obj.hasTag("Habitat") then
                habitatTileButton:add(obj)
            elseif obj.hasTag("LunarMine") then
                mineTileButton:add(obj)
            elseif obj.hasTag("Road") then
                roadTileButton:add(obj)
            end
        elseif obj.hasTag("TrackMarker") then
            if obj.hasTag("ColonizationRate") then
                colonizationRateTrackButton:add(obj)
            elseif obj.hasTag("MiningRate") then
                miningRateTrackButton:add(obj)
            elseif obj.hasTag("LogisticRate") then
                logisticRateTrackButton:add(obj)
            end
        elseif obj.hasTag("City") then
            cityTileButton:add(obj)
        end
end
