TileButton={button = {
        index = 0, click_function = 'placeTile', function_owner = self, label = "",
        position = {0,0.1,0},rotation={0,0,0},width = 300, height = 300, font_size = 100,font_color={0,0,0,0},color=Color.fromString("Red"),hover_color={0,0,0,0},tooltip="Place"
    },colorText="Red",getCurrentColor=function() return "Red" end,getNextColor= function() return "Blue" end}
function TileButton:new(o)
    o = o or {}
    setmetatable(o, self)
    self.__index = self
  return o
end

function TileButton:add(obj)

    if obj.is_face_down then
        self.button.position = {0,-0.1,0}
        self.button.rotation = {0,0,180}
    else
        self.button.position = {0,0.1,0}
        self.button.rotation = {0,0,0}
    end
    self.colorText = self.getCurrentColor()
    self.button.color = Color.fromString(self.colorText)
    self.button.font_color = self.button.color
    self.button.hover_color = self.button.color
    self.button.press_color = self.button.color
    obj.createButton(self.button)
end

function TileButton:remove(obj)
    local buttons = obj.getButtons()
    if buttons != nil then
            obj.removeButton(0)
    end
end

function TileButton:doClick(obj,player_clicker_color,alt_click,placement)
    if alt_click then
        if obj.is_face_down then
            self.button.position = {0,-0.1,0}
            self.button.rotation = {0,0,180}
        else
            self.button.position = {0,0.1,0}
            self.button.rotation = {0,0,0}
        end
        local newColor = self.getNextColor(self.colorText)
        self.colorText = newColor
        self.button.color = Color.fromString(newColor)
        self.button.font_color = self.button.color
        self.button.hover_color = self.button.color
        self.button.press_color = self.button.color
        self:remove(obj)
        obj.createButton(self.button)
        return
    end
    obj.setLock(true)
    placement(obj,self.colorText)
    self:remove(obj)
end
