require("../UTIL/GetComponents")
function onLoad(save_state)
    bottomNext = {
        index = 0, click_function = 'tryflipStorm', function_owner = self, label = "",
        position = {0,0.1,0}, width = 600, height = 600, font_size = 360,font_color={0,0,0,100},color={253/255, 231/255, 46/255,0},scale={x=1, y=1, z=1},tooltip = "Ready"
    }
    self.createButton(bottomNext)
end
function tryflipStorm(obj,player_clicker_color,alt_click)
    if not alt_click then
        self.editButton({color=Color.fromString(player_clicker_color),label=player_clicker_color,click_function='flipStorm'})
    end
end

function flipStorm(obj,player_clicker_color,alt_click)
  if not alt_click then
      local objs = getObjectsWithAllTags({"DustStorm","Tile"})
      for i,a in ipairs(objs) do
          a.setLock(false)
          a.removeTag("MarsTile")
          a.flip()
          Wait.condition(function()  a.setLock(true); a.setDescription("{\"replace\":{\"MC\":-16,\"TERRAFORM\":2}}");a.addTag("MarsTile") end, function() return a.resting end)
      end
      self.removeButton(0)
      return
  end
    self.editButton({color={253/255, 231/255, 46/255,0},label="",click_function='tryflipStorm'})
end
