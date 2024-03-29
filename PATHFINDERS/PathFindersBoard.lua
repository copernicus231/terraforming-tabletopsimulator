require("../UTIL/Utility")
require("../UTIL/Track")
require("../UTIL/TrackMarkerButton")
require("../UTIL/TileButton")
require("../UTIL/TileZone")
require("../UTIL/GetComponents")


venusSnapMap={}
earthSnapMap={}
marsSnapMap={}
jovianSnapMap={}
mercurySnapMap={}
moonSnapMap={}

venusBonusMap={}
earthBonusMap={}
marsBonusMap={}
jovianBonusMap={}
mercuryBonusMap={}
moonBonusMap={}

tracks={
Venus={marker={Grey=getPathMarker("Venus")},snapMap=venusSnapMap,level={Grey=0},parent=self,bonusMap=venusBonusMap},
Earth={marker={Grey=getPathMarker("Earth")},snapMap=earthSnapMap,level={Grey=0},parent=self,bonusMap=earthBonusMap},
Mars={marker={Grey=getPathMarker("Mars")},snapMap=marsSnapMap,level={Grey=0},parent=self,bonusMap=marsBonusMap},
Jovian={marker={Grey=getPathMarker("Jovian")},snapMap=jovianSnapMap,level={Grey=0},parent=self,bonusMap=jovianBonusMap}
}

function venusClick(obj,player_clicker_color,alt_click)
    venusTrackButton:doClick(obj,player_clicker_color,alt_click,function(color,step) if step > 0 then log("Venus:"..color.."/"..step);tracks["Venus"]:updateLevel("Grey"); payTrackBonus({name="Venus",color=color,step=step}) end end)
end

function earthClick(obj,player_clicker_color,alt_click)
    earthTrackButton:doClick(obj,player_clicker_color,alt_click,function(color,step) if step > 0 then log("Earth:"..color.."/"..step);tracks["Earth"]:updateLevel("Grey"); payTrackBonus({name="Earth",color=color,step=step}) end  end)
end
function marsClick(obj,player_clicker_color,alt_click)
    marsTrackButton:doClick(obj,player_clicker_color,alt_click,function(color,step) if step > 0 then log("Mars:"..color.."/"..step);tracks["Mars"]:updateLevel("Grey"); payTrackBonus({name="Mars",color=color,step=step}) end end)
end
function jovianClick(obj,player_clicker_color,alt_click)
    jovianTrackButton:doClick(obj,player_clicker_color,alt_click,function(color,step) if step > 0 then log("Jovian:"..color.."/"..step);tracks["Jovian"]:updateLevel("Grey"); payTrackBonus({name="Jovian",color=color,step=step}) end end)
