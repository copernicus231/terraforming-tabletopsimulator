TagButton={ countButton = {
        index = 0, click_function = 'changeCount', function_owner = self, label ="",
        position = {-5.11,0.2,-0.6}, width = 200, height = 200, font_size = 100,font_color={0,0,0,100},hover_color={255,255,255,100}
    },discountButton = {
            index = 14, click_function = 'changeDiscount', function_owner = self, label ="",
            position = {-5.11,0.2,0.7}, width = 200, height = 200, font_size = 100,font_color={0,0,0,100},color={253/255, 231/255, 46/255,0}
        }
    ,freecountButton = {
                index = 14, click_function = 'changeDiscount', function_owner = self, label ="",
                position = {-5.11,0.2,0.7}, width = 200, height = 200, font_size = 100,font_color={0,0,0,100},color={253/255, 231/255, 46/255,0}
            },tag=nil,obj=nil}

function TagButton:new(o)
    o = o or {}
    setmetatable(o, self)
    self.__index = self
  return o
end

function TagButton:attach(obj,buttons)
    self.obj = obj
    local list = obj.getButtons();
    local size = 0
    if list != nil then
        size = #list
    end

    self.countButton.label=tostring(self.tag.count)
    self.discountButton.label=tostring(self.tag.discount)
    for i,a in ipairs(buttons) do
        self[a].index=size
        obj.createButton(self[a])
        size = size + 1
    end
end
function TagButton:disable(buttons,func)
    for i,a in ipairs(buttons) do
        self.obj.editButton({index = self[a].index, label = "✘",click_function = func })
    end
end
function TagButton:enable(buttons)
    for i,a in ipairs(buttons) do
        self.obj.editButton({index = self[a].index, label = "0",click_function = self[a].click_function })
    end
end
function TagButton:changeFreeCount(obj,player_clicker_color,alt_click)
    if alt_click then
         self.tag.count = self.tag.count - 1
    else
         self.tag.count = self.tag.count + 1
    end
    self.obj.editButton({index = self.countButton.index, label = tostring(self.tag.count) })
end

function TagButton:changeCount(obj,player_clicker_color,alt_click)
    local newValue = 0
    if alt_click then
        newValue = self.tag:addCount(-1)
    else
        newValue = self.tag:addCount(1)
    end
    self.obj.editButton({index = self.countButton.index, label = tostring(newValue) })
end

function TagButton:updateCount()
    self.obj.editButton({index = self.countButton.index, label = tostring(self.tag.count) })
end
function TagButton:updateDiscount()
    self.obj.editButton({index = self.discountButton.index, label = tostring(self.tag.discount) })
end

function TagButton:changeDiscount(obj,player_clicker_color,alt_click)
    local newValue = 0
    if not alt_click then
        newValue = self.tag:addDiscount(-1)
    else
        newValue = self.tag:addDiscount(1)
    end
    self.obj.editButton({index = self.discountButton.index, label = tostring(newValue) })
end
