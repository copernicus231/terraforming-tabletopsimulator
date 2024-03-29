require("../UTIL/GetComponents")
rsrcTypes = {
    R =  {color = {1,1,1,0.95},font_color={0,0,0,100},label="?",name="?",next="Pl",state=1},
    Pl = {color = {81/255,176/255,18/255,0.95},font_color={42/255,90/255,63/255,100},label="P",name="Pl",next="En",state=2},
    En = {color = {87/255,35/255,100/255,0.95},font_color={1,1,1,100},label="ϟ",name="En",next="He",state=3},
    He = {color = {236/255,96/255,51/255,0.95},font_color={255,255/255,0,100},label="⌇⌇⌇",name="He",next="Science",state=4},
    Science =  {color = {1,1,1,0.95},font_color={0,0,0,100},label="Science",name="Science",next="Floater",state=5},
    Floater =  {color = {251/255,185/255,13/255,0.95},font_color={246/255,238/255,190/255,100},label="Floater",name="Floater",next="Animal",state=6},
    Animal =  {color = {92/255,121/255,49/255,0.95},font_color={23/255,45/255,32/255,100},label="Animal",name="Animal",next="Microbe",state=7},
    Microbe =  {color = {186/255,205/255,22/255,0.95},font_color={74/255,114/255,30/255,100},label="Microbe",name="Microbe",next="R",state=8},
}


function onLoad(save_state)

    optResourceConf = {
        index = 0, click_function = 'change', function_owner = self, label ="",
        position = {0,0.12,0}, width = 700, height = 600, font_size = 250,color={1,1,1,0},scale={x=1, y=1, z=1}
    }
    local holder =  getCardPlayTable(self.getColorTint():toString())
    self.createButton(optResourceConf)
    if holder != nil then
        Wait.condition(function() holder.editButton({index=5,color=rsrcTypes[self.getName()].color,font_color=rsrcTypes[self.getName()].font_color,tooltip=self.getName()}) end, function() return not holder.spawning end)
    end
end

function change(obj,player_clicker_color,alt_click)
  --print(#self.getStates())
    if alt_click then
        local val = self.getStateId()-1
        if val <= 0 then
            val = #self.getStates()+1
        end
        self.setState(val)
    else
        self.setState((self.getStateId()% (#self.getStates()+1))+1)
    end
end

function changeToState(params)
  local rsrc = params.resource
  self.setState(rsrcTypes[rsrc].state)
end
