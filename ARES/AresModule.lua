require("../UTIL/GetComponents")
require("../UTIL/CardUtils")
DUST_MARKER=nil
function getDustStormMarker()
    if DUST_MARKER == nil then
        DUST_MARKER = getSingleObject({"Marker","DustStorm"})
    end
    return DUST_MARKER
end
EROSION_MARKER=nil
function getErosionMarker()
    if EROSION_MARKER == nil then
        EROSION_MARKER = getSingleObject({"Marker","Erosion"})
    end
    return EROSION_MARKER
end
DUST_REMOVE_MARKER=nil
function getRemoveDustMarker()
    if DUST_REMOVE_MARKER == nil then
        DUST_REMOVE_MARKER = getSingleObject({"Marker","RemoveDust"})
    end
    return DUST_REMOVE_MARKER
end
function setup()
    --getBoard("BaseBoard").call()
    if getBoard("BaseGame").getName() != "Arcadia Planitia Game Board" then
        getDustStormMarker().setPositionSmooth({9.93, 2.06, 13.07})
        --{-29.47, 1.06, 5.06}
        getDustStormMarker().setRotationSmooth({0.00, 165, 0.00})
    end

    if getBoard("BaseGame").getName() == "Elysium Game Board" then
        getErosionMarker().setPositionSmooth({1.29, 2.16, 4.22})
    elseif getBoard("BaseGame").getName() == "Arcadia Planitia Game Board" then
        getDustStormMarker().setPositionSmooth({-2.2, 2.06, 5.06})
        --
        getDustStormMarker().setRotationSmooth({0.00, 105, 0.00})
        getErosionMarker().setPositionSmooth({28.8, 2.16, 4.89})
    else
        getErosionMarker().setPositionSmooth({28.54, 2.16, 4.42})
    end

    --{-25.98, 1.16, 4.22}
    getErosionMarker().setRotationSmooth({0.00, 180, 180})
    local numPlayer = #Global.call("getPlayers")
    if numPlayer != 4 then
        Wait.frames(function() setOneDustStorm(getCostTopCard()+getCostTopCard(),false); end,600)
    end
    if numPlayer < 5 then
        Wait.frames(function() setOneDustStorm(getCostTopCard(),false); end,750)
        Wait.frames(function() setOneDustStorm(getCostTopCard(),true); end,900)
    end
    math.randomseed(os.time())
    local val = math.random(2)
    if val == 1 then
        getMilestone("AresExpansion").setPositionSmooth({10.56, 2.06, -10.99})
    elseif val == 2 then
        getAward("AresExpansion").setPositionSmooth({14.84, 1.06, -10.91})
    end
end
function setOneDustStorm(n,reverse)
    if n == 0 then
        n = 1
    end
    local pos = getBoard("BaseGame").call("getEmptyN",{n=n,reverse=reverse})
    local dust = getBag("DustStorm").takeObject({position=getBoard("BaseGame").positionToWorld(pos+Vector(0,1,0))})
    dust.addTag("DustStorm")
    dust.addTag("Tile")
    Wait.condition(function() getBoard("BaseGame").call("placeDisaster",dust) end, function() return dust.resting end)
end

function getCostTopCard()
    local first = getDrawHolder("MainDeck").call("getDeck",{}).takeObject({position=getDiscardHolder("MainDeck").getPosition() + Vector(0,1,0)})
    return getCost(first)
end
