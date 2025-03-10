require("../CORE/Board")
DELTA = 0.001
venusScaleSnapMap={}
venusScaleBonusMap={}
tracks={
venusScale={marker={Grey=getTrackMarker("VenusLevel")},snapMap=venusScaleSnapMap,level={Grey=0},parent=self,bonusMap=venusScaleBonusMap}
}
--function payTrackBonus()
--end
venusScaleTrackButton={button ={ index = 0,
    click_function = 'venusScaleClick',
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
 },colorText="Red",track=tracks.venusScale,getCurrentColor=function() return getTurnToken().call("getCurrentPlayer") end,getNextColor= function(color) return Global.call("getNext",color) end}

 function venusScaleClick(obj,player_clicker_color,alt_click)
     venusScaleTrackButton:doClick(obj,player_clicker_color,alt_click,function(color,step) if color != "Grey" then log("venusScale:"..color.."/"..step); tracks.venusScale:updateLevel("Grey"); payTrackBonus({name="venusScale",color=color,step=step}) end end)
 end

function initVenusScale()
    for i = 1,15 do
        venusScaleSnapMap[i] = i
        venusScaleBonusMap[i]={PLAYER={TERRAFORM=1},EVERYONE={}}
    end
    venusScaleBonusMap[3]={PLAYER={TERRAFORM=1,Card=1},EVERYONE={}}
    venusScaleBonusMap[5]={PLAYER={TERRAFORM=2},EVERYONE={}}
    for i = 9,15 do
      venusScaleBonusMap[i]={PLAYER={TERRAFORM=1,StdRsrc=1},EVERYONE={}}
    end
    venusScaleBonusMap[16]={PLAYER={TERRAFORM=1,StdRsrc=1,Rsrc=1},EVERYONE={}}

end
loadingGame = true
 function onLoad(save_state)
     log("venus version 1")
     initVenusScale()
     Track:new(tracks.venusScale)
     tracks.venusScale:updateLevel("Grey")
     TrackMarkerButton:new(venusScaleTrackButton)
     loadingGame=false
 end
 function setup()
     tracks.venusScale:setTrackPosition("Grey",1)
     --getMilestone("VenusExpansion").setPositionSmooth({4.25, 2.06, -10.68})
     --getAward("VenusExpansion").setPositionSmooth({21.15, 2.06, -10.39})
     local milestone=getMilestone("VenusExpansion")
     milestone.setPositionSmooth({10.71, 2.06, -11.08})
     Wait.condition(function()
         milestone.setLock(true)
     end,function() return not milestone.spawning and milestone.resting and not milestone.isSmoothMoving() end)
     --{27.38, 1.15, -11.08}
     local award = getAward("VenusExpansion")
     award.setPositionSmooth({27.38, 2.06, -11.08})
     Wait.condition(function()
         award.setLock(true)
     end,function() return not award.spawning and award.resting and not award.isSmoothMoving() end)
     --{-16.71, 1.06, -10.99}
     --{0.17, 2.06, -10.78}
 end

function onCollisionEnter(collision_info)
         if loadingGame then
             return
         end
         local obj = collision_info.collision_object
         if obj.hasTag("TrackMarker") then
             if obj.hasTag("VenusLevel") then
                 venusScaleTrackButton:add(obj)
             end
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

     if obj.hasTag("TrackMarker") then
         if obj.hasTag("VenusLevel") then
             venusScaleTrackButton:remove(obj)
         end
     end
 end