end
venusTrackButton={button ={ index = 0,
    click_function = 'venusClick',
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
     tooltip="Venus"
 },colorText="Red",track=tracks.Venus,onUpdateTrack=function(color,step) if step > 0 then log("Venus:"..color.."/"..step);tracks["Venus"]:updateLevel("Grey"); payTrackBonus({name="Venus",color=color,step=step}) end end}

 earthTrackButton={button ={ index = 0,
     click_function = 'earthClick',
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
      tooltip="Earth"
  },colorText="Red",track=tracks.Earth,onUpdateTrack=function(color,step) if step > 0 then log("Earth:"..color.."/"..step);tracks["Earth"]:updateLevel("Grey"); payTrackBonus({name="Earth",color=color,step=step}) end  end}

  marsTrackButton={button ={ index = 0,
      click_function = 'marsClick',
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
       tooltip="Mars"
   },colorText="Red",track=tracks.Mars,onUpdateTrack=function(color,step) if step > 0 then log("Mars:"..color.."/"..step);tracks["Mars"]:updateLevel("Grey"); payTrackBonus({name="Mars",color=color,step=step}) end end}

   jovianTrackButton={button ={ index = 0,
       click_function = 'jovianClick',
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
        tooltip="Jovian"
    },colorText="Red",track=tracks.Jovian,onUpdateTrack=function(color,step) if step > 0 then log("Jovian:"..color.."/"..step);tracks["Jovian"]:updateLevel("Grey"); payTrackBonus({name="Jovian",color=color,step=step}) end end}


 loadingGame = true
  function onLoad(save_state)
      initTracks()
      Track:new(tracks.Venus)
      Track:new(tracks.Earth)
      Track:new(tracks.Mars)
      Track:new(tracks.Jovian)
      tracks.Venus:updateLevel("Grey")
      tracks.Earth:updateLevel("Grey")
      tracks.Mars:updateLevel("Grey")
      tracks.Jovian:updateLevel("Grey")
      TrackMarkerButton:new(venusTrackButton)
      TrackMarkerButton:new(earthTrackButton)
      TrackMarkerButton:new(marsTrackButton)
      TrackMarkerButton:new(jovianTrackButton)

     TileButton:new(genericTileButton)
     -- TileButton:new(genericTileButton)
      loadingGame=false
  end
 function setup()
     tracks.Venus:setTrackPosition("Grey",1)
     tracks.Earth:setTrackPosition("Grey",1)
     tracks.Mars:setTrackPosition("Grey",1)
     tracks.Jovian:setTrackPosition("Grey",1)
 end

 function placeSpaceTile(obj,color)
     obj.memo=color
     return obj.hasTag("SpaceTile")
 end

 function placeGenericClick(obj,player_clicker_color,alt_click)
     genericTileButton:doClick(obj,player_clicker_color,alt_click,function(obj,color)
       if placeSpaceTile(obj,color) then
           broadcastToAll("<PATHFINDER>[==> "..getPlayerName(color).." has place "..obj.getName().." ]",Color.fromString(color))
           local cube = getPlayerBag(color).takeObject({position=obj.getPosition()+vector(0, 3, 0)})
           Wait.condition(function() cube.lock() end, function() return cube.resting end)
           getCityCounter().call("addCount",{color=color,type="spaceCity",count=1})
           --print("INCREMENT SPACE CITY COUNTER")
       end

     end)
 end

 genericTileButton={button = {
                     index = 0, click_function = 'placeGenericClick', function_owner = self, label = "",
                     position = {0,0.1,0},rotation={0,0,0},width = 300, height = 300, font_size = 100,font_color={0,0,0,0},color=Color.fromString("Red"),hover_color={0,0,0,0},tooltip="Place"
                 },colorText="Red",placement=placeGeneric}

  function onCollisionEnter(collision_info)
          if loadingGame then
              return
          end
          local obj = collision_info.collision_object
          if obj.hasTag("PathMarker") then
              if obj.hasTag("Venus") then
                  venusTrackButton:add(obj)
              elseif obj.hasTag("Earth") then
                  earthTrackButton:add(obj)
              elseif obj.hasTag("Mars") then
                  marsTrackButton:add(obj)
              elseif obj.hasTag("Jovian") then
                  jovianTrackButton:add(obj)
              end
          end
          if obj.hasTag("SpaceTile") then
              --print(obj.getGUID())
              genericTileButton:add(obj)
          end

          -- Add check when gets faster geometric algoritms for marsZone:getZonePosition(obj) > 0
    --      if obj.hasTag("VenusTile") then
    --          if obj.hasTag("City") then
              --print(obj.getGUID())
    --          genericTileButton:add(obj)
    --         end
    --      end
  end
  function onCollisionExit(collision_info)
      if loadingGame then
          return
      end
      local obj = collision_info.collision_object

      if obj.hasTag("PathMarker") then
          if obj.hasTag("Venus") then
              venusTrackButton:remove(obj)
          elseif obj.hasTag("Earth") then
              earthTrackButton:remove(obj)
          elseif obj.hasTag("Mars") then
              marsTrackButton:remove(obj)
          elseif obj.hasTag("Jovian") then
              jovianTrackButton:remove(obj)
          end
      end

      if obj.hasTag("SpaceTile") then
          --print(obj.getGUID())
          genericTileButton:remove(obj)
      end

    --  if obj.hasTag("VenusTile") then
    --      if obj.hasTag("City") then
         -- print(obj.getGUID())
    --      genericTileButton:remove(obj)
    --     end
      --end

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
              broadcastToAll("<PATHFINDER>[==> "..getPlayerName(color).." get "..total.." cards ]",Color.fromString(color))
          elseif resource == "Temperature" then
              if getBoard("BaseGame").call("moveTrack",{name="temperature",step=total,color=color})then
                  broadcastToAll("<PATHFINDER>[==> "..getPlayerName(color).." increment temperature "..total.." steps ]",Color.fromString(color))
              end
          elseif resource == "Oxygen" then
              if getBoard("BaseGame").call("moveTrack",{step=total,color=color,name="oxygen"}) then
                  broadcastToAll("<PATHFINDER>[==> "..getPlayerName(color).." increase Oxygen "..total.." steps ]",Color.fromString(color))
              end
          elseif resource == "VenusScale" then
              if getBoard("VenusNext").call("moveTrack",{name="venusScale",step=total,color=color}) then
                  broadcastToAll("<PATHFINDER>[==> "..getPlayerName(color).." increase Venus parameter "..total.." steps ]",Color.fromString(color))
              end
          elseif resource == "Delegate" then
              broadcastToAll("<PATHFINDER>[==> "..getPlayerName(color).." get "..total.." delegate ]",Color.fromString(color))
          elseif resource == "Greenery" or resource == "City"  or resource == "Ocean" then
              if total > 0 then
                  local pos = getCardPlayTable(color).positionToWorld(Vector(0,1,-2.7))
                  if getBag(resource) != nil and getBag(resource) != Global then
                      for i=1,total do
                          if getBag(resource).getQuantity() >= 1 then
                              getBag(resource).takeObject({position = pos})
                          end
                      end
                      broadcastToAll("<PATHFINDER>[==> "..getPlayerName(color).." get "..total.." ("..resource..") ]",Color.fromString(color))
                  else
                      broadcastToAll("<PATHFINDER>[==> "..getPlayerName(color).." must take "..total.." ("..resource..") ]",Color.fromString(color))
                  end
              end
          elseif resource == "TERRAFORM" then
              if getBoard("BaseGame").call("moveTrack",{step=total,color=color,name="tr"}) then
                  broadcastToAll("<PATHFINDER>[==> "..getPlayerName(color).." increase Terraform "..total.." steps ]",Color.fromString(color))
              end

          elseif resource == "CardBuilding" then
              broadcastToAll("< "..color.." PLAYER TAKE BUILDING CARD >",Color.fromString(color))
          elseif resource == "ProdEn" then
              getPlayerBoard(color).call("moveProduction",{resource="En",step=total})
              broadcastToAll("<PATHFINDER>[==> "..getPlayerName(color).." increase "..(total).." steps (En) production ]",Color.fromString(color))
          elseif resource == "ProdHe" then
              getPlayerBoard(color).call("moveProduction",{resource="He",step=total})
              broadcastToAll("<PATHFINDER>[==> "..getPlayerName(color).." increase "..(total).." steps (He) production ]",Color.fromString(color))
          elseif resource == "ProdPl" then
              getPlayerBoard(color).call("moveProduction",{resource="Pl",step=total})
              broadcastToAll("<PATHFINDER>[==> "..getPlayerName(color).." increase "..(total).." steps (Pl) production ]",Color.fromString(color))
          elseif resource == "ProdSt" then
              getPlayerBoard(color).call("moveProduction",{resource="St",step=total})
              broadcastToAll("<PATHFINDER>[==> "..getPlayerName(color).." increase "..(total).." steps (St) production ]",Color.fromString(color))
          elseif resource == "ProdTi" then
              getPlayerBoard(color).call("moveProduction",{resource="Ti",step=total})
              broadcastToAll("<PATHFINDER>[==> "..getPlayerName(color).." increase "..(total).." steps (Ti) production ]",Color.fromString(color))
          elseif resource == "Rsrc" then
              broadcastToAll("<PATHFINDER>[==> "..getPlayerName(color).." get "..(total).." standard or not standard resource ]",Color.fromString(color))
          elseif resource == "StdRsrc" then
              broadcastToAll("<PATHFINDER>[==> "..getPlayerName(color).." get "..(total).." standard resource ]",Color.fromString(color))
          else
              if total > 0 then
                  getPlayerBoard(color).call("addResource",{resource=resource,value=total})
                  broadcastToAll("<PATHFINDER>[==> "..getPlayerName(color).." get "..total.." ("..resource..") ]",Color.fromString(color))
              elseif total < 0 then
                  if getPlayerBoard(color).call("payResource",{resource=r,value=total*-1}) then
                      broadcastToAll("<PATHFINDER>[==> "..getPlayerName(color).." pay "..(total*-1).." ("..resource..") ]",Color.fromString(color))
                  else
                      broadcastToAll("<PATHFINDER>[==> "..getPlayerName(color).." must pay "..(total*-1).." ("..resource..") ]",COLORS.WARN)
                  end
              end

             -- if total > 0 then
                --  getPlayerBoard(color).call("addResource",{resource=resource,value=total})

              --elseif total < 0 then
            --      getPlayerBoard(color).call("payResource",{resource=resource,value=(total*-1)})
             -- end

          end
      end
  end

  --function moveTrack(params)
    --  local step = params.step
    -- local name = params.name
    --  if tracks[name]:moveTrack("Grey",step) then
    --      payTrackBonus(params)
    --  end

  --end
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

  function addTags(params)
      local tagList = params.tags
      local color = params.color
      local delay = 0
      for i, t in ipairs(tagList) do
          if t == "Venus" or t == "Earth" or t == "Mars" or t == "Jovian"  then
              Wait.frames(function() moveTrack({name=t,color = color,step=1}) end,delay)
              delay = delay + 200
          end
      end
  end
