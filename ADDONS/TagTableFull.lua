require("../ADDONS/Tag")
require("../ADDONS/TagButton")
require("../UTIL/GetComponents")
require("../UTIL/Utility")
TAGS={
    Building={name="Building",count=0,discount=0,income=0,enable=true},
    Space={name="Space",count=0,discount=0,income=0,enable=true},
    Power={name="Power",count=0,discount=0,income=0,enable=true},
    Science={name="Science",count=0,discount=0,income=0,enable=true},
    Jovian={name="Jovian",count=0,discount=0,income=0,enable=true},
    Earth={name="Earth",count=0,discount=0,income=0,enable=true},
    Venus={name="Venus",count=0,discount=0,income=0,enable=false},
    Plant={name="Plant",count=0,discount=0,income=0,enable=true},
    Microbe={name="Microbe",count=0,discount=0,income=0,enable=true},
    Animal={name="Animal",count=0,discount=0,income=0,enable=true},
    City={name="City",count=0,discount=0,income=0,enable=true},
    WildCard={name="WildCard",count=0,discount=0,income=0,enable=true},
    Non={name="Non",count=0,discount=0,income=0,enable=true},
    Event={name="Event",count=0,discount=0,income=0,enable=true},
    Mars={name="Mars",count=0,discount=0,income=0,enable=false},
    RadioActive={name="RadioActive",count=0,discount=0,income=0,enable=false},
    Moon={name="Moon",count=0,discount=0,income=0,enable=false},
    Infrastructure={name="Infrastructure",count=0,discount=0,income=0,enable=false},
    Mercury={name="Mercury",count=0,discount=0,income=0,enable=false},
}
All={name="All",discount=0}
Vps={name="Vps",count=0}
TAGS_BUTTONS={
    Building={countButton = {index = 0, click_function = 'chgCountBuilding', function_owner = self, label ="",
                            position = {-6.67,0.2,-0.6}, width = 200, height = 200, font_size = 100,font_color={0,0,0,100},color={255,255,255,0}}
            ,discountButton = {index = 14, click_function = 'chgDiscountBuilding', function_owner = self, label ="",
                            position = {-6.67,0.2,0.65}, width = 200, height = 200, font_size = 100,font_color={0,0,0,100},color={253/255, 231/255, 46/255,0}}
            ,tag=nil
            ,obj=nil},
    Space={countButton = {index = 0, click_function = 'chgCountSpace', function_owner = self, label ="",
                            position = {-5.89,0.2,-0.6}, width = 200, height = 200, font_size = 100,font_color={0,0,0,100},color={255,255,255,0}}
            ,discountButton = {index = 14, click_function = 'chgDiscountSpace', function_owner = self, label ="",
                            position = {-5.89,0.2,0.65}, width = 200, height = 200, font_size = 100,font_color={0,0,0,100},color={253/255, 231/255, 46/255,0}}
            ,tag=nil
            ,obj=nil},
    Power={countButton = {index = 0, click_function = 'chgCountPower', function_owner = self, label ="",
                            position = {-5.12,0.2,-0.6}, width = 200, height = 200, font_size = 100,font_color={0,0,0,100},color={255,255,255,0}}
            ,discountButton = {index = 14, click_function = 'chgDiscountPower', function_owner = self, label ="",
                            position = {-5.12,0.2,0.65}, width = 200, height = 200, font_size = 100,font_color={0,0,0,100},color={253/255, 231/255, 46/255,0}}
            ,tag=nil
            ,obj=nil},
    Science={countButton = {index = 0, click_function = 'chgCountScience', function_owner = self, label ="",
                            position = {-4.34,0.2,-0.6}, width = 200, height = 200, font_size = 100,font_color={0,0,0,100},color={255,255,255,0}}
            ,discountButton = {index = 14, click_function = 'chgDiscountScience', function_owner = self, label ="",
                            position = {-4.34,0.2,0.65}, width = 200, height = 200, font_size = 100,font_color={0,0,0,100},color={253/255, 231/255, 46/255,0}}
            ,tag=nil
            ,obj=nil},
    Jovian={countButton = {index = 0, click_function = 'chgCountJovian', function_owner = self, label ="",
                            position = {-3.57,0.2,-0.6}, width = 200, height = 200, font_size = 100,font_color={0,0,0,100},color={255,255,255,0}}
            ,discountButton = {index = 14, click_function = 'chgDiscountJovian', function_owner = self, label ="",
                            position = {-3.57,0.2,0.65}, width = 200, height = 200, font_size = 100,font_color={0,0,0,100},color={253/255, 231/255, 46/255,0}}
            ,tag=nil
            ,obj=nil},
    Earth={countButton = {index = 0, click_function = 'chgCountEarth', function_owner = self, label ="",
                            position = {-2.79,0.2,-0.6}, width = 200, height = 200, font_size = 100,font_color={0,0,0,100},color={255,255,255,0}}
            ,discountButton = {index = 14, click_function = 'chgDiscountEarth', function_owner = self, label ="",
                            position = {-2.79,0.2,0.65}, width = 200, height = 200, font_size = 100,font_color={0,0,0,100},color={253/255, 231/255, 46/255,0}}
            ,tag=nil
            ,obj=nil},
    Venus={countButton = {index = 0, click_function = 'chgCountVenus', function_owner = self, label ="",
                            position = {-2.01,0.2,-0.6}, width = 200, height = 200, font_size = 100,font_color={0,0,0,100},color={255,255,255,0}}
            ,discountButton = {index = 14, click_function = 'chgDiscountVenus', function_owner = self, label ="",
                            position = {-2.01,0.2,0.65}, width = 200, height = 200, font_size = 100,font_color={0,0,0,100},color={253/255, 231/255, 46/255,0}}
            ,tag=nil
            ,obj=nil},
    Plant={countButton = {index = 0, click_function = 'chgCountPlant', function_owner = self, label ="",
                            position =  {-1.23,0.2,-0.6}, width = 200, height = 200, font_size = 100,font_color={0,0,0,100},color={255,255,255,0}}
            ,discountButton = {index = 14, click_function = 'chgDiscountPlant', function_owner = self, label ="",
                            position = {-1.23,0.2,0.65}, width = 200, height = 200, font_size = 100,font_color={0,0,0,100},color={253/255, 231/255, 46/255,0}}
            ,tag=nil
            ,obj=nil},
    Microbe={countButton = {index = 0, click_function = 'chgCountMicrobe', function_owner = self, label ="",
                            position = {-0.46,0.2,-0.6}, width = 200, height = 200, font_size = 100,font_color={0,0,0,100},color={255,255,255,0}}
            ,discountButton = {index = 14, click_function = 'chgDiscountMicrobe', function_owner = self, label ="",
                            position = {-0.46,0.2,0.65}, width = 200, height = 200, font_size = 100,font_color={0,0,0,100},color={253/255, 231/255, 46/255,0}}
            ,tag=nil
            ,obj=nil},
    Animal={countButton = {index = 0, click_function = 'chgCountAnimal', function_owner = self, label ="",
                            position = {0.32,0.2,-0.6}, width = 200, height = 200, font_size = 100,font_color={0,0,0,100},color={255,255,255,0}}
            ,discountButton = {index = 14, click_function = 'chgDiscountAnimal', function_owner = self, label ="",
                            position = {0.32,0.2,0.65}, width = 200, height = 200, font_size = 100,font_color={0,0,0,100},color={253/255, 231/255, 46/255,0}}
            ,tag=nil
            ,obj=nil},
    City={countButton = {index = 0, click_function = 'chgCountCity', function_owner = self, label ="",
                            position = {1.1,0.2,-0.6}, width = 200, height = 200, font_size = 100,font_color={0,0,0,100},color={255,255,255,0}}
            ,discountButton = {index = 14, click_function = 'chgDiscountCity', function_owner = self, label ="",
                            position = {1.1,0.2,0.65}, width = 200, height = 200, font_size = 100,font_color={0,0,0,100},color={253/255, 231/255, 46/255,0}}
            ,tag=nil
            ,obj=nil},
    WildCard={countButton = {index = 0, click_function = 'chgCountWildCard', function_owner = self, label ="",
                            position = {1.88,0.2,-0.6}, width = 200, height = 200, font_size = 100,font_color={0,0,0,100},color={255,255,255,0}}
            ,discountButton = {index = 14, click_function = 'chgDiscountWildCard', function_owner = self, label ="",
                            position = {1.88,0.2,0.65}, width = 200, height = 200, font_size = 100,font_color={0,0,0,100},color={253/255, 231/255, 46/255,0}}
            ,tag=nil
            ,obj=nil},
    Non={countButton = {index = 0, click_function = 'chgCountNon', function_owner = self, label ="",
                            position = {2.66,0.2,-0.6}, width = 200, height = 200, font_size = 100,font_color={0,0,0,100},color={255,255,255,0}}
            ,discountButton = {index = 14, click_function = 'chgDiscountNon', function_owner = self, label ="",
                            position = {2.66,0.2,0.65}, width = 200, height = 200, font_size = 100,font_color={0,0,0,100},color={253/255, 231/255, 46/255,0}}
            ,tag=nil
            ,obj=nil},
    Event={countButton = {index = 0, click_function = 'chgCountEvent', function_owner = self, label ="",
                            position = {3.43,0.2,-0.6}, width = 200, height = 200, font_size = 100,font_color={0,0,0,100},color={255,255,255,0}}
            ,discountButton = {index = 14, click_function = 'chgDiscountEvent', function_owner = self, label ="",
                            position = {3.43,0.2,0.65}, width = 200, height = 200, font_size = 100,font_color={0,0,0,100},color={253/255, 231/255, 46/255,0}}
            ,tag=nil
            ,obj=nil},
    Mars={countButton = {index = 0, click_function = 'chgCountMars', function_owner = self, label ="",
                            position = {4.21,0.2,-0.6}, width = 200, height = 200, font_size = 100,font_color={0,0,0,100},color={255,255,255,0}}
            ,discountButton = {index = 14, click_function = 'chgDiscountMars', function_owner = self, label ="",
                            position = {4.21,0.2,0.65}, width = 200, height = 200, font_size = 100,font_color={0,0,0,100},color={253/255, 231/255, 46/255,0}}
            ,tag=nil
            ,obj=nil},
    RadioActive={countButton = {index = 0, click_function = 'chgCountRadioActive', function_owner = self, label ="",
                            position = {4.99,0.2,-0.6}, width = 200, height = 200, font_size = 100,font_color={0,0,0,100},color={255,255,255,0}}
            ,discountButton = {index = 14, click_function = 'chgDiscountRadioActive', function_owner = self, label ="",
                            position = {4.99,0.2,0.65}, width = 200, height = 200, font_size = 100,font_color={0,0,0,100},color={253/255, 231/255, 46/255,0}}
            ,tag=nil
            ,obj=nil},
    Moon={countButton = {index = 0, click_function = 'chgCountMoon', function_owner = self, label ="",
                            position = {5.76,0.2,-0.6}, width = 200, height = 200, font_size = 100,font_color={0,0,0,100},color={255,255,255,0}}
            ,discountButton = {index = 14, click_function = 'chgDiscountMoon', function_owner = self, label ="",
                            position = {5.76,0.2,0.65}, width = 200, height = 200, font_size = 100,font_color={0,0,0,100},color={253/255, 231/255, 46/255,0}}
            ,tag=nil
            ,obj=nil},
    Infrastructure={countButton = {index = 0, click_function = 'chgCountInfrastructure', function_owner = self, label ="",
                            position = {6.53,0.2,-0.6}, width = 200, height = 200, font_size = 100,font_color={0,0,0,100},color={255,255,255,0}}
            ,discountButton = {index = 14, click_function = 'chgDiscountInfrastructure', function_owner = self, label ="",
                            position = {6.53,0.2,0.65}, width = 200, height = 200, font_size = 100,font_color={0,0,0,100},color={253/255, 231/255, 46/255,0}}
            ,tag=nil
            ,obj=nil},
    Mercury={countButton = {index = 0, click_function = 'chgCountMercury', function_owner = self, label ="",
                            position = {7.31,0.2,-0.6}, width = 200, height = 200, font_size = 100,font_color={0,0,0,100},color={255,255,255,0}}
            ,discountButton = {index = 14, click_function = 'chgDiscountMercury', function_owner = self, label ="",
                            position = {7.31,0.2,0.65}, width = 200, height = 200, font_size = 100,font_color={0,0,0,100},color={253/255, 231/255, 46/255,0}}
            ,tag=nil
            ,obj=nil},

}

