require("../UTIL/CubeUtils")
require("../UTIL/Utility")

prodZonesGUID={}
resZonesGUID={}
textGUID={}
TICKNES=0.2
TEXT_Y=TICKNES+0.01
prodZones = {
    MC = {zone=nil,pos_local=Vector(0.85,0.76,-0.17),scale=Vector(3.68,1.13,2.64),prodSnapIndex= {15,16,17,18,19,14,13,12,11,10,5,6,7,8,9},prodSnapMulti={4,3,2,1}},
    St = {zone=nil,pos_local=Vector(-0.06,0.76,-0.11),scale=Vector(3.75,1.13,1.59),prodSnapIndex={24,23,22,21,20,27,28,29,30,31},prodSnapMulti={26,25}},
    Ti = {zone=nil,pos_local=Vector(-0.87,0.76,-0.11),scale=Vector(3.75,1.13,1.59),prodSnapIndex={34,35,36,37,38,43,42,41,40,39},prodSnapMulti={32,33}},
    Pl = {zone=nil,pos_local=Vector(0.82,0.76,0.72),scale=Vector(3.75,1.13,1.59),prodSnapIndex={47,48,51,52,55,46,49,50,53,54},prodSnapMulti={44,45}},
    En = {zone=nil,pos_local=Vector(-0.06,0.76,0.72),scale=Vector(3.75,1.13,1.59),prodSnapIndex={59,60,63,64,67,58,61,62,65,66},prodSnapMulti={57,56}},
    He = {zone=nil,pos_local=Vector(-0.86,0.76,0.72),scale=Vector(3.75,1.13,1.59),prodSnapIndex={79,78,77,76,75,70,71,72,73,74},prodSnapMulti={69,68}}
}
resZones = {
    Pl = {zone=nil,pos_local=Vector(0.82,2.85,0.32),rot_delta=Vector(0,180,0),scale=Vector(5,5.1,1.76),text=nil,text_pos_local=Vector(0.77745,TEXT_Y, 0.9052)},
    En = {zone=nil,pos_local=Vector(-0.06,2.85,0.32),rot_delta=Vector(0,180,0),scale=Vector(3.6,5.1,1.71),text=nil,text_pos_local=Vector(-0.09125,TEXT_Y, 0.9052)},
    He = {zone=nil,pos_local=Vector(-0.85,2.85,0.32),rot_delta=Vector(0,180,0),scale=Vector(4.43,5.1,1.73),text=nil,text_pos_local=Vector(-0.9855,TEXT_Y,0.9052)},
    MC = {zone=nil,pos_local=Vector(0.64,2.85,-0.69),rot_delta=Vector(0,180,0),scale=Vector(7.02,5.1,3.04),text=nil,text_pos_local=Vector(0.59495,TEXT_Y,-0.99645)},
    Ti = {zone=nil,pos_local=Vector(-0.95,2.85,-0.63),rot_delta=Vector(0,168,0),scale=Vector(3.28,5.1,2.74),text=nil,text_pos_local=Vector(-0.99645,TEXT_Y, -0.99645)},
    St = {zone=nil,pos_local=Vector(-0.33,2.85,-0.64),rot_delta=Vector(0,167,0),scale=Vector(2.54,5.1,3.15),text=nil,text_pos_local=Vector(-0.365,TEXT_Y,-0.99645)}
}

bagsGUID = {
    GOLD = "",
    SILVER = "",
    COPER = "",
    CUBE = "",
    ANIMAL = ""
}
bags = {}

DELTA = 0.00001

COLORS ={
    WARN = {238/255,210/255,2/255,1},
    ERROR = {1,0,0,1},
    SUCCESS = {0,1,0,1},
    WHITE = {1,1,1,1}
}

--CREATE OBJECT FUNCTIONS
myId=nil

function getSingleObject(tags)
    local objs=getObjectsWithAllTags(tags)
    if objs!= nil and #objs == 1 then
        return objs[1]
    elseif objs!= nil then
        log("Object is not unique for tags")
        return objs[1]
    end
    return nil
end
function getObject(map,key,tags)
    if map[key] == nil then
        local obj = getSingleObject(tags)
        if obj != nil then
            map[key] = obj
        else
            log("ERROR GET OBJECT: "..key)
            return Global
        end
    end
    return map[key]
end

CARD_PLAY_TABLES={}
function getCardPlayTable(color)
    return getObject(CARD_PLAY_TABLES,color,{"CardPlayTable",color})
end

