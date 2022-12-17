require("../UTIL/CardUtils")
require("../UTIL/GetComponents")
require("../UTIL/Utility")

rsrcTypes = {
    En = {color = {87/255,35/255,100/255,0.95},font_color={1,1,1,100},label="ϟ",name="En",next="He"},
    He = {color = {236/255,96/255,51/255,0.95},font_color={1,211/255,0,100},label="⌇⌇⌇",name="He",next="R"},
    R =  {color = {1,1,1,0.95},font_color={0,0,0,100},label="?",name="?",next="En"}
}

mcToPayTotal = 0
stToPayTotal = 0
tiToPayTotal = 0
stPriceTotal = 2
tiPriceTotal = 3
optToPayTotal = 0
optResourcteType="R"
researchCards=0
projectProd = {}
projectTags = {}
projectRsrc = {}
projectCostChange = {}
isDiscardResearch = false
loadingGame = true

function applyTags(tagList)
    --local tagList = getTags(card)
    local tagListClean = tagList
    if contains(tagList,"Event") then
        tagListClean = {"Event"}
    end
    getTagTable(self.getColorTint():toString()).call("addTags",{tags = tagListClean})
    getBoard("PathFinders").call("addTags",{tags = tagList,color=toLColor(self.getColorTint())})
    getBoard("Nuclear").call("addTags",{tags = tagList,color=toLColor(self.getColorTint())})
end
function applyVps(card)
    local Vps = getVP(card)
    if Vps != 0 then
        getTagTable(self.getColorTint():toString()).call("addVps",{count=Vps})
    end
end

function applyDiscounts(card)
    local Discount = getDiscount(card)
    for i,a in pairs(Discount) do
        getTagTable(self.getColorTint():toString()).call("addDiscount",{discount={total=a,tag=i}})
        broadcastToAll("[==> "..getPlayerName(self.getColorTint():toString()).." add discount "..a.." for tag \""..i.."\" ]",self.getColorTint())
    end
end
function applyProduction(prod)
    --local prod = getProductions(card)
    for r,c in pairs(prod) do
        if getPlayerBoard(self.getColorTint():toString()).call("moveProduction",{resource=r,step=c}) then
            if c > 0 then
                broadcastToAll("[==> "..getPlayerName(self.getColorTint():toString()).." increase "..(c).." steps ("..r..") production ]",self.getColorTint())
            else
                broadcastToAll("[==> "..getPlayerName(self.getColorTint():toString()).." reduce "..(c).." steps ("..r..") production ]",self.getColorTint())
            end
        else
            broadcastToAll("[==> "..getPlayerName(self.getColorTint():toString()).." must reduce "..(c).." steps ("..r..") production ]",COLORS.WARN)
        end
    end
end