AllButton={discountButton = {index = 14, click_function = 'chgDiscountAll', function_owner = self, label ="",
                        position =  {8.02,0.2,0.65}, width = 200, height = 200, font_size = 100,font_color={0,0,0,100},color={253/255, 231/255, 46/255,0}}
        ,tag=nil
        ,obj=nil}

VpsButton={countButton = {index = 0, click_function = 'chgVp', function_owner = self, label = "",
                position = {-7.6,0.2,0}, width = 200, height = 200, font_size = 200,font_color={255,255,255,100},color={253/255, 231/255, 46/255,0}}
        ,tag=nil
        ,obj=nil}

islock = true
lockButton={index = 0, click_function = 'changeState', function_owner = self, label = "lock",
                position = {8.0,0.2,-0.6}, width = 200, height = 200, font_size = 100,font_color={255,255,255,100},color={253/255, 231/255, 46/255,0}}

function changeState()
    islock = not islock
    if islock then
        lockButton.label="lock"
    else
        lockButton.label="unlock"
    end
    self.editButton({index=lockButton.index,label=lockButton.label})
end

function onSave()
    local data_to_save = {TAGS = TAGS,All = All,Vps=Vps}
    save_state = JSON.encode(data_to_save)
    return save_state
end

function nop()
    log("disable tag")
