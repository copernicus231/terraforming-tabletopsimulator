require("../UTIL/GetComponents")

function tryObjectEnter(enter_object)
    local total = #self.getObjects()
    if enter_object.getDescription() != self.getDescription() then
        return false
    end
    Wait.condition(function() postCheck(total) end,function() return total != #self.getObjects() end)
    return true
end

function putDelegate(id)
    local total = #self.getObjects()
    self.putObject(getObjectFromGUID(id))
    Wait.condition(function() postCheck(total) end,function() return total != #self.getObjects() end)
end

function putDelegates(delegates)
    local total = #self.getObjects()
    for i,delegate in pairs(delegates) do
        self.putObject(getObjectFromGUID(delegate))
    end
    Wait.condition(function() postCheck(total) end,function() return total != #self.getObjects() end)
end

function postCheck(total)
    local pname = {}
    local index = 0
    for i,delegate in pairs(self.getObjects()) do
        if i > total then
            if delegate.description != self.getDescription() then
                self.takeObject({guid = delegate.guid})
            else
                local party = getBoard("WorldGoverment").call("removeFromParties",delegate.guid)
                if party != nil then
                    index = index + 1
                    pname[index] = party.party_name

                end
            end
        end

    end

    for i,partyName in pairs(pname) do
      print(partyName)
        getBoard("WorldGoverment").call("sittingPartyByName",partyName)
    end

    if #pname > 0 then
        getBoard("WorldGoverment").call("changeDominantParty")
    end

end