function applyResources(rsrc,card)
    local color = self.getColorTint():toString()
    --local rsrc = getResources(card)
    for r,c in pairs(rsrc) do
        if r == "MC" or r == "He" or r == "En" or r == "Pl" or r == "Ti" or r == "St" then
            log(r)
            if c > 0 then
                getPlayerBoard(color).call("addResource",{resource=r,value=c})
                broadcastToAll("[==> "..getPlayerName(color).." get "..c.." ("..r..") ]",self.getColorTint())
            elseif c < 0 then
                if getPlayerBoard(color).call("payResource",{resource=r,value=c*-1}) then
                    broadcastToAll("[==> "..getPlayerName(color).." pay "..(c*-1).." ("..r..") ]",self.getColorTint())
                else
                    broadcastToAll("[==> "..getPlayerName(color).." must pay "..(c*-1).." ("..r..") ]",COLORS.WARN)
                end
            end
        elseif r == "Temperature" then
            log("Temperature")
            if getBoard("BaseGame").call("moveTrack",{step=c,color=color,name="temperature"}) then
                broadcastToAll("[==> "..getPlayerName(color).." increment temperature "..c.." steps ]",self.getColorTint())
            end
        elseif r == "SpecialTile" then
            log("SpecialTile")
            for i,a in pairs(getBag(r).getObjects()) do
                if a.name == card.getName() then
                    local pos = getCardPlayTable(color).positionToWorld(Vector(0,1,-2.7))
                    getBag(r).takeObject({index = a.index,position=pos})
                end
            end
            broadcastToAll("[==> "..getPlayerName(color).." must place special tile "..card.getName().." ]",self.getColorTint())
        elseif r == "VenusScale" then
            log("VenusScale")
            if getBoard("VenusNext").call("moveTrack",{name="venusScale",step=c,color=color}) then
                broadcastToAll("[==> "..getPlayerName(color).." increase Venus parameter "..c.." steps ]",self.getColorTint())
            end
        elseif r == "Oxygen" then
            log("Oxygen")
            if getBoard("BaseGame").call("moveTrack",{step=c,color=color,name="oxygen"}) then
                broadcastToAll("[==> "..getPlayerName(color).." increase Oxygen "..c.." steps ]",self.getColorTint())
            end
        elseif r == "Terraform" then
            if getBoard("BaseGame").call("moveTrack",{step=c,color=color,name="tr"}) then
                broadcastToAll("[==> "..getPlayerName(color).." increase Terraform "..c.." steps ]",self.getColorTint())
            end
        elseif r == "Card" then
            log("Card")
            getDrawHolder("Project").call("dealCards",{colors={color},n=c})
            broadcastToAll("[==> "..getPlayerName(color).." get "..c.." cards ]",self.getColorTint())
        elseif r == "LogisticRate" then
            if getBoard("Luna").call("moveTrack",{step=c,color=color,name="logisticRate"}) then
                broadcastToAll("[==> "..getPlayerName(color).." increase Logistic Rate "..c.." steps ]",self.getColorTint())
            end
        elseif r == "ColonizationRate" then
            if getBoard("Luna").call("moveTrack",{step=c,color=color,name="colonizationRate"}) then
                broadcastToAll("[==> "..getPlayerName(color).." increase Colonization Rate "..c.." steps ]",self.getColorTint())
            end
        elseif r == "MiningRate" then
            if getBoard("Luna").call("moveTrack",{step=c,color=color,name="miningRate"}) then
                broadcastToAll("[==> "..getPlayerName(color).." increase Mining Rate "..c.." steps ]",self.getColorTint())
            end
        else
            if c > 0 then
                local pos = getCardPlayTable(color).positionToWorld(Vector(0,1,-2.7))
                if getBag(r) != nil and getBag(r) != Global then
                    for i=1,c do
                        if getBag(r).getQuantity() >= 1 then
                            getBag(r).takeObject({position = pos})
                        end
                    end
                    broadcastToAll("[==> "..getPlayerName(color).." get "..c.." ("..r..") ]",self.getColorTint())
                else
                    broadcastToAll("[==> "..getPlayerName(color).." must take "..c.." ("..r..") ]",self.getColorTint())
                end
            elseif c < 0 then
                broadcastToAll("[==> "..getPlayerName(color).." must pay "..(c*-1).." ("..r..") ]",self.getColorTint())
            end
        end
    end
end

function discardCards(cards)
    local count = 0
    --THIS LOOP IS FOR GET THE CORRECT DISCARD PILE
    for i,t in ipairs(cards.getTags()) do
        if t != "Card" then
            if cards.type == "Deck" then
                count = count + #cards.getObjects()
            else
                count = count + 1
            end
            local crotation = cards.getRotation()
            cards.setPositionSmooth(getDiscardHolder(t).getPosition() + Vector(0,5,0))
            --fix make calculation for relative rotation
            cards.setRotationSmooth({0,180,crotation.z})
            return count
        end
    end
    return count
end
function playCard(card)
    if payMC() then
        local total = mcToPayTotal + stToPayTotal*stPriceTotal + tiToPayTotal*tiPriceTotal + optToPayTotal
        broadcastToAll(getPlayerName(self.getColorTint():toString()).. " play \"" .. card.getName() .."\" paying " .. total .. " with "..mcToPayTotal.." (MC), "..stToPayTotal.."(St), "..tiToPayTotal.."(Ti),"..optToPayTotal.."("..optResourcteType..")",self.getColorTint())
        applyTags(getTags(card))
        applyVps(card)
        applyDiscounts(card)
        applyProduction(getProductions(card))
        applyResources(getResources(card),card)

        local tagList = getTags(card)
        if tagList != nil then
            for i,tag in ipairs(tagList) do
                broadcastToAll("Tag play: " .. tag )
            end
        end

        return true
    end
    return false
