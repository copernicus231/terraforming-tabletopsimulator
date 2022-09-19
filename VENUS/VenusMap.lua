require("../CORE/Board")
require("../CORE/SmallestMatrix")

loadingGame = true

venusTileButton={button = {
click_function = 'venusTileClick', function_owner = self, label = "",
    position = {0,0.1,0},rotation={0,0,0},width = 300, height = 300, font_size = 100,font_color={0,0,0,0},color=Color.fromString("Red"),hover_color={0,0,0,0},tooltip="Place"
},getCurrentColor=function() return getTurnToken().call("getCurrentPlayer") end,getNextColor= function(color) return Global.call("getNext",color) end}

cityTileButton={button = {
click_function = 'cityTileClick', function_owner = self, label = "",
    position = {0,0.1,0},rotation={0,0,0},width = 300, height = 300, font_size = 100,font_color={0,0,0,0},color=Color.fromString("Red"),hover_color={0,0,0,0},tooltip="Place"
},getCurrentColor=function() return getTurnToken().call("getCurrentPlayer") end,getNextColor= function(color) return Global.call("getNext",color) end}

venusZone={matrix=matrixMap,parent=self,zoneTag=nil}

projects={
    venusHabitat={
    click_function = 'venusHabitatProject', function_owner = self, label = "",
        position = {0.69,0.2,0.09},rotation={0,0,0},width = 30, height = 30, font_size = 30,font_color={0,0,0,0},color={0,0,0,0.7},hover_color={0,0,0,0},tooltip="Venus Habitat"
    },
    floatingArray={
    click_function = 'floatingArrayProject', function_owner = self, label = "",
        position = {0.69,0.2,-0.1},rotation={0,0,0},width = 30, height = 30, font_size = 30,font_color={0,0,0,0},color={0,0,0,0.7},hover_color={0,0,0,0},tooltip="Floating Array"
    },
    gasMine={
    click_function = 'gasMineProject', function_owner = self, label = "",
        position = {0.69,0.2,-0.005},rotation={0,0,0},width = 30, height = 30, font_size = 30,font_color={0,0,0,0},color={0,0,0,0.7},hover_color={0,0,0,0},tooltip="Gas Mine"
    },
}
function venusHabitatProject(obj,player_clicker_color,alt_click)
    setStandardProject(player_clicker_color,"Venus Habitat",{MC=25},{MC=1},{VenusHabitat=1})
    --getCardPlayTable(player_clicker_color).call("setProject",{label="Venus Habitat",cost={MC=25},prod={MC=1},rsrc={VenusHabitat=1}})
end

function floatingArrayProject(obj,player_clicker_color,alt_click)
  setStandardProject(player_clicker_color,"Floating Array",{MC=19},{},{FloatingArray=1})
  --  getCardPlayTable(player_clicker_color).call("setProject",{label="Floating Array",cost={MC=19},rsrc={FloatingArray=1}})
end

function gasMineProject(obj,player_clicker_color,alt_click)
  setStandardProject(player_clicker_color,"Gas Mine",{MC=21},{He=1},{GasMine=1})
  --  getCardPlayTable(player_clicker_color).call("setProject",{label="Gas Mine",cost={MC=21},prod={He=1},rsrc={GasMine=1}})
end

function venusTileClick(obj,player_clicker_color,alt_click)
    venusTileButton:doClick(obj,player_clicker_color,alt_click,function(obj,color)
      if placeTile(obj,color,venusZone) then
          if color != "Grey" then
              local cube = getPlayerBag(color).takeObject({position=obj.getPosition()+vector(0, 3, 0)})
              Wait.condition(function() cube.lock() end, function() return cube.resting end)
              if not obj.hasTag("SpecialTile") then
                  getBoard("VenusNext").call("moveTrack",{step=1,color=color,name="venusScale"})
              end
              broadcastToAll("<VENUS>[==> "..getPlayerName(color).." place "..obj.getName().. " ]", Color.fromString(color))
          end
      end
     end)
end

function cityTileClick(obj,player_clicker_color,alt_click)
    cityTileButton:doClick(obj,player_clicker_color,alt_click,function(obj,color)
      if placeTile(obj,color,venusZone) then
          if color != "Grey" then
              local cube = getPlayerBag(color).takeObject({position=obj.getPosition()+vector(0, 3, 0)})
              Wait.condition(function() cube.lock() end, function() return cube.resting end)
              obj.addTag("VenusTile")
              getCityCounter().call("addCount",{color=color,type="venusCity",count=1})
              broadcastToAll("<VENUS>[==> "..getPlayerName(color).." place "..obj.getName().. " ]", Color.fromString(color))
          end
      else
        if color != "Grey" then
            local cube = getPlayerBag(color).takeObject({position=obj.getPosition()+vector(0, 3, 0)})
            Wait.condition(function() cube.lock() end, function() return cube.resting end)
            obj.addTag("VenusTile")
            getCityCounter().call("addCount",{color=color,type="venusCity",count=1})
            broadcastToAll("<VENUS>[==> "..getPlayerName(color).." place "..obj.getName().. " ]", Color.fromString(color))
        end
      end
    end)
end


function initMap()
    for i = 1,35 do
        matrixMap[i].snap = i
    end
    matrixMap[1].bonus = {He=2}
    matrixMap[3].bonus = {En=1}
    matrixMap[6].bonus = {En=1}
    matrixMap[7].bonus = {He=1}
    matrixMap[8].bonus = {He=3}
    matrixMap[9].bonus = {En=1}

    matrixMap[10].bonus = {Card=2}
    matrixMap[11].bonus = {He=2}
    matrixMap[13].bonus = {En=1}
    matrixMap[14].bonus = {He=1}
    matrixMap[15].bonus = {MC=5}

    matrixMap[16].bonus = {He=1}
    matrixMap[19].bonus = {En=1}

    matrixMap[21].bonus = {En=2}
    matrixMap[22].bonus = {En=1}
    matrixMap[23].bonus = {He=2}
    matrixMap[24].bonus = {En=1}
    matrixMap[26].bonus = {He=2}

    matrixMap[28].bonus = {He=1}
    matrixMap[29].bonus = {He=1}
    matrixMap[30].bonus = {En=1}
    matrixMap[31].bonus = {He=2}

    matrixMap[32].bonus = {En=1,Card=1}
    matrixMap[33].bonus = {He=1}
    matrixMap[35].bonus = {Card=2}
end

function onLoad(save_state)
    TileButton:new(venusTileButton)
    TileButton:new(cityTileButton)
    initMap()
    TileBoard:new(venusZone)
    initZone()
    self.createButton(projects["venusHabitat"])
    self.createButton(projects["gasMine"])
    self.createButton(projects["floatingArray"])
    loadingGame = false
end

function initZone()
    local objs = getObjectsWithAllTags({"VenusTile"})
    for i,a in ipairs(objs) do
        if a.getLock() then
            local pos = venusZone:getZonePosition(a)
            if pos != 0 then
                venusZone:placeTile(a,pos)
            end
        end
    end
end
function extraBonus(obj)
    return {}
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
    if obj.hasTag("VenusTile") then
        venusTileButton:remove(obj)
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
        if obj.hasTag("VenusTile") and venusZone:getZonePosition(obj) > 0 then
            venusTileButton:add(obj)
        elseif obj.hasTag("City") then
            cityTileButton:add(obj)
        end
end