function getBag(type)
    if not bags[type] then
        local objs=getObjectsWithAllTags({self.getColorTint():toString(),"Bag",type})
        if #objs == 1 then
            bags[type]=objs[1]
        elseif #objs > 1 then
            log("Object is not unique for tags")
            bags[type]=objs[1]
        end
    end
    return bags[type]
end
function i_getProduction(resource)
    local value = 0
    local prodZone = prodZones[resource]
    local base = #prodZone.prodSnapIndex - 9
    for _,obj in pairs(prodZone.zone.getObjects()) do
            local match = false
            for i,snapIndex in pairs(prodZone.prodSnapIndex) do
                if Vector.sqrDistance(twoDimPos(self.getSnapPoints()[snapIndex].position),twoDimPos(self.positionToLocal(obj.getPosition()))) < DELTA then
                    value = value + (i - base)
                    match = true
                    break
                end
            end
            for i,snapIndex in pairs(prodZone.prodSnapMulti) do
                if Vector.sqrDistance(twoDimPos(self.getSnapPoints()[snapIndex].position),twoDimPos(self.positionToLocal(obj.getPosition()))) < DELTA then
                    value = value + i*10
                    match = true
                    break
                end
            end
            if not match then
                local pp = obj.getPosition()
                broadcastToAll("<< PRODUCTION CUBE MARKER "..self.getColorTint():toString().." WITH PROBLEM  AT "..resource.." WITH ID "..obj.getGUID().." AND POSITION ".."("..pp.x..","..pp.y..","..pp.z..")>>",COLORS.WARN)

            end
    end
    return value
end