end

function payMC()
    local mcAvaliable =  getPlayerBoard(self.getColorTint():toString()).call("getResourceCount",{resource ="MC"})
    local stAvaliable =  getPlayerBoard(self.getColorTint():toString()).call("getResourceCount",{resource ="St"})
    local tiAvaliable =  getPlayerBoard(self.getColorTint():toString()).call("getResourceCount",{resource ="Ti"})
    optResourceType = self.getButtons()[6].tooltip
    local optAvaliable = optToPayTotal
    if optResourceType == "En" then
        optAvaliable =  getPlayerBoard(self.getColorTint():toString()).call("getResourceCount",{resource ="En"})
    elseif optResourceType == "He" then
        optAvaliable =  getPlayerBoard(self.getColorTint():toString()).call("getResourceCount",{resource ="He"})
    elseif optResourceType == "Pl" then
        optAvaliable =  getPlayerBoard(self.getColorTint():toString()).call("getResourceCount",{resource ="Pl"})
    elseif optResourceType == "R" then
        optAvaliable = optToPayTotal
    end
    if mcAvaliable < mcToPayTotal or stAvaliable < stToPayTotal or tiAvaliable < tiToPayTotal or optAvaliable < optToPayTotal then
        broadcastToColor("You have not enough resource to Pay!", self.getColorTint():toString(),self.getColorTint())
        return false
    end
    payResource("MC",mcToPayTotal)
    payResource("St",stToPayTotal)
    payResource("Ti",tiToPayTotal)
    if optResourceType == "En" then
        payResource("En",optToPayTotal)
    elseif optResourceType == "He" then
        payResource("He",optToPayTotal)
    elseif optResourceType == "Pl" then
        payResource("Pl",optToPayTotal)
    end
    return true
end

function payResource(resource,toPaid)
    if toPaid == 0 then
        return
    end
    getPlayerBoard(self.getColorTint():toString()).call("payResource",{resource=resource,value=toPaid})
end

function onDestroy()
    local zoneD = zone
    if zoneD != nil then
        destroyObject(zoneD)
    end
