require("../UTIL/GetComponents")
function onLoad(save_state)
    bottomNext = {
        index = 0, click_function = 'tryChangeFirstPlayer', function_owner = self, label = "",
        position = {0,0.3,0}, width = 600, height = 600, font_size = 360,font_color={0,0,0,100},color={253/255, 231/255, 46/255,0},scale={x=1, y=1, z=1},tooltip = "Ready"
    }
    self.createButton(bottomNext)
end
function tryChangeFirstPlayer(obj,player_clicker_color,alt_click)
    if not alt_click then
        self.editButton({color=Color.fromString(player_clicker_color),label=player_clicker_color,click_function='changeFirstPlayer'})
    end
end

function changeFirstPlayer(obj,player_clicker_color,alt_click)
    if not alt_click then
        Global.call("setCurrentPlayer",player_clicker_color)
        getFirstPlayerToken().setPositionSmooth(getCardPlayTable(player_clicker_color).positionToWorld(Vector(0,3,-1.5)),false,false)
    end
    self.editButton({color={253/255, 231/255, 46/255,0},label="",click_function='tryChangeFirstPlayer'})
end
