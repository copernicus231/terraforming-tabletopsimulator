function onDestroy()
    local zoneD = zone
    if zoneD != nil then
        destroyObject(zoneD)
    end
end

function onLoad(save_state)
    if save_state != nil and save_state != '' then
        local json = JSON.decode(save_state)
        if json.myId == self.getGUID() and getObjectFromGUID(json.zoneGUID)!=nil then
            local obj = getObjectFromGUID(json.zoneGUID)
            if obj != nil then
                obj.destruct()
            end
        end
    end
    zone = spawnObject({
        type              = "ScriptingTrigger",
        position          = self.positionToWorld(Vector(0,0.3,0)),
        rotation          = self.getRotation(),
        scale             = Vector(2.83,0.5,4.03),
        callback_function = function(obj) obj.addTag("Card") end,
    })
end

function getDeck()
    local obj = zone.getObjects()
    if #obj == 1 and obj[1].type=="Deck" then
        return obj[1]
    end
    log("THERE IS NO DECK ON HOLDER")
    return nil
end

function getNumCards()
    local obj = zone.getObjects()
    if #obj == 1 then
        local deck = obj[1]
        if deck.type=="Deck" then
            return #obj[1].getObjects()
        elseif deck.type == "Card" then
            return 1
        end

    end
    return 0
end
function shuffle()
    local deck = getDeck()
    if deck != nil then
        return deck.shuffle()
    end
    return false
end

function dealCards(params)
    return deal(params.colors,params.n)
end

function deal(colors,n)
    local deck = getDeck()
    if deck != nil and getNumCards() > n*#colors then
        for i,color in pairs(colors) do
            deck.deal(n, color)
        end
        return true
    end
    return false
end

function onSave()
    local data_to_save = {zoneGUID = zone.getGUID(),myId=self.getGUID()}
    save_state = JSON.encode(data_to_save)
    return save_state
end

function onDrop()
    Wait.condition(function() zone.setPosition(self.positionToWorld(Vector(0,0.3,0)));zone.setRotation(self.getRotation()); end, function() return self.resting end)
end
