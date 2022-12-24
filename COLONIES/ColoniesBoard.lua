require("../UTIL/Utility")
require("../UTIL/GetComponents")
loadingGame = true
function onLoad(save_state)
  --getFleets()
  for i,a in pairs(projects) do
          self.createButton(a)
  end
  loadingGame = false
end
INITIAL_POSITION = Vector(82.00, 0.97, 8.00)
function setup()
    local position = INITIAL_POSITION
    local x,y = 0,0
    local n_colonies = #Global.call("getPlayers",{}) + 2
    if n_colonies < 5 then
        n_colonies = 5
    end
    getBag("Colonies").shuffle()
    local delay = 100
    for i=1,n_colonies do
        local dest = position
        local colony = getBag("Colonies").takeObject({position=dest,rotation=Vector(0,180,0)})
        Wait.condition(function()
            colony.setLock(true)
            colony.call("setup",{})
        end,function() return not colony.spawning and colony.resting and not colony.isSmoothMoving() end)
        if x < 1 then
            x = x + 1
            position = position + Vector(7.5,0,0)
        elseif y < 4 then
            y = y + 1
            x = 0
            position = position + Vector(-7.5,0,-4.5)
        end

        --delay = delay + 200
    end
    for j,fleet in pairs(getObjectsWithAllTags({"Fleet"})) do
        local fleetObj = fleet
        local remove = true
        for i,color in pairs(Global.call("getPlayers",{})) do
            if toLColor(fleetObj.getColorTint()) == color then
                remove = false
            end
        end
        if remove then
            getBag("Colonies").putObject(fleetObj)
        end
    end

--    for i,a in pairs(getColonies()) do
--        a.call("setup",{})
--    end
    Wait.frames(function() returnFleets() end,100)
end
function getColonies()
    local objs=getObjectsWithAllTags({"Colony"})
    return objs
end
FLEETS_COLONIES=nil
function getFleets()
  if FLEETS_COLONIES == nil then
    local objs=getObjectsWithAllTags({"Fleet"})
    FLEETS_COLONIES=objs
  end
  return FLEETS_COLONIES
end
function addFleet(obj)
 if FLEETS_COLONIES !=nil then
  for i,f in pairs(FLEETS_COLONIES) do
    if f == obj then
      return
    end
  end
  FLEETS_COLONIES[#FLEETS_COLONIES + 1] = obj
 end
end
MAX_FLEETS = 10
function returnFleets()
  for i,f in pairs(getFleets()) do
    f.setPositionSmooth(self.positionToWorld(self.getSnapPoints()[i].position + vector(0,2,0)))
  end
end
function nextGeneration()
   returnFleets()
   for i,a in pairs(getColonies()) do
       if a.getVar("isEnable") then
            a.call("incrementTrack",{})
            a.setVar("hasFleet",false)
       end
   end
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

    --if obj.getGUID() == "88d3d5" then
    --    setup()
    --else
    if obj.hasTag("Fleet") then
      addFleet(obj)
    end
end

projects={
    buildColony={
    click_function = 'buildColonyProject', function_owner = self, label = "",
        position = {0.32,0.21,-0.69},rotation={0,0,0},width = 70, height = 70, font_size = 30,font_color={0,0,0,0},color={0,0,0,0.7},hover_color={0,0,0,0},tooltip="Build Colony"
    },
    tradeForMC={
    click_function = 'tradeXMCProject', function_owner = self, label = "",
        position = {0.11,0.21,0},rotation={0,0,0},width = 70, height = 70, font_size = 30,font_color={0,0,0,0},color={0,0,0,0.7},hover_color={0,0,0,0},tooltip="Trade x MC"
    },
    tradeForEn={
    click_function = 'tradeXEnergyProject', function_owner = self, label = "",
        position = {0.45,0.21,0},rotation={0,0,0},width = 70, height = 70, font_size = 30,font_color={0,0,0,0},color={0,0,0,0.7},hover_color={0,0,0,0},tooltip="Trade x Energy"
    },
    tradeForTi={
    click_function = 'tradeXTitaniumProject', function_owner = self, label = "",
        position = {0.79,0.21,0},rotation={0,0,0},width = 70, height = 70, font_size = 30,font_color={0,0,0,0},color={0,0,0,0.7},hover_color={0,0,0,0},tooltip="Trade x Titanium"
    },
}



function buildColonyProject(obj,player_clicker_color,alt_click)
    setStandardProject(player_clicker_color,"Build Colony",{MC=17},{},{})
end

function tradeXMCProject(obj,player_clicker_color,alt_click)
    setStandardProject(player_clicker_color,"Trade x MC",{MC=9},{},{})
    --getCardPlayTable(player_clicker_color).call("setProject",{label="Trade x MC",cost={MC=9}}) --,rsrc={Colony=1}
end

function tradeXEnergyProject(obj,player_clicker_color,alt_click)
    setStandardProject(player_clicker_color,"Trade x Energy",{En=3},{},{})
  --  getCardPlayTable(player_clicker_color).call("setProject",{label="Trade x Energy",cost={En=3}}) --,rsrc={Colony=1}
end

function tradeXTitaniumProject(obj,player_clicker_color,alt_click)
    setStandardProject(player_clicker_color,"Trade x Titanium",{Ti=3},{},{})
  --  getCardPlayTable(player_clicker_color).call("setProject",{label="Trade x Titanium",cost={Ti=3}}) --,rsrc={Colony=1}
end
