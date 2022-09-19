require("../UTIL/Utility")
require("../UTIL/GetComponents")
--1 mars icon
--2 scientist icon
--3 unity icon
--4 kelvenist icon
--5 reds icon
--6 greens icon
--7 president
--8 lider marsFirst
--9 lider scienctist
--10 lider unity
--11 lider greens
--12 lider reds
--13 lider kelvinist
--14 to 18 lobby
--19 to 30 marsFirst
--31 to Sienctist
--MarsFirstSnapIndex = {19-30}
--Scientist = {31-42}

errorColor = {255,0,0,1}

dominantParty = "Greens"
parties = {
    MarsFirst = {
        leader = nil,
        delegates = {},
        leaderSnapIndex = 8,
        seatMinSnapIndex = 19,
        seatMaxSnapIndex = 30,
        dominantSnapIndex = 1,
        policyIndex = 1,
        party_name = "MarsFirst",
        nextParty = "Kelvinists",
        rotation = Vector(0,345,0)
    },
    Scientists = {
        leader = nil,
        delegates = {},
        leaderSnapIndex = 9,
        seatMinSnapIndex = 31,
        seatMaxSnapIndex = 42,
        dominantSnapIndex = 2,
        policyIndex = 2,
        party_name = "Scientists",
        nextParty = "MarsFirst",
        rotation = Vector(0,315,0)
    },
    Unity = {
        leader = nil,
        delegates = {},
        leaderSnapIndex = 10,
        seatMinSnapIndex = 43,
        seatMaxSnapIndex = 54,
        dominantSnapIndex = 3,
        policyIndex = 3,
        party_name = "Unity",
        nextParty = "Scientists",
        rotation = Vector(0,285,0)
    },
    Greens = {
        leader = nil,
        delegates = {},
        leaderSnapIndex = 11,
        seatMinSnapIndex = 55,
        seatMaxSnapIndex = 66,
        dominantSnapIndex = 6,
        policyIndex = 4,
        party_name = "Greens",
        nextParty = "Unity",
        rotation = Vector(0,255,0)
    },
    Reds = {
        leader = nil,
        delegates = {},
        leaderSnapIndex = 12,
        seatMinSnapIndex = 67,
        seatMaxSnapIndex = 78,
        dominantSnapIndex = 5,
        policyIndex = 5,
        party_name = "Reds",
        nextParty = "Greens",
        rotation = Vector(0,225,0)
    },
    Kelvinists = {
        leader = nil,
        delegates = {},
        leaderSnapIndex = 13,
        seatMinSnapIndex = 79,
        seatMaxSnapIndex = 90,
        dominantSnapIndex = 4,
        policyIndex = 6,
        party_name = "Kelvinists",
        nextParty = "Reds",
        rotation = Vector(0,195,0)
    }
}

chairman = {
    delegate = nil,
    centralSnapIndex = 7
}
lobby = {
    delegates = {},
    minSnapIndex = 14,
    maxSnapIndex = 18
}


sittingCount = 1
rulePolicy = "99259c"
currentIndex = 4

GameHandler = nil

function onSave()
    local data_to_save = {parties=parties,dominantParty=dominantParty,rulePolicy=rulePolicy,currentIndex=currentIndex,chairman=chairman}
    save_state = JSON.encode(data_to_save)
    return save_state
end
function onLoad(save_state)
    if save_state != nil and save_state != '' then
        local json = JSON.decode(save_state)
        parties = json.parties
        dominantParty=json.dominantParty
        rulePolicy = json.rulePolicy
        currentIndex = json.currentIndex
        chairman = json.chairman
    end
    GameHandler = Global
    sittingCount = 0
end

