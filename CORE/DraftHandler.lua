require("../UTIL/GetComponents")
colors=nil
direction = "next"


function setup()
    colors = Global.call("getPlayers",{})
end

function onLoad(save_state)
    log("Loading Draft")
    inDraft=false
    --CHANGE TO ITERATE OVER ACTIVE PLAYERS
--    setup()
end


function cleanDraftHands()
   for i,color in pairs(colors) do
        local handObj = Player[color].getHandObjects(1)
            for x,y in pairs(handObj) do
                y.deal(1,color,2)
            end
        local handObj2 = Player[color].getHandObjects(3)
        for x,y in pairs(handObj2) do
            y.deal(1,color,4)
        end
    end
end
function startDraft()
    colors = Global.call("getPlayers",{})
    local generation = getBoard("BaseGame").call("getTrackLevel",{track="tr",color="Grey"})
    if generation%2 == 0 then
        direction = "prev"
    else
        direction = "next"
    end
    for i,arrow in ipairs(getArrows()) do
        arrow.rotate(vector(0,180,0))
    end
    inDraft=false
    for i,color in ipairs(colors) do
        getDraftToken(color).call("pending")
        getCardPlayTable(color).call("enableDiscardResearch",4)
    end
    cleanDraftHands()
    Wait.frames(function() getDrawHolder("MainDeck").call("dealCards",{colors=colors,n=4}) end,50)
    pickCount = 0
    roundCount = 0
    --avoid concurrency problems
    Wait.frames(function() inDraft=true end, 100)
end

function pick(params)
    if inDraft then
        if params.state then
            pickCount = pickCount + 1
        else
            pickCount = pickCount - 1
        end
        if pickCount == #colors then
            inDraft = false
            pickCount = 0
            roundCount = roundCount + 1
            for i,color in ipairs(colors) do
                getDraftToken(color).call("pending")
            end
            local delay = 20
            for i,color in pairs(colors) do
                local handObj = Player[color].getHandObjects()
                local nextC = Global.call("getNextPlayerDir",{color = color,dir = direction})
                Wait.frames(function() for x,y in pairs(handObj) do
                    y.deal(1,nextC)
                end end,delay)
                delay = delay + 20
            end

            if roundCount < 3 then
                Wait.frames(function() inDraft=true end, 100)
            else
                Wait.frames(function() for i,color in pairs(colors) do
                    local handObj = Player[color].getHandObjects(3)
                    for x,y in pairs(handObj) do
                        y.deal(1,color)
                    end
                    end
                end,delay)
            end
        end
    end
end
function flipHand(color)
    local handObj = Player[color].getHandObjects()
    for x,y in pairs(handObj) do
        if not y.is_face_down then
            y.flip()
        end
    end
end

--function onDrop(player_color)
--    startDraft()
--end

function onObjectEnterScriptingZone(zone, enter_object)
    if inDraft and zone.hasTag("Draft") then
        enter_object.drop()
        for i,color in ipairs(colors) do
            if getDraftZone(color) == zone then
                if not getDraftToken(color).call("getState") then
                    flipHand(color)
                    getDraftToken(color).call("done")
                end
            end
        end
    end
end
