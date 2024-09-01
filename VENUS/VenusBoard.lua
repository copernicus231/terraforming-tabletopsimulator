require("../UTIL/Utility")
require("../UTIL/Track")
require("../UTIL/TrackMarkerButton")
require("../UTIL/TileButton")
require("../UTIL/TileZone")
require("../UTIL/GetComponents")

venusScaleSnapMap={}
venusScaleBonusMap={}
tracks={
venusScale={marker={Grey=getTrackMarker("VenusLevel")},snapMap=venusScaleSnapMap,level={Grey=0},parent=self,bonusMap=venusScaleBonusMap}
}

function placeGenericClick(obj,player_clicker_color,alt_click)
    genericTileButton:doClick(obj,player_clicker_color,alt_click,function(obj,color)
      broadcastToAll("<"..color.." PLAYER PLACE "..obj.getName().." >",Color.fromString(color))
      local cube = getPlayerBag(color).takeObject({position=obj.getPosition()+vector(0, 3, 0)})
      Wait.condition(function() cube.lock() end, function() return cube.resting end)
      getCityCounter().call("addCount",{color=color,type="venusCity",count=1})
     end)
end


function venusScaleClick(obj,player_clicker_color,alt_click)
    venusScaleTrackButton:doClick(obj,player_clicker_color,alt_click,function(color,step) if color != "Grey" then log("venusScale:"..color.."/"..step); tracks.venusScale:updateLevel("Grey"); payTrackBonus({name="venusScale",color=color,step=step}) end end)
end



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
 },colorText="Red",track=tracks.venusScale,onUpdateTrack=function(color,step) if color != "Grey" then log("venusScale:"..color.."/"..step); tracks.venusScale:updateLevel("Grey"); payTrackBonus({name="venusScale",color=color,step=step}) end end,getCurrentColor=function() return getTurnToken().call("getCurrentPlayer") end,getNextColor= function(color) return Global.call("getNext",color) end}


 genericTileButton={button = {
                     index = 0, click_function = 'placeGenericClick', function_owner = self, label = "",
                     position = {0,0.1,0},rotation={0,0,0},width = 300, height = 300, font_size = 100,font_color={0,0,0,0},color=Color.fromString("Red"),hover_color={0,0,0,0},tooltip="Place"
                 },colorText="Red",getCurrentColor=function() return getTurnToken().call("getCurrentPlayer") end,getNextColor= function(color) return Global.call("getNext",color) end}



loadingGame = true
 function onLoad(save_state)
     log("venus version 1")
     initVenusScale()
     Track:new(tracks.venusScale)
     tracks.venusScale:updateLevel("Grey")
     TrackMarkerButton:new(venusScaleTrackButton)
     TileButton:new(genericTileButton)
     self.createButton(projects["airScrapping"])
     loadingGame=false
 end
