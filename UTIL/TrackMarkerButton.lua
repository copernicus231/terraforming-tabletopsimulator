TrackMarkerButton={button ={ index = 0,
    click_function = 'action',
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
     tooltip="Increment Track"
 },colorText="Red",track=nil,onUpdateTrack=function(color,step) print("NOTHING:"..color.."/"..step) end,getCurrentColor=function() return "Red" end,getNextColor= function() return "Blue" end}

function TrackMarkerButton:new(o)
    o = o or {}
    setmetatable(o, self)
    self.__index = self
  return o
end
function TrackMarkerButton:add(obj)
    local trackPos = self.track:getTrackPosition("Grey");
    if trackPos == self.track:getLevel("Grey") or trackPos == 0 or obj.getButtons()!=nil then
        return
    end
    if obj.is_face_down then
        self.button.position = {0,-1,0}
        self.button.rotation = {0,0,180}
    end
    self.colorText = self.getCurrentColor()
    self.button.color = Color.fromString(self.colorText)
    self.button.font_color = self.button.color
    self.button.hover_color = self.button.color
    self.button.press_color = self.button.color
    obj.createButton(self.button)
end
function TrackMarkerButton:doClick(obj,player_clicker_color,alt_click,onUpdateTrack)
    if alt_click then
        local newColor = self.getNextColor(self.colorText)
        self.colorText = newColor
        self.button.color = Color.fromString(newColor)
        self.button.font_color = self.button.color
        self.button.hover_color = self.button.color
        self.button.press_color = self.button.color
        obj.removeButton(0)
        obj.createButton(self.button)
        return
    end
    onUpdateTrack(self.colorText,self.track:getTrackPosition("Grey") - self.track:getLevel("Grey"))
    self.track:updateLevel("Grey")
    obj.removeButton(0)
end
function TrackMarkerButton:remove(obj)
    local buttons = obj.getButtons()
    if buttons != nil then
            obj.removeButton(0)
    end
end
