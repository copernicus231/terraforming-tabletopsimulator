require("../UTIL/Utility")
require("../UTIL/GetComponents")

distantEvent = nil
commingEvent = nil
currentEvent = nil
turmoilFase = false



function onSave()
    local data_to_save = {distantEvent=distantEvent,commingEvent=commingEvent,currentEvent=currentEvent,turmoilFase=turmoilFase}
    save_state = JSON.encode(data_to_save)
    return save_state
end
function onLoad(save_state)
    if save_state != nil and save_state != '' then
        local json = JSON.decode(save_state)
        distantEvent = json.distantEvent
        commingEvent = json.commingEvent
        currentEvent = json.currentEvent
        turmoilFase=json.turmoilFase or false
    end
    globalEventConf  = {
        index = 0, click_function = 'newGoverment', function_owner = self, label = "Global Event",
        position = {-0.93,0.2,-0.55}, width = 1500, height = 360, font_size = 250,font_color={0,0,0,100},color={195/255, 88/255, 49/255,0.95},scale={x=0.125, y=0.125, z=0.125}
    }
    self.createButton(globalEventConf)
end

--255-164-032
-- 195-088-049
GLOBAL_EVENT_DECK=nil
function getGlobalEventDeck()
  if GLOBAL_EVENT_DECK == nil then
    local objs = getObjectsWithAllTags({"Card","GlobalEvent"})
    for i,obj in pairs(objs) do
      local pos = self.positionToWorld(self.getSnapPoints()[1].position)
      if Vector.sqrDistance(twoDimPos(obj.getPosition()),twoDimPos(pos)) < 0.0001 then
          GLOBAL_EVENT_DECK = obj
          return GLOBAL_EVENT_DECK
      end
    end
  end
  return GLOBAL_EVENT_DECK
end
function setup()
    local vec = Vector(0,1,0)
    getGlobalEventDeck().shuffle()
    getBoard("WorldGoverment").call("addNeutral",{name = "Chairman"})
    local o = getGlobalEventDeck().takeObject({position=self.positionToWorld(self.getSnapPoints()[1].position + vec)})
    o.flip()
    commingEvent = o.getGUID()
    addNeutral(commingEvent, "Distant Party: (%a+)")
    o.setPositionSmooth(self.positionToWorld(self.getSnapPoints()[2].position + vec))
    local o2 = getGlobalEventDeck().takeObject({position=self.positionToWorld(self.getSnapPoints()[1].position + vec)})
    o2.flip()
    distantEvent = o2.getGUID()
    Wait.frames(function() addNeutral(distantEvent, "Distant Party: (%a+)") end,200)
    getBoard("WorldGoverment").call("sendLobby")
end

function globalEvents()
    if currentEvent != nil then
        broadcastToAll("<RESOLVE CURRENT GLOBAL EVENT>",Color.fromString("Red"))
    else
        broadcastToAll("<NO CURRENT EVENT TO RESOLVE>",Color.fromString("Red"))
    end
end

function trRevision()
    turmoilFase = true
    getBoard("WorldGoverment").setVar("sittingCount",0)
    broadcastToAll("<ALL PLAYERS GET DECREMENT 1 TR>",Color.fromString("Red"))
    local delay = 1
    for i,color in pairs(Global.call("getPlayers",{})) do
        Wait.frames(function() getBoard("BaseGame").call("moveTrack",{name="tr",color=color,step=-1}) end,delay)
        delay = delay + 20
    end

    globalEventConf.color={253/255, 231/255, 46/255,0.95}
    self.editButton(globalEventConf)
    globalEvents()
end


function newGoverment()
    if turmoilFase == true then
        turmoilFase = false
        globalEventConf.color={195/255, 88/255, 49/255,0.95}
        self.editButton(globalEventConf)
        broadcastToAll("<EXECUTING NEW GOVERNMENT STEP>",Color.fromString("Red"))
        getBoard("WorldGoverment").call("newGoverment")
        changeTimes()
    end
end

function changeTimes()
    broadcastToAll("<EXECUTING CHANGE TIMES STEP>",Color.fromString("Red"))
    local vec = Vector(0,1,0)

    getObjectFromGUID(commingEvent).setPositionSmooth(self.positionToWorld(self.getSnapPoints()[3].position + vec))
    currentEvent = commingEvent

    addNeutral(currentEvent, "Current Party: (%a+)")

    getObjectFromGUID(distantEvent).setPositionSmooth(self.positionToWorld(self.getSnapPoints()[2].position + vec))
    commingEvent = distantEvent
    local o = getGlobalEventDeck().takeObject({position=self.positionToWorld(self.getSnapPoints()[1].position + vec)})
    o.flip()
    distantEvent = o.getGUID()

    addNeutral(distantEvent, "Distant Party: (%a+)")
end

function addNeutral(id,exp)
    local idc = id
    Wait.condition(function() getBoard("WorldGoverment").call("addNeutral",{name = string.match(getObjectFromGUID(idc).getDescription(), exp) }) end,function() return getObjectFromGUID(idc) != nil and getObjectFromGUID(idc).resting end)
end
function getSpecifiedValuesFromDescription(searchPattern,description)
  local isValue = false
  local valueList = {}
  local index = 1
  for subString in string.gmatch(description, "%S+") do
    --print(subString)
    if string.find(subString, ":") ~= nil then
      isValue = false
    end

    if isValue then
      valueList[index] = subString
      index = index + 1
    end
    if (string.match(subString, searchPattern)) then
      isValue = true
    end
  end
  return valueList
end

--function onCollisionEnter(collision_info)
    -- collision_info table:
    --   collision_object    Object
    --   contact_points      Table     {Vector, ...}
    --   relative_velocity   Vector
--    if collision_info.collision_object.getGUID() == "98cec3" then
--           if distantEvent == nil then
--               setup()
--           else
--               trRevision()
--           end

--           return
--   end
--end
