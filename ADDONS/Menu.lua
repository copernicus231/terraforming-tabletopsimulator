require("../UTIL/Deploy")
isSetup = false
function start(a,b,c)
    deployBags()
    Wait.frames(function() deploy() end, 100)
    UI.hide("Menu")
    isSetup = true
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

function option1(obj,value)
    optionFlag1 = value
end
function option2(obj,value)
    optionFlag2 = value
end
function option3(obj,value)
    optionFlag3 = value
end
function option4(obj,value)
    optionFlag4 = value
end
function option5(obj,value)
    optionFlag5 = value
end
function option6(obj,value)
    optionFlag6 = value
end
function option7(obj,value)
    optionFlag7 = value
end
function option8(obj,value)
    optionFlag8 = value
end
function option9(obj,value)
    optionFlag9 = value
end
function option10(obj,value)
    optionFlag10 = value
end
function option11(obj,value)
    optionFlag11 = value
end
function option12(obj,value)
    optionFlag12 = value
end
function option13(obj,value)
    optionFlag13 = value
end
function option14(obj,value)
    optionFlag14 = value
end
function option15(obj,value)
    optionFlag15 = value
end
function option16(obj,value)
    optionFlag16 = value
end
function option17(obj,value)
    optionFlag17 = value
end
function option18(obj,value)
    optionFlag18 = value
end
function option19(obj,value)
    optionFlag19 = value
end