function setup()
    tracks.venusScale:setTrackPosition("Grey",1)
    --{10.71, 1.10, 10.71}
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
         -- Add check when gets faster geometric algoritms for marsZone:getZonePosition(obj) > 0
         if obj.hasTag("VenusTile") or obj.hasTag("spaceTile") then
             if obj.hasTag("City") then
             --print(obj.getGUID())
             genericTileButton:add(obj)
            end
         end
 end
 function onCollisionExit(collision_info)
     if loadingGame then
         return
     end
     local obj = collision_info.collision_object

     if obj.hasTag("TrackMarker") then
         if obj.hasTag("VenusLevel") then
             venusScaleTrackButton:remove(obj)
         end
     end
     if obj.hasTag("VenusTile") or obj.hasTag("spaceTile") then
         if obj.hasTag("City") then
        -- print(obj.getGUID())
         genericTileButton:remove(obj)
        end
     end

 end

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
             broadcastToAll("<VENUS>[==> "..getPlayerName(color).." get "..total.. " Cards ]",Color.fromString(color))
         elseif resource == "Temperature" then
             if getBoard("BaseGame").call("moveTrack",{name="temperature",step=total,color=color})then
                 broadcastToAll("<VENUS>[==> "..getPlayerName(color).." increment temperature "..total.." steps ]",Color.fromString(color))
             end
         elseif resource == "Oxygen" then
             if getBoard("BaseGame").call("moveTrack",{step=total,color=color,name="oxygen"}) then
                 broadcastToAll("<VENUS>[==> "..getPlayerName(color).." increase Oxygen "..total.." steps ]",Color.fromString(color))
             end
         elseif resource == "VenusScale" then
             if getBoard("VenusNext").call("moveTrack",{name="venusScale",step=total,color=color}) then
                 broadcastToAll("<VENUS>[==> "..getPlayerName(color).." increase Venus parameter "..total.." steps ]",Color.fromString(color))
             end
         elseif resource == "Delegate" then
             broadcastToAll("<VENUS>[==> "..getPlayerName(color).." get "..total.." delegate ]",Color.fromString(color))
         elseif resource == "City" or resource == "Greenery" or resource == "Ocean" then
             if total > 0 then
                 local pos = getCardPlayTable(color).positionToWorld(Vector(0,1,-2.7))
                 if getBag(resource) != nil and getBag(r) != Global then
                     for i=1,total do
                         if getBag(resource).getQuantity() > 1 then
                             getBag(resource).takeObject({position = pos})
                             broadcastToAll("<VENUS>[==> "..getPlayerName(color).." get "..total.." ("..resource..") ]",Color.fromString(color))
                         end
                     end
                 else
                     broadcastToAll("<VENUS>[==> "..getPlayerName(color).." must take "..total.." ("..resource..") ]",Color.fromString(color))
                 end
             end
         elseif resource == "TERRAFORM" then
             getBoard("BaseGame").call("moveTrack",{name="tr",step=total,color=color})
             broadcastToAll("<VENUS>[==> "..getPlayerName(color).." increase "..total.. " step terraform ]",Color.fromString(color))
         elseif resource == "CardBuilding" then
             broadcastToAll("<VENUS>[==> "..getPlayerName(color).." take "..total.. " building Card ]",Color.fromString(color))
         elseif resource == "ProdEn" then
             getPlayerBoard(color).call("moveProduction",{resource="En",step=total})
             if total > 0 then
                 broadcastToAll("<VENUS>[==> "..getPlayerName(color).." increase "..(total).." steps (En) production ]",Color.fromString(color))
             else
                 broadcastToAll("<VENUS>[==> "..getPlayerName(color).." reduce "..(total).." steps (En) production ]",Color.fromString(color))
             end
         elseif resource == "ProdHe" then
             getPlayerBoard(color).call("moveProduction",{resource="He",step=total})
             if total > 0 then
                 broadcastToAll("<VENUS>[==> "..getPlayerName(color).." increase "..(total).." steps (He) production ]",Color.fromString(color))
             else
                 broadcastToAll("<VENUS>[==> "..getPlayerName(color).." reduce "..(total).." steps (He) production ]",Color.fromString(color))
             end
         elseif resource == "ProdPl" then
             getPlayerBoard(color).call("moveProduction",{resource="Pl",step=total})
             if total > 0 then
                 broadcastToAll("<VENUS>[==> "..getPlayerName(color).." increase "..(total).." steps (Pl) production ]",Color.fromString(color))
             else
                 broadcastToAll("<VENUS>[==> "..getPlayerName(color).." reduce "..(total).." steps (Pl) production ]",Color.fromString(color))
             end
         elseif resource == "ProdSt" then
             getPlayerBoard(color).call("moveProduction",{resource="St",step=total})
             if total > 0 then
                 broadcastToAll("<VENUS>[==> "..getPlayerName(color).." increase "..(total).." steps (St) production ]",Color.fromString(color))
             else
                 broadcastToAll("<VENUS>[==> "..getPlayerName(color).." reduce "..(total).." steps (St) production ]",Color.fromString(color))
             end
         elseif resource == "ProdTi" then
             getPlayerBoard(color).call("moveProduction",{resource="Ti",step=total})
             if total > 0 then
                 broadcastToAll("<VENUS>[==> "..getPlayerName(color).." increase "..(total).." steps (Ti) production ]",Color.fromString(color))
             else
                 broadcastToAll("<VENUS>[==> "..getPlayerName(color).." reduce "..(total).." steps (Ti) production ]",Color.fromString(color))
             end
         elseif resource == "Rsrc" then
             broadcastToAll("<VENUS>[==> "..getPlayerName(color).." get "..(total).." standard or not standard resource ]",Color.fromString(color))
         elseif resource == "StdRsrc" then
             broadcastToAll("<VENUS>[==> "..getPlayerName(color).." get "..(total).." standard resource ]",Color.fromString(color))
         else
             if total > 0 then
                 getPlayerBoard(color).call("addResource",{resource=resource,value=total})
                 broadcastToAll("<VENUS>[==> "..getPlayerName(color).." get "..total.." ("..resource..") ]",Color.fromString(color))
             elseif total < 0 then
                 if getPlayerBoard(color).call("payResource",{resource=resource,value=(total*-1)}) then
                     broadcastToAll("<VENUS>[==> "..getPlayerName(color).." pay "..(total*-1).." ("..resource..") ]",Color.fromString(color))
                 else
                     broadcastToAll("<VENUS>[==> "..getPlayerName(color).." must pay "..(total*-1).." ("..resource..") ]",Color.fromString(color))
                 end
             else
                 log("Resource Bonus "..resource.." is 0 due it cancel")
             end

         end
     end
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

 projects={
    airScrapping={
    click_function = 'airScrapping', function_owner = self, label = "",
        position = {-1.135,0.2,0.745},rotation={0,0,0},width = 70, height = 70, font_size = 70,font_color={0,0,0,0},color={0,0,0,0.7},hover_color={0,0,0,0},tooltip="Air Scrapping"
    },
}

function airScrapping(obj,player_clicker_color,alt_click)
    setStandardProject(player_clicker_color,"Air Scrapping",{MC=15},{},{VenusScale=1})
end