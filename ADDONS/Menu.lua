require("../UTIL/Deploy")
function onLoad(save_state)
    optionButton1 = {index = 0, click_function = 'option1', function_owner = self, label ="",
                    position = {0.87,0.2,-0.84}, width = 45, height = 45, font_size = 40,font_color={0,0,0,100},
                    hover_color={255,255,255,100}}
    optionButton2 = {index = 1, click_function = 'option2', function_owner = self, label ="",
                    position = {0.87,0.2,-0.75}, width = 45, height = 45, font_size = 40,font_color={0,0,0,100},
                    hover_color={255,255,255,100}}
    optionButton3 = {index = 2, click_function = 'option3', function_owner = self, label ="",
                    position = {0.87,0.2,-0.66}, width = 45, height = 45, font_size = 40,font_color={0,0,0,100},
                    hover_color={255,255,255,100}}
    optionButton4 = {index = 3, click_function = 'option4', function_owner = self, label ="",
                    position = {0.87,0.2,-0.56}, width = 45, height = 45, font_size = 40,font_color={0,0,0,100},
                    hover_color={255,255,255,100}}
    optionButton5 = {index = 4, click_function = 'option5', function_owner = self, label ="",
                    position = {0.87,0.2,-0.47}, width = 45, height = 45, font_size = 40,font_color={0,0,0,100},
                    hover_color={255,255,255,100}}
    optionButton6 = {index = 5, click_function = 'option6', function_owner = self, label ="",
                    position = {0.87,0.2,-0.38}, width = 45, height = 45, font_size = 40,font_color={0,0,0,100},
                    hover_color={255,255,255,100}}
    optionButton7 = {index = 6, click_function = 'option7', function_owner = self, label ="",
                    position = {0.87,0.2,-0.29}, width = 45, height = 45, font_size = 40,font_color={0,0,0,100},
                    hover_colowar={255,255,255,100}}
    optionButton8 = {index = 7, click_function = 'option8', function_owner = self, label ="",
                    position = {0.87,0.2,-0.07}, width = 45, height = 45, font_size = 40,font_color={0,0,0,100},
                    hover_color={255,255,255,100}}
    optionButton9 = {index = 8, click_function = 'option9', function_owner = self, label ="",
                    position = {0.87,0.2,0.02}, width = 45, height = 45, font_size = 40,font_color={0,0,0,100},
                    hover_color={255,255,255,100}}

    optionButton10 = {index = 9, click_function = 'option10', function_owner = self, label ="",
                    position = {0.87,0.2,0.11}, width = 45, height = 45, font_size = 40,font_color={0,0,0,100},
                    hover_color={255,255,255,100}}
    optionButton11 = {index = 10, click_function = 'option11', function_owner = self, label ="",
                    position = {0.87,0.2,0.20}, width = 45, height = 45, font_size = 40,font_color={0,0,0,100},
                    hover_color={255,255,255,100}}
    optionButton12 = {index = 11, click_function = 'option12', function_owner = self, label ="",
                    position = {0.87,0.2,0.29}, width = 45, height = 45, font_size = 40,font_color={0,0,0,100},
                    hover_color={255,255,255,100}}

    optionButton13 = {index = 12, click_function = 'option13', function_owner = self, label ="",
                    position = {0.87,0.2,0.38}, width = 45, height = 45, font_size = 40,font_color={0,0,0,100},
                    hover_color={255,255,255,100}}

    optionButton14 = {index = 13, click_function = 'option14', function_owner = self, label ="",
                    position = {0.87,0.2,0.47}, width = 45, height = 45, font_size = 40,font_color={0,0,0,100},
                    hover_color={255,255,255,100}}
    optionButton15 = {index = 14, click_function = 'option15', function_owner = self, label ="",
                    position = {0.87,0.2,0.56}, width = 45, height = 45, font_size = 40,font_color={0,0,0,100},
                    hover_color={255,255,255,100}}
    optionButton16 = {index = 15, click_function = 'option16', function_owner = self, label ="",
                    position = {0.87,0.2,0.65}, width = 45, height = 45, font_size = 40,font_color={0,0,0,100},
                    hover_color={255,255,255,100}}
    optionButton17 = {index = 16, click_function = 'option17', function_owner = self, label ="",
                    position = {0.87,0.2,0.74}, width = 45, height = 45, font_size = 40,font_color={0,0,0,100},
                    hover_color={255,255,255,100}}
    optionButton18 = {index = 17, click_function = 'option18', function_owner = self, label ="",
                    position = {0.87,0.2,0.83}, width = 45, height = 45, font_size = 40,font_color={0,0,0,100},
                    hover_color={255,255,255,100}}
    optionButton19 = {index = 18, click_function = 'option19', function_owner = self, label ="",
                    position = {0.87,0.2,0.92}, width = 45, height = 45, font_size = 40,font_color={0,0,0,100},
                    hover_color={255,255,255,100}}

    startButton = {index = 18, click_function = 'start', function_owner = self, label ="Start",
                    position = {0,0.2,0.9}, width = 180, height = 65, font_size = 60,font_color={0,0,0,100},
                    hover_color={255,255,255,100}}
    self.createButton(optionButton1)
    self.createButton(optionButton2)
    self.createButton(optionButton3)
    self.createButton(optionButton4)
    self.createButton(optionButton5)
    self.createButton(optionButton6)
    self.createButton(optionButton7)
    self.createButton(optionButton8)
    self.createButton(optionButton9)
    self.createButton(optionButton10)
    self.createButton(optionButton11)
    self.createButton(optionButton12)
    self.createButton(optionButton13)
    self.createButton(optionButton14)
    self.createButton(optionButton15)
    self.createButton(optionButton16)
    self.createButton(optionButton17)
    self.createButton(optionButton18)
    self.createButton(optionButton19)
    self.createButton(startButton)