end
function onLoad(save_state)
    local state = "setup"
    if save_state != nil and save_state != '' then
        local json = JSON.decode(save_state)
        if json.myId == self.getGUID() then
            local obj = getObjectFromGUID(json.zoneGUID)
            if obj != nil then
                obj.destruct()
            end
        end
        if json.state != nil then
            state = json.state
        end
    end

    zone = spawnObject({
        type              = "ScriptingTrigger",
        position          = self.positionToWorld(Vector(0,0.3,0.25)),
        rotation          = self.getRotation(),
        scale             = Vector(2.83,0.5,4.03),
        callback_function = function(obj) obj.addTag("Card") end,
    })

    --print(obj.getGUID())
    mcToPayConf = {
        index = 0, click_function = 'mcToPay', function_owner = self, label = tostring(mcToPayTotal),
        position = {-0.28,0.12,-0.5}, width = 700, height = 360, font_size = 360,font_color={152/255,55/255,57/255,100},color={253/255, 231/255, 46/255,0.95},scale={x=0.125, y=0.125, z=0.125}
    }
    stToPayConf = {
        index = 1, click_function = 'stToPay', function_owner = self, label = tostring(stToPayTotal),
        position = {0,0.12,-0.5}, width = 700, height = 360, font_size = 360,font_color={75/255,53/255,40/255,100},color={153/255,103/255,66/255,0.95},scale={x=0.125, y=0.125, z=0.125}
    }
    tiToPayConf = {
        index = 2, click_function = 'tiToPay', function_owner = self, label = tostring(tiToPayTotal),
        position = {0.28,0.12,-0.5}, width = 700, height = 360, font_size = 360,font_color={253/255,231/255,5/255,0.9},color={67/255,67/255,67/255,0.95},scale={x=0.125, y=0.125, z=0.125}
    }
    stPriceConf = {
        index = 3, click_function = 'stPrice', function_owner = self, label = tostring(stPriceTotal),
        position = {0,0.12,-0.76}, width = 700, height = 360, font_size = 360,font_color={75/255,53/255,40/255,100},color={153/255,103/255,66/255,0.95},scale={x=0.125, y=0.125, z=0.125}
    }
    tiPriceConf = {
        index = 4, click_function = 'tiPrice', function_owner = self, label = tostring(tiPriceTotal),
        position = {0.28,0.12,-0.76}, width = 700, height = 360, font_size = 360,font_color={253/255,231/255,5/255,0.9},color={67/255,67/255,67/255,0.95},scale={x=0.125, y=0.125, z=0.125}
    }

    optToPayConf = {
        index = 5, click_function = 'optToPay', function_owner = self, label = tostring(optToPayTotal),
        position = {0.5,0.12,-0.5}, width = 700, height = 360, font_size = 360,font_color={0,0,0,100},color={1,1,1,0.95},scale={x=0.125, y=0.125, z=0.125}
    }
    PayConf = {
        index = 7, click_function = 'setupCorp', function_owner = self, label = "setup",
        position = {-0.5,0.12,0.9}, width = 700, height = 400, font_size = 200,font_color={0,0,0,100},color={236/255,96/255,51/255,0.95},scale={x=0.125, y=0.125, z=0.125}
    }
    if state != "setup" then
        PayConf.label="play"
        PayConf.click_function='play'
    end
    discardSetup = {
        index = 8, click_function = 'discardResearch', function_owner = self, label = "discard research",
        position = {0.5,0.12,0.9}, width = 1100, height = 400, font_size = 150,font_color={0,0,0,100},color={236/255,96/255,51/255,0.95},scale={x=0.125, y=0.125, z=0.125}
    }

    projectType = {
        index = 6, click_function = 'cleanState', function_owner = self, label = "Project",
        position = {0,0.12,-0.9}, width = 2500, height = 400, font_size = 250,font_color={0,0,0,100},color={253/255, 180/255, 46/255,0.95},scale={x=0.125, y=0.125, z=0.125}
    }

    self.createButton(mcToPayConf)
    self.createButton(stToPayConf)
    self.createButton(tiToPayConf)
    self.createButton(stPriceConf)
    self.createButton(tiPriceConf)
    self.createButton(optToPayConf)
    self.createButton(projectType)
    self.createButton(PayConf)

    loadingGame = false
    --self.createButton(discardSetup)
end

function onSave()
    local data_to_save = {zoneGUID = zone.getGUID(),myId=self.getGUID(),state=PayConf.label}
    save_state = JSON.encode(data_to_save)
    return save_state
end
function onDrop()
    Wait.condition(function() zone.setPosition(self.positionToWorld(Vector(0,0.3,0.25)));zone.setRotation(self.getRotation()); end, function() return self.resting end)
end

function enablePlay()
    PayConf.click_function = 'play'
    PayConf.label="play"
    self.editButton({index=PayConf.index,click_function='play',label="play"})
end

function enableSetupCorp()
    PayConf.click_function = 'setupCorp'
    PayConf.label="setup"
    self.editButton({index=PayConf.index,click_function='setupCorp',label="setup"})
end

function enableDiscard()
    PayConf.click_function = 'discard'
    PayConf.label="discard"
    self.editButton({index=PayConf.index,click_function='discard',label="discard"})
end
function disableDiscardForMC()
    if #self.getButtons() == 9 and not isDiscardResearch then
        self.removeButton(8)
    end
end

function disableDiscardResearch()
    if #self.getButtons() == 9 and isDiscardResearch then
        self.removeButton(8)
        isDiscardResearch = false
    end
end
function enableDiscardForMC()
    if #self.getButtons() < 9 then
        isDiscardResearch=false
        self.createButton(discardSetup)
        self.editButton({index=discardSetup.index,click_function='discardForMC',label="discard x MC"})
    end
end
function enableDiscardResearch(numCards)
    if #self.getButtons() < 9 then
        self.createButton(discardSetup)
    end
    researchCards = numCards
    isDiscardResearch=true
    self.editButton({index=discardSetup.index,click_function='discardResearch',label="discard research"})
