require("../CORE/Board")

DELTA = 0.001
radiationLevelSnapMap={}
radiationLevelBonusMap={}
tracks={
radiationLevel={marker={Grey=getTrackMarker("RadiationLevel")},snapMap=radiationLevelSnapMap,level={Grey=0},parent=self,bonusMap=radiationLevelBonusMap}
}
--function payTrackBonus()
--end
radiationLevelTrackButton={button ={ index = 0,
    click_function = 'radiationLevelClick',
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
     tooltip="VenusScale"
 },colorText="Red",track=tracks.radiationLevel,getCurrentColor=function() return getTurnToken().call("getCurrentPlayer") end,getNextColor= function(color) return Global.call("getNext",color) end}

 function radiationLevelClick(obj,player_clicker_color,alt_click)
     radiationLevelTrackButton:doClick(obj,player_clicker_color,alt_click,function(color,step) if color != "Grey" then log("venusScale:"..color.."/"..step); tracks.radiationLevel:updateLevel("Grey"); payTrackBonus({name="radiationLevel",color=color,step=step}) end end)
 end

function initRadiationLevel()
    for i = 1,21 do
        radiationLevelSnapMap[i] = i
        radiationLevelBonusMap[i]={PLAYER={},EVERYONE={}}
    end
    radiationLevelBonusMap[3]={PLAYER={He=1},EVERYONE={}}
    radiationLevelBonusMap[5]={PLAYER={NuclearTile1=1},EVERYONE={}}
    radiationLevelBonusMap[7]={PLAYER={En=1},EVERYONE={}}
    radiationLevelBonusMap[9]={PLAYER={NuclearTile2=1},EVERYONE={}}

    radiationLevelBonusMap[11]={PLAYER={RADIATION=1},EVERYONE={}}
    radiationLevelBonusMap[13]={PLAYER={NuclearTile3=1},EVERYONE={}}
    radiationLevelBonusMap[15]={PLAYER={DATA=2},EVERYONE={}}
    radiationLevelBonusMap[17]={PLAYER={NuclearTile4=1},EVERYONE={}}

    radiationLevelBonusMap[19]={PLAYER={SCIENCE=1},EVERYONE={}}
    radiationLevelBonusMap[21]={PLAYER={RADIATION=2},EVERYONE={}}

end
loadingGame = true
 function onLoad(save_state)
     log("nuclear version 1")
     initRadiationLevel()
     Track:new(tracks.radiationLevel)
     tracks.radiationLevel:updateLevel("Grey")
     TrackMarkerButton:new(radiationLevelTrackButton)
     loadingGame=false
 end
 function setup()
     tracks.radiationLevel:setTrackPosition("Grey",1)
 end
locking=false
function onCollisionEnter(collision_info)
         if loadingGame then
             return
         end
         locking=true
         local obj = collision_info.collision_object
         if obj.hasTag("TrackMarker") then
             if obj.hasTag("RadiationLevel") then
                 radiationLevelTrackButton:add(obj)
             end
         end
        Wait.frames(function() locking=false end, 10)
 end
function onCollisionExit(collision_info)
     -- collision_info table:
     --   collision_object    Object
     --   contact_points      Table     {Vector, ...}
     --   relative_velocity   Vector

     if loadingGame or locking then
         return
     end
     local obj = collision_info.collision_object

     if obj.hasTag("TrackMarker") then
         if obj.hasTag("RadiationLevel") then
             radiationLevelTrackButton:remove(obj)
         end
     end
 end

 function addTags(params)
     local tagList = params.tags
     local color = params.color
     local delay = 0
     for i, t in ipairs(tagList) do
         if t == "RadioActive"  then
             Wait.frames(function() moveTrack({name="radiationLevel",color = color,step=1}) end,delay)
             delay = delay + 200
         end
     end
 end