PLAYERS_TURMOIL=nil
function getPlayersTurmoil()
  if PLAYERS_TURMOIL==nil then
    PLAYERS_TURMOIL = Global.call("getPlayers",{})
    PLAYERS_TURMOIL[#PLAYERS_TURMOIL + 1] = "Grey"
  end
  return PLAYERS_TURMOIL
end
function globalEvent()
    --print("globalEvent")
end
function notifyBonus(partyName)
    --print("notifyBonus: "..partyName)
    broadcastToAll("< BONUS FOR PARTY "..partyName.." >",Color.fromString("Red"))
    for i,color in pairs(Global.call("getPlayers",{})) do
        if partyName == "MarsFirst" then
            local total = getTagTable(color).call("calculatTagSum",{tags = {"Building"}})
            getPlayerBoard(color).call("addResource",{value=total,resource="MC"})
            broadcastToAll("< BONUS FOR ".. color  .. " IS " .. total .. " MC >",Color.fromString(color))
        elseif partyName == "Scientists" then
            local total = getTagTable(color).call("calculatTagSum",{tags = {"Science"}})
            getPlayerBoard(color).call("addResource",{value=total,resource="MC"})
            broadcastToAll("< BONUS FOR ".. color  .. " IS " .. total .. " MC >",Color.fromString(color))
        elseif partyName == "Unity" then
            local total = getTagTable(color).call("calculatTagSum",{tags = {"Venus","Earth","Jovian"}})
            getPlayerBoard(color).call("addResource",{value=total,resource="MC"})
            broadcastToAll("< BONUS FOR ".. color  .. " IS " .. total .. " MC >",Color.fromString(color))
        elseif partyName == "Greens" then
            local total = getTagTable(color).call("calculatTagSum",{tags = {"Plant","Microbe","Animal"}})
            getPlayerBoard(color).call("addResource",{value=total,resource="MC"})
            broadcastToAll("< BONUS FOR ".. color  .. " IS " .. total .. " MC >",Color.fromString(color))
        elseif partyName == "Reds" then
            for i,color in pairs(getLastPlayers()) do
                broadcastToAll("< BONUS FOR LAST PLAYER "..color.."IS 1 TR >")
                getBoard("BaseGame").call("moveTrack",{name="tr",color=color,step=1})
            end
        elseif partyName == "Kelvinists" then
            local total = getPlayerBoard(color).call("getProduction",{resource="He"})
            getPlayerBoard(color).call("addResource",{value=total,resource="MC"})
            broadcastToAll("< BONUS FOR ".. color  .. " IS " .. total .. " MC >",Color.fromString(color))
        end

    end
end
function getLastPlayers()
  local player = {}
  local minTr = 100
  for i,color in pairs(Global.call("getPlayers",{})) do
    local tr = getBoard("BaseGame").call("getTrackLevel",{color=color,track="tr"})
    if tr == minTr then
      player[#player + 1] = color
    elseif tr < minTr then
      player = {color}
      minTr = tr
    end
  end
  return player
end

function getGUIDColor(id)
  return toLColor(getObjectFromGUID(id).getColorTint())
end

function newGoverment()
    if currentIndex != parties[dominantParty].policyIndex then
        currentIndex = parties[dominantParty].policyIndex
        rulePolicy = getObjectFromGUID(rulePolicy).setState(currentIndex).getGUID()
    end
    notifyBonus(dominantParty)
    --call ruling bonus

    --increase terraform leader colors

    if chairman.delegate != nil then
        getDelegateBag(getGUIDColor(chairman.delegate)).call("putDelegate",chairman.delegate)
        chairman.delegate = nil
    end

    if parties[dominantParty].leader != nil then
        chairman.delegate = parties[dominantParty].leader
        getObjectFromGUID(parties[dominantParty].leader).setPositionSmooth(self.positionToWorld(self.getSnapPoints()[chairman.centralSnapIndex].position + Vector(0,1,0)))
        parties[dominantParty].leader = nil
        if getGUIDColor(chairman.delegate) != lColor("Grey") then
            local colorName = getGUIDColor(chairman.delegate)
            broadcastToAll("< NEW CHAIRMAN COLOR ".. colorName .. " WINS 1 TR >",Color.fromString(colorName))
            Wait.frames(function() getBoard("BaseGame").call("moveTrack",{name="tr",color=colorName,step=1}) end,40)
        end
        local delegates = parties[dominantParty].delegates
        parties[dominantParty].delegates = {}
        for i,delegate in pairs(delegates) do
            getDelegateBag(getGUIDColor(delegate)).call("putDelegate",delegate)
        end
        changeDominantParty()
    end
    sendLobby()
end

function sendLobby()
    local snapLobby = lobby.minSnapIndex
    local highVector = Vector(0,1,0)
    for i,col in pairs(getPlayersTurmoil()) do
        if col != "Grey" then
            if getDelegateBag(col) != nil then
                if #getDelegateBag(col).getObjects() > 0 then
                    getDelegateBag(col).takeObject({position = self.positionToWorld(self.getSnapPoints()[snapLobby].position + Vector(0,1,0))})
                    snapLobby = snapLobby + 1
                else
                    broadcastToAll("NOT DELEGATES "..  i .. " FOR LOBBY",errorColor)
                end
            end
        end

    end

end


function addNeutral(params)
    local party = params.name
    local obj = nil
    if #getDelegateBag("Grey").getObjects() > 0 then
        local obj = getDelegateBag("Grey").takeObject()
        if party != "Chairman" then
            Wait.condition(function() addToParty(obj.getGUID(),parties[party]);sittingParty(parties[party]);changeDominantParty() end,function() return not obj.spawning and obj.resting end)
        else
            Wait.condition(function()  chairman.delegate = obj.getGUID(); getObjectFromGUID(chairman.delegate).setPositionSmooth(self.positionToWorld(self.getSnapPoints()[chairman.centralSnapIndex].position + Vector(0,1,0))) end,function() return not obj.spawning and obj.resting end)
        end
    else
        broadcastToAll("NOT ENOUGH NEUTRAL DELEGATES FOR ADD IN "..party,errorColor)
    end
end

testId = nil
function onCollisionEnter(collision_info)
    -- collision_info table:
    --   collision_object    Object
    --   contact_points      Table     {Vector, ...}
    --   relative_velocity   Vectors
    --print("enter")s
    --print(collision_info.collision_object.getGUID())ss
--    if collision_info.collision_object.getGUID() == "b5f3f8" then
--        local up = Vector(0,1,0)
--        print(snapIndex)
--        getObjectFromGUID("58a4d0").setPositionSmooth(self.positionToWorld(self.getSnapPoints()[snapIndex].position+up))
--        snapIndex = snapIndex +1
--        return
--    else
--        return
--    end
--    if collision_info.collision_object.getGUID() == "98cec3" then
--        notifyBonus()
        --addNeutral({name="Scientists"})
        --addNeutral({name="Scientists"})
        --addNeutral({name="Kelvinists"})
--        return
--    else
        --return
--    end


    if collision_info.collision_object.getName() != "Delegate" then
        return
    end

    if sittingCount > 0 then
        --print("Disable for: ".. collision_info.collision_object.getGUID())
        --print("yes: ".. collision_info.collision_object.getGUID() )
        return
    end

    local delegate = collision_info.collision_object
--    print("sCount here:" .. sittingCount)
--    print("why: ".. delegate.getGUID() )
    local hasChange = false
    for i,party in pairs(parties) do
        if Vector.sqrDistance(self.getSnapPoints()[party.seatMinSnapIndex + 6].position,self.positionToLocal(delegate.getPosition())) < 0.06 and not containsOnParty(delegate.getGUID(),party) then
            local oldParty = removeFromParties(delegate.getGUID())
            if oldParty != nil then
                sittingParty(oldParty)
            end
            addToParty(delegate.getGUID(),party)
            sittingParty(party)
            changeDominantParty()
            return
        else
            if Vector.sqrDistance(self.getSnapPoints()[party.leaderSnapIndex].position,self.positionToLocal(delegate.getPosition())) < 0.001 and party.leader != delegate.getGUID() then
                -- TO BE CHECK
                local oldParty = removeFromParties(delegate.getGUID())
                if oldParty != nil then
                    sittingParty(oldParty)
                end
                if party.leader == nil then
                    party.leader = delegate.getGUID()
                else
                    local temp = party.leader
                    party.leader = delegate.getGUID()
                    party.delegates[#party.delegates + 1] = temp
                end
                sittingParty(party)
                changeDominantParty()
                return
            end
        end
    end
    if Vector.sqrDistance(self.getSnapPoints()[chairman.centralSnapIndex].position,self.positionToLocal(delegate.getPosition())) < 0.001 then
        local oldParty = removeFromParties(delegate.getGUID())
        if oldParty != nil then
            sittingParty(oldParty)
            changeDominantParty()
        end
        chairman.delegate = delegate.getGUID()
    end

end

function changeDominantParty()
    dominantParty = getDominantParty()
    getDominantMarker().setPositionSmooth(self.positionToWorld(self.getSnapPoints()[parties[dominantParty].dominantSnapIndex].position + Vector(0,1,0)))
end

function onCollisionExit(collision_info)
    if collision_info.collision_object.getName() != "Delegate" then
        return
    end
    local delegate = collision_info.collision_object
    if  Vector.sqrDistance(self.getSnapPoints()[chairman.centralSnapIndex].position,self.positionToLocal(delegate.getPosition())) < 0.001 then
        chairman.delegate = nil
    end
end
--center 113


function getPartyNumOfMembers(party)
    if party.leader != nil then
        return #party.delegates + 1
    else
        return #party.delegates
    end
end

function getDominantParty()
    local maxDelegates = getPartyNumOfMembers(parties[dominantParty])
    local dominant = dominantParty
    local currentParty = dominant
    repeat
        currentParty = parties[currentParty].nextParty
        if maxDelegates < getPartyNumOfMembers(parties[currentParty]) then
            maxDelegates = getPartyNumOfMembers(parties[currentParty])
            dominant = currentParty
        end
    until  parties[currentParty].nextParty == dominantParty
    return dominant
end
--check if and delegate belongs to a specific party
function containsOnParty(id,party)
    if party.leader == id then
        return true
    end
    for i,delegate in pairs(party.delegates) do
        if delegate == id then
            return true
        end
    end
    return false
end
--add delegate to a party
function addToParty(id,party)
    if party.leader == nil then
        party.leader = id
        return
    end
    if getGUIDColor(party.leader) != getGUIDColor(id) then
        local counter = countDelegates(party)
        counter[getGUIDColor(id)] = counter[getGUIDColor(id)] + 1
        local max = getGUIDColor(party.leader)
        --print(counter[max])
        for i,count in pairs(counter) do
            if count > counter[max] then
                max = i
            end
        end
        if max != getGUIDColor(party.leader) then
            party.delegates[#party.delegates + 1] = party.leader
            party.leader = id
            return
        end
    end
    party.delegates[#party.delegates + 1] = id
end


--Count delegatees from a party by colors
function countDelegates(party)
    local counter = {}
    for i,color in pairs(getPlayersTurmoil()) do
        counter[color] = 0
    end

    for i,delegate in pairs(party.delegates) do
        local color = getGUIDColor(delegate)
        counter[color] = counter[color] + 1
    end
    if party.leader != nil then
        counter[getGUIDColor(party.leader)] = counter[getGUIDColor(party.leader)] + 1
    end
    return counter
end


--remove delegate from Parties return party if was deleted or nil if not
function removeFromParties(id)
     for i,party in pairs(parties) do
        if party.leader == id then
            local max = getGUIDColor(party.leader)
            party.leader = nil
            local counter = countDelegates(party)
            for i, count in pairs(counter) do
                if count > counter[max] then
                    max = i
                end
            end
            changeLeader(max,party)
            return party
        elseif remove(id,party.delegates) then
            local counter = countDelegates(party)
            local max = getGUIDColor(party.leader)
            for i, count in pairs(counter) do
                if count > counter[max] then
                    max = i
                end
            end
            if max != getGUIDColor(party.leader) then
                changeLeader(max,party)
            end
            return party
        end
     end
     return nil
end
function remove(id,delegates)
    for i,delegate in pairs(delegates) do
        if delegate == id then
            delegates[i] = delegates[#delegates]
            delegates[#delegates] = nil
            return true
        end
    end
    return false
end
function changeLeader(colorId,party)
    for i,delegate in pairs(party.delegates) do
        if getGUIDColor(delegate) == colorId then
            local temp = party.leader
            party.leader = delegate
            if temp == nil then
                party.delegates[i] = party.delegates[#party.delegates]
                party.delegates[#party.delegates] = nil
            else
                party.delegates[i] = temp
            end

        end
    end
end

function sittingPartyByName(partyName)
    sittingParty(parties[partyName])
end

--Sitting delegates of a party
function sittingParty(party)
    sittingCount = sittingCount + 1
    local highVector = Vector(0,1,0)
    local counter = #party.delegates
    if party.leader != nil then
        counter = counter + 1
        getObjectFromGUID(party.leader).setRotationSmooth(party.rotation)
        getObjectFromGUID(party.leader).setPositionSmooth(self.positionToWorld(self.getSnapPoints()[party.leaderSnapIndex].position + highVector))
        Wait.condition(function() counter = counter - 1 end, function() return getObjectFromGUID(party.leader).resting and not getObjectFromGUID(party.leader).isSmoothMoving() end)
    end
    for i,delegate in pairs(party.delegates) do
        getObjectFromGUID(delegate).setRotationSmooth(party.rotation)
        getObjectFromGUID(delegate).setPositionSmooth(self.positionToWorld(self.getSnapPoints()[party.seatMinSnapIndex -1 + i].position + highVector))
        Wait.condition(function() counter = counter -1 end, function() return getObjectFromGUID(delegate).resting and not getObjectFromGUID(delegate).isSmoothMoving() end)
    end
    Wait.condition(function() sittingCount = sittingCount - 1  end,function() return counter == 0  end)
end