end

function setup(params)
    for i,t in pairs(params.tags) do
        if t == true then
            TAGS[i].enable = true
            TAGS_BUTTONS[i]:enable({"countButton","discountButton"})
        end

    end
end

function onLoad(save_state)
    if save_state != nil and save_state != '' then
        local d = JSON.decode(save_state)
        All=d.All
        Vps=d.Vps
        TAGS=d.TAGS
    end
    for i,t in pairs(TAGS) do
        TAGS_BUTTONS[i].tag = Tag:new(t)
        TagButton:new(TAGS_BUTTONS[i])
        TAGS_BUTTONS[i]:attach(self,{"countButton","discountButton"})
    end
    for i,t in pairs(TAGS) do
        if TAGS[i].enable == false then
            TAGS_BUTTONS[i]:disable({"countButton","discountButton"},"nop")
        end
    end

    AllButton.tag=Tag:new(All)
    VpsButton.tag=Tag:new(Vps)
    TagButton:new(AllButton)
    TagButton:new(VpsButton)
    AllButton:attach(self,{"discountButton"})
    VpsButton:attach(self,{"countButton"})
    local list = self.getButtons();
    local size = 0
    if list != nil then
        size = #list
    end
    lockButton.index = size
    self.createButton(lockButton)
end
function chgVp(obj,player_clicker_color,alt_click)
    if islock then return end
    VpsButton:changeFreeCount(obj,player_clicker_color,alt_click)
