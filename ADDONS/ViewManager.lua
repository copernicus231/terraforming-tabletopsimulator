function onLoad(save_state)
    marsView = {
        index = 0, click_function = 'mars', function_owner = self, label = "",
        position = {0.325,0.2,-0.5}, width = 300, height = 200, font_size = 100,font_color={0,0,0,100},color={1,1,1,0},tooltip="MARS"
    }

    venusView = {
        index = 1, click_function = 'venus', function_owner = self, label = "",
        position = {-0.325,0.2,-0.5}, width = 300, height = 200, font_size = 100,font_color={0,0,0,100},color={1,1,1,0},tooltip="VENUS"
    }
    coloniesView = {
        index = 2, click_function = 'colonies', function_owner = self, label = "",
        position = {-0.325,0.2,0.5}, width = 300, height = 200, font_size = 100,font_color={0,0,0,100},color={1,1,1,0},tooltip="COLONIES"
    }
    turmoilView = {
        index = 3, click_function = 'turmoil', function_owner = self, label = "",
        position = {0.325,0.2,0.5}, width = 300, height = 200, font_size = 100,font_color={0,0,0,100},color={1,1,1,0},tooltip="TURMOIL"
    }
    self.createButton(marsView)
    self.createButton(venusView)
    self.createButton(coloniesView)
    self.createButton(turmoilView)
end

function mars(obj,player_clicker_color,alt_click)
    Player[player_clicker_color].lookAt({
        position = Vector(13, 0.96, 0.00),
        pitch    = 90,
        yaw      = 0,
        distance = 40
    })
end
function venus(obj,player_clicker_color,alt_click)
    Player[player_clicker_color].lookAt({
        position = Vector(48.00,0.96, 6.00),--{51.52, 0.96, 9.24}{48.00, 0.96, 6.00}
        pitch    = 90,
        yaw      = 0,
        distance = 10
    })
end
function colonies(obj,player_clicker_color,alt_click)
    Player[player_clicker_color].lookAt({
        position = Vector(85, 0.96, 3),--{44.29, 0.96, -3.10}
        pitch    = 90,
        yaw      = 0,
        distance = 25
    })
end
function turmoil(obj,player_clicker_color,alt_click)
    Player[player_clicker_color].lookAt({
        position = Vector(70.09, 0.96,1),--{24.30, 0.96, 9.52} {24.34, 0.96, -1.22}{70.09, 0.86, 1.00}
        pitch    = 90,
        yaw      = 0,
        distance = 20
    })
end
