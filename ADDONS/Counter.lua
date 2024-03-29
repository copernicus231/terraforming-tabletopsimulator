require("../ADDONS/Tag")
require("../ADDONS/TagButton")

city={name="city",count=0}
spaceCity={name="spaceCity",count=0}

cityButton={countButton = {index = 0, click_function = 'chgCity', function_owner = self, label = "",
                position = {0.16,0.1,-0.53}, width = 200, height = 200, font_size = 90,font_color={0,0,0,100},color={253/255, 231/255, 46/255,0}}
        ,tag=nil
        ,obj=nil}
spaceCityButton={countButton = {index = 0, click_function = 'chgSpaceCity', function_owner = self, label = "",
                position = {0.16,0.1,0.47}, width = 200, height = 200, font_size = 90,font_color={0,0,0,100},color={253/255, 231/255, 46/255,0}}
        ,tag=nil
        ,obj=nil}

islock = true
lockButton={index = 0, click_function = 'changeState', function_owner = self, label = "lock",
                position = {0.7,0.1,0.9}, width = 200, height = 200, font_size = 50,font_color={255,255,255,100},color={253/255, 231/255, 46/255,0}}

function onSave()
    local data_to_save = {spaceCity = spaceCity,city=city}
    save_state = JSON.encode(data_to_save)
    return save_state
end


function onLoad(save_state)
    if save_state != nil and save_state != '' then
        local d = JSON.decode(save_state)
        city=d.city
        spaceCity=d.spaceCity
    end
    cityButton.tag=Tag:new(city)
    TagButton:new(cityButton)
    cityButton:attach(self,{"countButton"})
    spaceCityButton.tag=Tag:new(spaceCity)
    TagButton:new(spaceCityButton)
    spaceCityButton:attach(self,{"countButton"})
    local list = self.getButtons();
    local size = 0
    if list != nil then
        size = #list
    end
    lockButton.index = size
    self.createButton(lockButton)
end

function chgCity(obj,player_clicker_color,alt_click)
    if islock then return end
    cityButton:changeFreeCount(obj,player_clicker_color,alt_click)
end

function chgSpaceCity(obj,player_clicker_color,alt_click)
    if islock then return end
    spaceCityButton:changeFreeCount(obj,player_clicker_color,alt_click)
end

function changeState()
    islock = not islock
    if islock then
        lockButton.label="lock"
    else
        lockButton.label="unlock"
    end
    self.editButton({index=lockButton.index,label=lockButton.label})
end

function addCount(params)
    local color = params.color
    if params.type == "City" then
        city.count = city.count + params.count
        cityButton:updateCount()
    elseif params.type == "spaceCity" or params.type == "venusCity" or params.type == "lunarCity"  then
        spaceCity.count = spaceCity.count + params.count
        spaceCityButton:updateCount()
    end

end
