function pileCubes(n,lines,offset_x,cubeScale,bag,zone)
    if n < 1 then
        return
    end
    local delay = 0
    local pos = zone.positionToLocal(zone.getPosition())
    local scale =  zone.getScale()
    local prop = scale.x/scale.z
    local size = ((cubeScale*2)+0.12)/scale.x
    local x,z = -0.5+(offset_x/scale.x),0.5-((cubeScale+0.12)/scale.z)
    for i=1,n do
        local bx = x
        local bz = z - (size*prop)*((i-1)%lines)
        Wait.frames(function() bag.takeObject({position = zone.positionToWorld(pos+Vector(bx,0.5,bz)),rotation=zone.getRotation() }) end,delay)
        delay = delay + 40
    end
end

function groupCubes(zone)
    local copper = {}
    local silver = {}
    local gold = {}
    for _,objfzone in pairs(zone.getObjects()) do
        if objfzone.hasTag("Copper") then
            copper[#copper + 1] = objfzone
        elseif objfzone.hasTag("Silver") then
            silver[#silver + 1] = objfzone
        elseif objfzone.hasTag("Gold") then
            gold[#gold + 1] = objfzone
        end
    end
    return { C = copper, S = silver, G = gold}
end