end
function start(obj,player_clicker_color,alt_click)
    --print(optionFlag1)
    --print(optionFlag2)
    --print(optionFlag3)
    --print(optionFlag4)
    --print(optionFlag5)
    --print(optionFlag6)
    --print(optionFlag7)
    --print(optionFlag8)
    --print(optionFlag9)
    --print(optionFlag10)
    --print(optionFlag11)
    --print(optionFlag12)
    deployBags()
    Wait.frames(function() deploy() end, 100)

end
function deploy()
    local tags = {}
    deployObjectsBag("90ca63",baseConfig)
    if optionFlag1 then
        deployObjectsBag("90ca63",corpEraConfig)
    end
    if optionFlag2 then

    end
    if optionFlag3 then
        deployObjectsBag("c96f61",venusConfig)
        tags["Venus"] = true
    end
    if optionFlag4 then
        deployObjectsBag("4dc240",coloniesConfig)
        Wait.frames(function() getObjectFromGUID("3a5103").setVar("isColoniesPhase", true) end,100)
    end
    if optionFlag5 then
        deployObjectsBag("11d75d",preludeConfig)
        Wait.frames(function() getObjectFromGUID("3a5103").setVar("isPreludePhase", true) end,100)
    end
    if optionFlag6 then
        deployObjectsBag("600c1f",turmoilConfig)
        Wait.frames(function() getObjectFromGUID("3a5103").setVar("isTurmoilPhase", true) end,100)
    end
    if optionFlag7 then
        deployObjectsBag("90ca63",promoConfig)
        Wait.frames(function() removeCards("95fec6",{"Magnetic Field Generators","Great Dam","Deimos Down"},"90ca63") end,20)
        if optionFlag5 then
            deployObjectsBag("90ca63",preludePromoConfig)
        end
    end
    if optionFlag8 then
        deployObjectsBag("0d8217",fanMadeCorpsConfig)
    end
    if optionFlag9 then
        deployObjectsBag("0d8217",fanMadeProjectsConfig)
    end
    if optionFlag10 then


    end
    if optionFlag11 then

        deployObjectsBag("0d8217",highOrbitConfig)
        tags["Infrastructure"] = true
        if optionFlag4 then
            moveFromBag("0d8217","7f2283",coloniesFanMadeConfig)
        end
        --9580cc
        --528cc3
        --991de4
        --643568
        --179144
        --b16f29
        --737f17
    end
    if optionFlag12 then
        local obj = getObjectFromGUID("0d97f2")
        Wait.condition(function() getObjectFromGUID("90ca63").putObject(obj); deployObjectsBag("0d8217",aresConfig) end,
         function() return obj.resting end)
        if optionFlag7 then
            Wait.frames(function() removeCards("b6f30c",{"Magnetic Field Generators","Great Dam","Deimos Down"},"90ca63") end,20)
        else
            Wait.frames(function() removeCards("95fec6",{"Magnetic Field Generators","Great Dam","Deimos Down"},"90ca63") end,20)
        end
        Wait.frames(function() removeCards("95fec6",{"Capital","Natural Preserve","Ecological Zone","Nuclear Zone","Lava Flows","Mohole Area","Mining Rights"},"90ca63") end,20)
        if optionFlag1 then
            Wait.frames(function() removeCards("997296",{"Commercial District","Industrial Center","Mining Area","Restricted Area"},"90ca63") end,20)
        end

    end
    if optionFlag13 then
        tags["Mars"] = true
        deployObjectsBag("0d8217",pathfindersConfig)
        Wait.condition(function() deployObjectsBag("0d8217",pathfindersConfig)  end, function() return count == 5 end)
        if optionFlag4 then
            moveFromBag("0d8217","7f2283",coloniesPathfindersConfig)
        end
    end

    if optionFlag14 then
        tags["RadioActive"] = true
        deployObjectsBag("0d8217",nuclearConfig)
        if optionFlag4 then
            moveFromBag("0d8217","7f2283",coloniesNuclearConfig)
        end
    end
    if optionFlag15 then
        tags["Moon"] = true
        deployObjectsBag("0d8217",lunaConfig)
    end
    if optionFlag16 then
        if optionFlag3 then
            local obj = getObjectFromGUID("9d6aeb")
            Wait.condition(function() getObjectFromGUID("c96f61").putObject(obj); deployObjectsBag("c96f61",venus2Config) end,
             function() return obj.resting end)
        else
            deployObjectsBag("c96f61",venus2Config)
            tags["Venus"] = true
        end

    end
    if optionFlag17 then
        deployObjectsBag("0d8217",earlyBasesConfig)
    end
    if optionFlag18 then
        deployObjectsBag("0d8217",industriesConfig)
    end

    if optionFlag19 then
        deployObjectsBag("0d8217",preludesFanMadeConfig)
    end
    local objs = {getObjectFromGUID("8c77fb"),getObjectFromGUID("dada8d"),getObjectFromGUID("c155e6"),getObjectFromGUID("cedf19"),getObjectFromGUID("5a5ff6")}
    local count = 0
    for i,obj in pairs(objs) do
        Wait.condition(function() obj.call("setup",{tags=tags}) end, function() return obj.resting end)
    end