end

function discard(obj,player_clicker_color,alt_click)
    local objs = zone.getObjects()
    if #objs == 1 and objs[1].hasTag("Card") then
        if isDiscardResearch and objs[1].hasTag("Project") then
            discardResearch(obj,player_clicker_color,alt_click)
            return
        end
        local dcount = discardCards(objs[1])
        if dcount > 0 then
            broadcastToAll("< "..getPlayerName(self.getColorTint():toString()).." discard "..dcount.." cards >",self.getColorTint())
            enablePlay()
            disableDiscardForMC()
        end
    end
end
function discardForMC(obj,player_clicker_color,alt_click)
    local objs = zone.getObjects()
    if #objs == 1 and objs[1].hasTag("Card") then
        local dcount = discardCards(objs[1])
        if dcount > 0 then
            getPlayerBoard(self.getColorTint():toString()).call("addResource",{resource="MC",value=dcount})
            broadcastToAll("< "..getPlayerName(self.getColorTint():toString()).." discard "..dcount.." cards for a total of "..  dcount .." (MC) >",self.getColorTint())
        end
    end
    enablePlay()
    disableDiscardForMC()
end
function discardResearch(obj,player_clicker_color,alt_click)
    local objs = zone.getObjects()
    local dcount = 0
    if #objs == 1 and objs[1].hasTag("Card") then
        dcount = discardCards(objs[1])
    end
    getPlayerBoard(self.getColorTint():toString()).call("payResource",{resource="MC",value=(researchCards - dcount)*3})
    broadcastToAll("< "..getPlayerName(self.getColorTint():toString()).." pay for "..(researchCards - dcount).." cards in research a total of ".. (researchCards - dcount)*3 .." (MC) >",self.getColorTint())
    disableDiscardResearch()
end

function cleanState()
    mcToPayTotal = 0
    stToPayTotal = 0
    tiToPayTotal = 0
    optToPayTotal = 0
    projectProd = {}
    projectTags = {}
    projectRsrc = {}
    projectCostChange = {}
    self.editButton({index=mcToPayConf.index,label=tostring(mcToPayTotal)})
    self.editButton({index=stToPayConf.index,label=tostring(stToPayTotal)})
    self.editButton({index=tiToPayConf.index,label=tostring(tiToPayTotal)})
    self.editButton({index=optToPayConf.index,label=tostring(optToPayTotal)})
    projectType.label = "Project"
    self.editButton({index=projectType.index,label=projectType.label})
    enablePlay()
    disableDiscardForMC()
end
function play(obj,player_clicker_color,alt_click)
    local objs = zone.getObjects()
    if #objs == 1 and objs[1].type != "Deck" then
        if playCard(objs[1]) then
            cleanState()
        end
    elseif #objs == 0 then
        if payStandardProject() then
            cleanState()
        end
    else
        --THROW WARN
        log("THERE ARE MORE THAN ONE CARD ON PLACE")
    end
end

function setCardToPlay(card)
    local cost = getCost(card)
    if cost > 0 then
        local discount = getTagTable(self.getColorTint():toString()).call("calculateDiscount",{tags = getTags(card),color=self.getColorTint():toString()})
        local finalCost = cost + discount
        if finalCost > 0 then
            mcToPayTotal = tonumber(finalCost)
        else
            mcToPayTotal = 0
        end
    else
        mcToPayTotal = 0
    end
    self.editButton({index=mcToPayConf.index,label = tostring(mcToPayTotal) })
end

function setCardInfraToPlay(card)
    local cost = getAltCost(card)
    if cost["Ti"] != nil and cost["Ti"]  > 0 then
        tiToPayTotal = cost["Ti"]
        self.editButton({index=tiToPayConf.index,label = tostring(tiToPayTotal) })
    end

end