end
function chgDiscountAll(obj,player_clicker_color,alt_click)
    if islock then return end
    AllButton:changeDiscount(obj,player_clicker_color,alt_click)
end

function chgCountBuilding(obj,player_clicker_color,alt_click)
    if islock then return end
    TAGS_BUTTONS["Building"]:changeCount(obj,player_clicker_color,alt_click)
end
function chgCountSpace(obj,player_clicker_color,alt_click)
    if islock then return end
    TAGS_BUTTONS["Space"]:changeCount(obj,player_clicker_color,alt_click)
end
function chgCountPower(obj,player_clicker_color,alt_click)
    if islock then return end
    TAGS_BUTTONS["Power"]:changeCount(obj,player_clicker_color,alt_click)
end
function chgCountScience(obj,player_clicker_color,alt_click)
    if islock then return end
    TAGS_BUTTONS["Science"]:changeCount(obj,player_clicker_color,alt_click)
end
function chgCountJovian(obj,player_clicker_color,alt_click)
    if islock then return end
    TAGS_BUTTONS["Jovian"]:changeCount(obj,player_clicker_color,alt_click)
end
function chgCountBuilding(obj,player_clicker_color,alt_click)
    if islock then return end
    TAGS_BUTTONS["Building"]:changeCount(obj,player_clicker_color,alt_click)