end
--Capital 43cdcf
--Commercial District d42a29
--Natural Preserve 43cdcf
--Ecological Zone  43cdcf
--Nuclear Zone 43cdcf
--Lava Flows  43cdcf
--Industrial Center d42a29
--Mohole Area 43cdcf
--Mining Rights 43cdcf
--Mining Area d42a29
--Restricted Area d42a29

optionFlag1 = false
optionFlag2 = false
optionFlag3 = false
optionFlag4 = false
optionFlag5 = false
optionFlag6 = false
optionFlag7 = false
optionFlag8 = false
optionFlag9 = false
optionFlag10 = false
optionFlag11 = false
optionFlag12 = false
optionFlag13 = false
optionFlag14 = false
optionFlag15 = false
optionFlag16 = false
optionFlag17 = false
optionFlag18 = false
optionFlag19 = false

function option1(obj,player_clicker_color,alt_click)
    if optionFlag1 == false then
        optionFlag1 = true
        self.editButton({index=0,label="X"})
    else
        optionFlag1 = false
        self.editButton({index=0,label=""})
    end
end

function option2(obj,player_clicker_color,alt_click)
    if optionFlag2 == false then
        optionFlag2 = true
        self.editButton({index=1,label="X"})
    else
        optionFlag2 = false
        self.editButton({index=1,label=""})
    end
end

