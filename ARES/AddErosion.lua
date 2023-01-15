require("../UTIL/GetComponents")
require("../UTIL/CardUtils")
function onLoad(save_state)
    bottomNext = {
        index = 0, click_function = 'tryAddErosion', function_owner = self, label = "",
        position = {0,0.1,0}, width = 600, height = 600, font_size = 360,font_color={0,0,0,100},color={253/255, 231/255, 46/255,0},scale={x=1, y=1, z=1},tooltip = "Ready"
    }
    self.createButton(bottomNext)
end
function tryAddErosion(obj,player_clicker_color,alt_click)
    if not alt_click then
        self.editButton({color=Color.fromString(player_clicker_color),label=player_clicker_color,click_function='AddErosion'})
    end
end

function AddErosion(obj,player_clicker_color,alt_click)
    if not alt_click then
      Wait.frames(function() setOneErosion(getCostTopCard(),false); end,100)
      Wait.frames(function() setOneErosion(getCostTopCard(),true); end,250)
      self.removeButton(0)
      return
    end
    self.editButton({color={253/255, 231/255, 46/255,0},label="",click_function='tryAddErosion'})
end


function setOneErosion(n,reverse)
    if n == 0 then
        n = 1
    end
    local pos = getBoard("BaseGame").call("getEmptyN",{n=n,reverse=reverse})
    local dust = getBag("Erosion").takeObject({position=getBoard("BaseGame").positionToWorld(pos+Vector(0,1,0))})
    Wait.condition(function() getBoard("BaseGame").call("placeDisaster",dust);dust.setLock(true);dust.setDescription("{\"replace\":{\"MC\":-8,\"TERRAFORM\":1}}");dust.addTag("Erosion");dust.addTag("Tile");dust.addTag("MarsTile") end, function() return dust.resting end)
end

function getCostTopCard()
    local first = getDrawHolder("MainDeck").call("getDeck",{}).takeObject({position=getDiscardHolder("MainDeck").getPosition() + Vector(0,1,0)})
    return getCost(first)
end