function setupCorp(obj,player_clicker_color,alt_click)
    local objs = zone.getObjects()
    if #objs == 1 and objs[1].hasTag("Card") and objs[1].hasTag("Corp") then
        local corp = objs[1]
        broadcastToAll(getPlayerName(self.getColorTint():toString()).." play \""..corp.getName().."\" corporation",self.getColorTint())
        applyVps(corp)
        applyProduction(getProductions(corp))
        applyResources(getResources(corp))
        applyDiscounts(corp)
        local tags = getTags(corp)
        getTagTable(self.getColorTint():toString()).call("addTags",{tags = tags})
        getBoard("PathFinders").call("addTags",{tags = tags,color=toLColor(self.getColorTint())})
        for i,tag in ipairs(tags) do
            broadcastToAll("Tag play: " .. tag )
        end

        enableDiscard()
        --enablePlay()
        enableDiscardResearch(10)
    end

end

function onCollisionEnter(collision_info)
    if collision_info == nil or loadingGame then
        --UGLY A BUG HERE OF ENGINE
        return
    end
    local obj = collision_info.collision_object
    if (obj.hasTag("Card") or obj.type == "Deck" ) then
        if obj.hasTag("Project") then
            if obj.is_face_down == true then
                --if isDiscardResearch  then
                --    return
                --end
                enableDiscard()
                enableDiscardForMC()
                return
            else
                enablePlay()
                disableDiscardForMC()
                setCardToPlay(obj)
            end
        elseif obj.hasTag("Corp") then
            if obj.is_face_down == true then
                enableDiscard()
                disableDiscardForMC()
                return
            else
                enableSetupCorp()
                disableDiscardForMC()
            end
        elseif obj.hasTag("Prelude") then
            disableDiscardForMC()
            if obj.is_face_down == true then
                enableDiscard()
                return
            else
                enablePlay()
                setCardToPlay(obj)
            end
        elseif obj.hasTag("Infrastructure") then
            if obj.is_face_down == true then
                --if isDiscardResearch  then
                --    return
                --end
                --enableDiscard()
                --enableDiscardForMC()
                return
            else
                enablePlay()
                disableDiscardForMC()
                setCardInfraToPlay(obj)
            end
        end
    end
end

function onCollisionExit(collision_info)
    if loadingGame then
        return
    end
    local obj = collision_info.collision_object
    if (obj.hasTag("Card") or obj.type == "Deck" ) then
         cleanState()
    end
end

function tiPrice(obj,player_clicker_color,alt_click)
    if alt_click then
        if tiPriceTotal > 0 then
            tiPriceTotal = tiPriceTotal - 1
        else
            tiPriceTotal = 0
        end
    else
        tiPriceTotal = tiPriceTotal + 1
    end
    tiPriceConf.label = tostring(tiPriceTotal)
    self.editButton(tiPriceConf)
end

function stPrice(obj,player_clicker_color,alt_click)
    if alt_click then
        if stPriceTotal > 0 then
            stPriceTotal = stPriceTotal - 1
        else
            stPriceTotal = 0
        end
    else
        stPriceTotal = stPriceTotal + 1
    end
    stPriceConf.label = tostring(stPriceTotal)
    self.editButton(stPriceConf)
end

function tiToPay(obj,player_clicker_color,alt_click)
    if alt_click then
        if tiToPayTotal > 0 then
            mcToPayTotal = mcToPayTotal + tiPriceTotal
            tiToPayTotal = tiToPayTotal - 1
        else
            tiToPayTotal = 0
        end
    else
        tiToPayTotal = tiToPayTotal + 1
        mcToPayTotal = mcToPayTotal - tiPriceTotal
        if mcToPayTotal < 0 then
            mcToPayTotal = 0
        end
    end
    tiToPayConf.label = tostring(tiToPayTotal)
    mcToPayConf.label = tostring(mcToPayTotal)
    self.editButton(mcToPayConf)
    self.editButton(tiToPayConf)
end

function stToPay(obj,player_clicker_color,alt_click)
    if alt_click then
        if stToPayTotal > 0 then
            mcToPayTotal = mcToPayTotal + stPriceTotal
            stToPayTotal = stToPayTotal - 1
        else
            stToPayTotal = 0
        end
    else
        stToPayTotal = stToPayTotal + 1
        mcToPayTotal = mcToPayTotal - stPriceTotal
        if mcToPayTotal < 0 then
            mcToPayTotal = 0
        end
    end
    stToPayConf.label = tostring(stToPayTotal)
    mcToPayConf.label = tostring(mcToPayTotal)
    self.editButton(mcToPayConf)
    self.editButton(stToPayConf)