function i_setProduction(resource,value)
    local prodZone = prodZones[resource]
    local cubes = prodZone.zone.getObjects()
    local indexCube = #cubes
    local total = value
    for i = #prodZone.prodSnapMulti,1,-1 do
        local n = math.floor(total/(i*10))
        if n > 0 then
            local delay = 10
            for j=1,n do
                local cube = nil
                if indexCube > 0 then
                    cube = cubes[indexCube]
                    indexCube = indexCube - 1
                else
                    cube = getBag("Token").takeObject()
                end
                Wait.frames(function() cube.setPositionSmooth(self.positionToWorld(self.getSnapPoints()[prodZone.prodSnapMulti[i]].position)+Vector(0,1,0)) end,delay)
                delay = delay + 20
                total = total - i*10
            end
        end
    end
    local cube = nil
    if indexCube > 0 then
        cube = cubes[indexCube]
        indexCube = indexCube - 1
    else
        cube = getBag("Token").takeObject()
    end
    cube.setPositionSmooth(self.positionToWorld(self.getSnapPoints()[prodZone.prodSnapIndex[total + #prodZone.prodSnapIndex - 9]].position)+Vector(0,1,0))
    while indexCube > 0 do
        getBag("Token").putObject(cubes[indexCube])
        indexCube = indexCube - 1
    end
end

function i_updateZones()
    for rsrc,pzone in pairs(prodZones) do
        pzone.zone.setPosition(self.positionToWorld(pzone.pos_local))
        pzone.zone.setRotation(self.getRotation())
        resZones[rsrc].zone.setPosition(self.positionToWorld(resZones[rsrc].pos_local))
        resZones[rsrc].zone.setRotation(self.getRotation()-resZones[rsrc].rot_delta)
        resZones[rsrc].text.setPosition(self.positionToWorld(resZones[rsrc].text_pos_local))
        resZones[rsrc].text.setRotation(Vector(90,180,0)+self.getRotation())
    end
end

function i_countTotal(zone)
    local list = groupCubes(zone)
    return #list["C"] + #list["S"]*5 + #list["G"]*10
end

function i_takeCoper(n,zone)
    pileCubes(n,3,2.2,0.25,getBag("Copper"),zone)
end

function i_takeSilver(n,zone)
    pileCubes(n,2,1.42,0.33,getBag("Silver"),zone)
end

function i_takeGold(n,zone)
    pileCubes(n,2,0.52,0.4,getBag("Gold"),zone)
end

function i_takeResource(n,resource)
    if resZones[resource] != nil then
        i_takeGold(math.floor(n/10),resZones[resource].zone)
        i_takeSilver(math.floor((n%10)/5),resZones[resource].zone)
        i_takeCoper((n%10)%5,resZones[resource].zone)
    else
        local pos = getCardPlayTable(self.getColorTint():toString()).positionToWorld(Vector(0,1,-2.2))
        for i=1,n do
            getBag(resource).takeObject({position = pos})
        end
    end
end

function i_incProd(resource,steps)
    local total = i_getProduction(resource)
    total = total + steps
    if resource != "MC" and total < 0 then
        log("<<Error Try decrement production "..resource..">>")
        return false
    elseif resource == "MC" and total < -5 then
        log("<<Error Try decrement production "..resource..">>")
        --broadcastToAll("<<Error Try decrement production "..resource..">>",COLORS.WARN)
        return false
    end
    i_setProduction(resource,total)
    return true
end

function i_moveEnergy()
    local total = i_countTotal(resZones.En.zone)
    i_payResource(total,"En")
    i_takeResource(total,"He")
end

function i_payResource(n,resource)
    if resZones[resource] == nil then
        --PAY NOR STANDARD RESOURCE
        return false
    end
    local list = groupCubes(resZones[resource].zone)
    local gn = #list["G"]
    local sn = #list["S"]
    local cn = #list["C"]
    if n <= cn + sn*5 + gn*10 then
        local gnp = math.floor(n/10)
        local snp = math.floor((n%10)/5)
        local cnp = (n%10)%5
        --try to save money
        if gnp > 0 and (cnp + 10  <= cn) then
            cnp = cnp + 10
            gnp = gnp - 1
        end
        if snp > 0 and (cnp + 5 <= cn) then
            cnp = cnp + 5
            snp = snp - 1
        end

        if gnp > gn then
            snp = snp + (gnp - gn)*2
            gnp = gn
            if snp > sn then
                cnp = cnp + (snp - sn)*5
                snp = sn
            end
        end
        gne = gn - gnp
        if snp > sn then
            while gne > 0 and snp > sn do
                snp = snp - 2
                gne = gne - 1
                gnp = gnp + 1
            end
        end
        sne = sn - snp

        if cnp > cn then
            while sne > 0 and cnp > cn do
                cnp = cnp - 5
                sne = sne - 1
                snp = snp + 1
            end
            while gne > 0 and cnp > cn do
                gne = gne - 1
                cnp = cnp - 10
                gnp = gnp + 1
            end
            while cnp <= -5 do
                cnp = cnp + 5
                snp = snp - 1
            end
        end
        if gnp*10 + snp*5 + cnp != n then
            broadcastToAll("<<ERROR: payment aborted >>",COLORS.ERROR)
            return false
        end
        while cnp > 0 do
            getBag("Copper").putObject(list["C"][cnp])
            cnp = cnp - 1
        end
        while snp > 0 do
            getBag("Silver").putObject(list["S"][snp])
            snp = snp - 1
        end
        while gnp > 0 do
            getBag("Gold").putObject(list["G"][gnp])
            gnp = gnp - 1
        end
        i_takeCoper(cnp*-1,resZones[resource].zone)
        i_takeSilver(snp*-1,resZones[resource].zone)
        i_takeGold(gnp*-1,resZones[resource].zone)
        return true
    end
    return false
end

function i_produceAll(tr)
    local delta = 20
    for i,_ in pairs(resZones) do
        local n = i_getProduction(i)
        if i == "MC" then
            n = n + (tr or 0 )
        end
        Wait.frames(function() i_takeResource(n,i) end,delta)
        delta = delta + 30
    end
end

function i_countResource(resource)
    return i_countTotal(resZones[resource].zone)
end

--IMPLEMENT IPlayerBoard
function getProduction(params)
    return i_getProduction(params.resource)
end

function setProduction(params)
    i_setProduction(params.resource,params.value)
end

function moveProduction(params)
    return i_incProd(params.resource,params.step)
end

function energyToHeat()
    i_moveEnergy()
end

function payResource(params)
    return i_payResource(params.value,params.resource)
end

function addResource(params)
    i_takeResource(params.value,params.resource)
end

function getResourceCount(params)
    return i_countResource(params.resource)
end

function produceAll(params)
    i_produceAll(params.tr)
end

--TTS functions
function onDrop()
    Wait.condition(function() i_updateZones() end, function() return self.resting end)
end

function onLoad(save_state)
    if save_state != nil and save_state != '' then
        local json = JSON.decode(save_state)
        prodZonesGUID = json.prodZonesGUID
        resZonesGUID = json.resZonesGUID
        textGUID = json.textGUID
        myId=json.myId
        for rsrc,pzone in pairs(prodZones) do
            if(myId == self.getGUID()) then
                if getObjectFromGUID(prodZonesGUID[rsrc]) != nil then
                    getObjectFromGUID(prodZonesGUID[rsrc]).destruct()
                    getObjectFromGUID(resZonesGUID[rsrc]).destruct()
                    getObjectFromGUID(textGUID[rsrc]).destruct()
                end
            end
        end
    end
        for rsrc,pzone in pairs(prodZones) do
            pzone.zone=spawnObject({
                type              = "ScriptingTrigger",
                position = self.positionToWorld(pzone.pos_local),
                scale = pzone.scale,
                rotation = self.getRotation(),
                callback_function=function(obj) obj.addTag("PlayerCube") end,
            })
            resZones[rsrc].zone=spawnObject({
                type              = "ScriptingTrigger",
                position = self.positionToWorld(resZones[rsrc].pos_local),
                scale = resZones[rsrc].scale,
                rotation = self.getRotation()-resZones[rsrc].rot_delta,
                callback_function=function(obj) obj.setTags({"Gold","Silver","Copper"}) end,
            })
            resZones[rsrc].text=spawnObject({
                type              = "3DText",
                position = self.positionToWorld(resZones[rsrc].text_pos_local),
                rotation = Vector(90,180,0)+self.getRotation(),
                callback_function = function(obj) obj.TextTool.setFontSize(42);obj.TextTool.setFontColor({0,0,0,1});obj.setValue(tostring(i_countTotal(resZones[rsrc].zone))) end
            })

        end
        --for i,a in pairs(bagsGUID) do
        --    bags[i] = getObjectFromGUID(a)
        --end
        greeneryButton = {
            index = 0, click_function = 'putGreenery', function_owner = self, label = "",
            position = {-0.6,0.2,0.38}, width = 70, height = 70, font_size = 70,font_color={0,0,0,100},color={1,1,1,0},tooltip="Greenery"
        }
        temperatureButton = {
            index = 1, click_function = 'incTemperature', function_owner = self, label = "",
            position = {1.063,0.2,0.38}, width = 70, height = 70, font_size = 70,font_color={0,0,0,100},color={1,1,1,0},tooltip="Temperature"
        }
        --sVector(0.77745,TEXT_Y, 0.9052)
        self.createButton(greeneryButton)
        self.createButton(temperatureButton)
end


function incTemperature()
  setStandardProject(self.getColorTint():toString(),"Heat to Temperature",{He=8},{},{Temperature=1})
end

function putGreenery()
    setStandardProject(self.getColorTint():toString(),"Plants to Greenery",{Pl=8},{},{Greenery=1})
end

autoSaveCount=0
function onSave()
    autoSaveCount = autoSaveCount + 1
    --if autoSaveCount > 6 then
        for rsrc,pzone in pairs(prodZones) do
            prodZonesGUID[rsrc] = pzone.zone.getGUID()
            resZonesGUID[rsrc] = resZones[rsrc].zone.getGUID()
            textGUID[rsrc] = resZones[rsrc].text.getGUID()
        end
        local data_to_save = {prodZonesGUID=prodZonesGUID,resZonesGUID=resZonesGUID,textGUID=textGUID,myId=self.getGUID()}
        save_state = JSON.encode(data_to_save)
        --autoSaveCount = 0
        return save_state
    --end
end

function onObjectEnterScriptingZone(zone, enter_object)
        for i,resZone in pairs(resZones) do
            if resZone.zone == zone then
                Wait.condition(function() resZone.text.setValue(tostring(i_countTotal(resZone.zone))) end, function() return enter_object==nil or enter_object.resting end)
                break
            end
        end
end

function onObjectLeaveScriptingZone(zone, leave_object)
        for i,resZone in pairs(resZones) do
            if resZone.zone == zone then
                Wait.condition(function() resZone.text.setValue(tostring(i_countTotal(resZone.zone))) end, function() return leave_object==nil or leave_object.resting end)
                break
            end
        end
end


function onDestroy()
    local resZonesD=resZones
    local prodZonesD=prodZones
    for rsrc,pzone in pairs(prodZonesD) do
        if resZonesD[rsrc].text != nil then
            destroyObject(resZonesD[rsrc].text)
        end
        if resZonesD[rsrc].zone != nil then
            destroyObject(resZonesD[rsrc].zone)
        end
        if pzone.zone != nil then
            destroyObject(pzone.zone)
        end
    end
end
--function onDestroy()
--    preDestroy()
--end


--function onCollisionEnter(collision_info)
    -- collision_info table:
    --   collision_object    Object
    --   contact_points      Table     {Vector, ...}
    --   relative_velocity   Vector
--    if collision_info.collision_object.getGUID() == "2c3b17" then
        --print(i_countTotal(resZones.MC.zone))

--    end

--end