end
function chgCountEarth(obj,player_clicker_color,alt_click)
    if islock then return end
    TAGS_BUTTONS["Earth"]:changeCount(obj,player_clicker_color,alt_click)
end
function chgCountVenus(obj,player_clicker_color,alt_click)
    if islock then return end
    TAGS_BUTTONS["Venus"]:changeCount(obj,player_clicker_color,alt_click)
end
function chgCountPlant(obj,player_clicker_color,alt_click)
    if islock then return end
    TAGS_BUTTONS["Plant"]:changeCount(obj,player_clicker_color,alt_click)
end
function chgCountMicrobe(obj,player_clicker_color,alt_click)
    if islock then return end
    TAGS_BUTTONS["Microbe"]:changeCount(obj,player_clicker_color,alt_click)
end
function chgCountAnimal(obj,player_clicker_color,alt_click)
    if islock then return end
    TAGS_BUTTONS["Animal"]:changeCount(obj,player_clicker_color,alt_click)
end
function chgCountCity(obj,player_clicker_color,alt_click)
    if islock then return end
    TAGS_BUTTONS["City"]:changeCount(obj,player_clicker_color,alt_click)
end
function chgCountWildCard(obj,player_clicker_color,alt_click)
    if islock then return end
    TAGS_BUTTONS["WildCard"]:changeCount(obj,player_clicker_color,alt_click)
end
function chgCountNon(obj,player_clicker_color,alt_click)
    if islock then return end
    TAGS_BUTTONS["Non"]:changeCount(obj,player_clicker_color,alt_click)
end
function chgCountEvent(obj,player_clicker_color,alt_click)
    if islock then return end
    TAGS_BUTTONS["Event"]:changeCount(obj,player_clicker_color,alt_click)
end

function chgCountMars(obj,player_clicker_color,alt_click)
    if islock then return end
    TAGS_BUTTONS["Mars"]:changeCount(obj,player_clicker_color,alt_click)
end

function chgCountRadioActive(obj,player_clicker_color,alt_click)
    if islock then return end
    TAGS_BUTTONS["RadioActive"]:changeCount(obj,player_clicker_color,alt_click)
end

function chgCountMoon(obj,player_clicker_color,alt_click)
    if islock then return end
    TAGS_BUTTONS["Moon"]:changeCount(obj,player_clicker_color,alt_click)
end

function chgCountInfrastructure(obj,player_clicker_color,alt_click)
    if islock then return end
    TAGS_BUTTONS["Infrastructure"]:changeCount(obj,player_clicker_color,alt_click)
end

function chgCountMercury(obj,player_clicker_color,alt_click)
    if islock then return end
    TAGS_BUTTONS["Mercury"]:changeCount(obj,player_clicker_color,alt_click)
end


function chgDiscountBuilding(obj,player_clicker_color,alt_click)
    if islock then return end
    TAGS_BUTTONS["Building"]:changeDiscount(obj,player_clicker_color,alt_click)
end
function chgDiscountSpace(obj,player_clicker_color,alt_click)
    if islock then return end
    TAGS_BUTTONS["Space"]:changeDiscount(obj,player_clicker_color,alt_click)
end
function chgDiscountPower(obj,player_clicker_color,alt_click)
    if islock then return end
    TAGS_BUTTONS["Power"]:changeDiscount(obj,player_clicker_color,alt_click)
end
function chgDiscountScience(obj,player_clicker_color,alt_click)
    if islock then return end
    TAGS_BUTTONS["Science"]:changeDiscount(obj,player_clicker_color,alt_click)
end
function chgDiscountJovian(obj,player_clicker_color,alt_click)
    if islock then return end
    TAGS_BUTTONS["Jovian"]:changeDiscount(obj,player_clicker_color,alt_click)
end
function chgDiscountBuilding(obj,player_clicker_color,alt_click)
    if islock then return end
    TAGS_BUTTONS["Building"]:changeDiscount(obj,player_clicker_color,alt_click)