end

function optToPay(obj,player_clicker_color,alt_click)
    if alt_click then
        if optToPayTotal > 0 then
            mcToPayTotal = mcToPayTotal + 1
            optToPayTotal = optToPayTotal - 1
        else
            optToPayTotal = 0
        end
    else
        optToPayTotal = optToPayTotal + 1
        mcToPayTotal = mcToPayTotal - 1
        if mcToPayTotal < 0 then
            mcToPayTotal = 0
        end
    end
    optToPayConf.label = tostring(optToPayTotal)
    mcToPayConf.label = tostring(mcToPayTotal)
    self.editButton(mcToPayConf)
    self.editButton({index=optToPayConf.index,label=optToPayConf.label})
end

function mcToPay(obj, player_clicker_color, alt_click)
    if alt_click then
        if mcToPayTotal > 0 then
            mcToPayTotal = mcToPayTotal - 1
        else
            mcToPayTotal = 0
        end
    else
        mcToPayTotal = mcToPayTotal + 1
    end
    mcToPayConf.label = tostring(mcToPayTotal)
    self.editButton(mcToPayConf)
end

function setProject(params)
  cleanState()
  local label = params.label
  local cost = params.cost["MC"] or 0
  projectProd = params.prod or {}
  projectRsrc = params.rsrc or {}
  projectTags = params.tags or {}
  projectCostChange = params.costChange or {}
  projectType.label = label
  self.editButton({index=projectType.index,label=projectType.label})
  mcToPayTotal=cost
  self.editButton({index=mcToPayConf.index,label = tostring(mcToPayTotal) })
  tiToPayTotal=params.cost["Ti"] or 0
  self.editButton({index=tiToPayConf.index,label = tostring(tiToPayTotal) })
  stToPayTotal=params.cost["St"] or 0
  self.editButton({index=stToPayConf.index,label = tostring(stToPayTotal) })
  for i,a in pairs(params.cost) do
    if i != "MC" and i != "Ti" and i != "St" then
      local optR = getOptionalResource(self.getColorTint():toString())
      if optR.getName() != i then
        getOptionalResource(self.getColorTint():toString()).call("changeToState",{resource=i})
      end
      optToPayTotal=a or 0
      self.editButton({index=optToPayConf.index,label = tostring(optToPayTotal) })
      break
    end
  end
end

function payStandardProject()
    if payMC() then
        local total = mcToPayTotal + stToPayTotal*stPriceTotal + tiToPayTotal*tiPriceTotal + optToPayTotal
        broadcastToAll(getPlayerName(self.getColorTint():toString()).. " play " .. projectType.label .." paying " .. total .. " with "..mcToPayTotal.." (MC), "..stToPayTotal.."(St), "..tiToPayTotal.."(Ti),"..optToPayTotal.."("..optResourcteType..")",self.getColorTint())
        --broadcastToAll(getPlayerName(self.getColorTint():toString()).. " play \"" .. card.getName() .."\" paying " .. total .. " with "..mcToPayTotal.." (MC), "..stToPayTotal.."(St), "..tiToPayTotal.."(Ti),"..optToPayTotal.."("..optResourcteType..")",self.getColorTint())
        --applyTags(card)
        --applyVps(card)
        --applyDiscounts(card)
        applyProduction(projectProd)
        applyResources(projectRsrc)
        if #projectTags > 0 then
            applyTags(projectTags)
            for i,tag in ipairs(projectTags) do
                broadcastToAll(getPlayerName(self.getColorTint():toString()).." gets tag " .. tag )
            end
            --getTagTable(self.getColorTint():toString()).call("addTags",{tags = projectTags})
        end



        return true
    end
    return false
end

function incPrice(params)
    local resource = params.rsrc
    local delta = params.delta
    if resource == "Ti" then
        tiPriceTotal = tiPriceTotal + delta
        self.editButton({index=tiPriceConf.index,label = tostring(tiPriceTotal) })
    elseif resource == "St" then
        tiPriceTotal = tiPriceTotal + delta
        self.editButton({index=tiPriceConf.index,label = tostring(tiPriceTotal) })        
    end
end