function option3(obj,player_clicker_color,alt_click)
    if optionFlag3 == false then
        optionFlag3 = true
        self.editButton({index=2,label="X"})
    else
        optionFlag3 = false
        self.editButton({index=2,label=""})
    end
end

function option4(obj,player_clicker_color,alt_click)
    if optionFlag4 == false then
        optionFlag4 = true
        self.editButton({index=3,label="X"})
    else
        optionFlag4 = false
        self.editButton({index=3,label=""})
    end
end

function option5(obj,player_clicker_color,alt_click)
    if optionFlag5 == false then
        optionFlag5 = true
        self.editButton({index=4,label="X"})
    else
        optionFlag5 = false
        self.editButton({index=4,label=""})
    end
end

function option6(obj,player_clicker_color,alt_click)
    if optionFlag6 == false then
        optionFlag6 = true
        self.editButton({index=5,label="X"})
    else
        optionFlag6 = false
        self.editButton({index=5,label=""})
    end
end

function option7(obj,player_clicker_color,alt_click)
    if optionFlag7 == false then
        optionFlag7 = true
        self.editButton({index=6,label="X"})
    else
        optionFlag7 = false
        self.editButton({index=6,label=""})
    end
end

function option8(obj,player_clicker_color,alt_click)
    if optionFlag8 == false then
        optionFlag8 = true
        self.editButton({index=7,label="X"})
    else
        optionFlag8 = false
        self.editButton({index=7,label=""})
    end
end

function option9(obj,player_clicker_color,alt_click)
    if optionFlag9 == false then
        optionFlag9 = true
        self.editButton({index=8,label="X"})
    else
        optionFlag9 = false
        self.editButton({index=8,label=""})
    end
end

function option10(obj,player_clicker_color,alt_click)
    if optionFlag10 == false then
        optionFlag10 = true
        self.editButton({index=9,label="X"})
    else
        optionFlag10 = false
        self.editButton({index=9,label=""})
    end
end

function option11(obj,player_clicker_color,alt_click)
    if optionFlag11 == false then
        optionFlag11 = true
        self.editButton({index=10,label="X"})
    else
        optionFlag11 = false
        self.editButton({index=10,label=""})
    end
end

function option12(obj,player_clicker_color,alt_click)
    if optionFlag12 == false then
        optionFlag12 = true
        self.editButton({index=11,label="X"})
    else
        optionFlag12 = false
        self.editButton({index=11,label=""})
    end
end

function option13(obj,player_clicker_color,alt_click)
    if optionFlag13 == false then
        optionFlag13 = true
        self.editButton({index=12,label="X"})
    else
        optionFlag13 = false
        self.editButton({index=12,label=""})
    end
end

function option14(obj,player_clicker_color,alt_click)
    if optionFlag14 == false then
        optionFlag14 = true
        self.editButton({index=13,label="X"})
    else
        optionFlag14 = false
        self.editButton({index=13,label=""})
    end
end

function option15(obj,player_clicker_color,alt_click)
    if optionFlag15 == false then
        optionFlag15 = true
        self.editButton({index=14,label="X"})
    else
        optionFlag15 = false
        self.editButton({index=14,label=""})
    end
end
function option16(obj,player_clicker_color,alt_click)
    if optionFlag16 == false then
        optionFlag16 = true
        self.editButton({index=15,label="X"})
    else
        optionFlag16 = false
        self.editButton({index=15,label=""})
    end
end
function option17(obj,player_clicker_color,alt_click)
    if optionFlag17 == false then
        optionFlag17 = true
        self.editButton({index=16,label="X"})
    else
        optionFlag17 = false
        self.editButton({index=16,label=""})
    end
end
function option18(obj,player_clicker_color,alt_click)
    if optionFlag18 == false then
        optionFlag18 = true
        self.editButton({index=17,label="X"})
    else
        optionFlag18 = false
        self.editButton({index=17,label=""})
    end
end

function option19(obj,player_clicker_color,alt_click)
    if optionFlag19 == false then
        optionFlag19 = true
        self.editButton({index=18,label="X"})
    else
        optionFlag19 = false
        self.editButton({index=18,label=""})
    end
end