end
function chgDiscountEarth(obj,player_clicker_color,alt_click)
    if islock then return end
    TAGS_BUTTONS["Earth"]:changeDiscount(obj,player_clicker_color,alt_click)
end
function chgDiscountVenus(obj,player_clicker_color,alt_click)
    if islock then return end
    TAGS_BUTTONS["Venus"]:changeDiscount(obj,player_clicker_color,alt_click)
end
function chgDiscountPlant(obj,player_clicker_color,alt_click)
    if islock then return end
    TAGS_BUTTONS["Plant"]:changeDiscount(obj,player_clicker_color,alt_click)
end
function chgDiscountMicrobe(obj,player_clicker_color,alt_click)
    if islock then return end
    TAGS_BUTTONS["Microbe"]:changeDiscount(obj,player_clicker_color,alt_click)
end
function chgDiscountAnimal(obj,player_clicker_color,alt_click)
    if islock then return end
    TAGS_BUTTONS["Animal"]:changeDiscount(obj,player_clicker_color,alt_click)
end
function chgDiscountCity(obj,player_clicker_color,alt_click)
    if islock then return end
    TAGS_BUTTONS["City"]:changeDiscount(obj,player_clicker_color,alt_click)
end
function chgDiscountWildCard(obj,player_clicker_color,alt_click)
    if islock then return end
    TAGS_BUTTONS["WildCard"]:changeDiscount(obj,player_clicker_color,alt_click)
end
function chgDiscountNon(obj,player_clicker_color,alt_click)
    if islock then return end
    TAGS_BUTTONS["Non"]:changeDiscount(obj,player_clicker_color,alt_click)
end
function chgDiscountEvent(obj,player_clicker_color,alt_click)
    if islock then return end
    TAGS_BUTTONS["Event"]:changeDiscount(obj,player_clicker_color,alt_click)
end
function chgDiscountMars(obj,player_clicker_color,alt_click)
    if islock then return end
    TAGS_BUTTONS["Mars"]:changeDiscount(obj,player_clicker_color,alt_click)
end

function chgDiscountRadioActive(obj,player_clicker_color,alt_click)
    if islock then return end
    TAGS_BUTTONS["RadioActive"]:changeDiscount(obj,player_clicker_color,alt_click)
end

function chgDiscountMoon(obj,player_clicker_color,alt_click)
    if islock then return end
    TAGS_BUTTONS["Moon"]:changeDiscount(obj,player_clicker_color,alt_click)
end

function chgDiscountInfrastructure(obj,player_clicker_color,alt_click)
    if islock then return end
    TAGS_BUTTONS["Infrastructure"]:changeDiscount(obj,player_clicker_color,alt_click)
end

function chgDiscountMercury(obj,player_clicker_color,alt_click)
    if islock then return end
    TAGS_BUTTONS["Mercury"]:changeDiscount(obj,player_clicker_color,alt_click)
end


function calculateDiscount(params)
    local tagList = params.tags
    local discount = 0
    for i, t in ipairs(tagList) do
        if TAGS[t] != nil then
            discount = discount + TAGS[t].discount
        end
    end
    discount = discount + All.discount
    return discount
end

function addVps(params)
    Vps.count = Vps.count + params.count
    VpsButton:updateCount()
end

function addTags(params)
    local tagList = params.tags
    for i, t in ipairs(tagList) do
        if TAGS[t] != nil and TAGS[t].enable == true then
            TAGS[t]:addCount(1)
            TAGS_BUTTONS[t]:updateCount()
        end
    end
    --getBoard("PathFinders").call("addTags",{tags = tagList,color=toLColor(self.getColorTint())})
end
function addDiscount(params)
    local discount = params.discount
    if discount.tag == "All" then
        All:addDiscount(discount.total)
        AllButton:updateDiscount()
    else
        TAGS[discount.tag]:addDiscount(discount.total)
        TAGS_BUTTONS[discount.tag]:updateDiscount()
    end

end
function calculatTagSum(params)
    local tagList = params.tags
    local total = 0
    for i, t in ipairs(tagList) do
        total = total + TAGS[t].count
    end
    return total
end
