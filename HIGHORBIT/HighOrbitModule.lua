require("../UTIL/GetComponents")
require("../UTIL/CardUtils")
function setup()
    local obj = getObjectsWithAllTags({"Card","Infrastructure"})
    if #obj == 0 then
        return
    end
    local deck = obj[1]
    local deltax = Vector(0,0,0)
    local deltay = Vector(0,0,-5)
    local pos = Vector(94.00, 0.96, 7.00)
    local t = deck.getObjects()
    local num = #t

    local n = 0
    for i,a in ipairs(t) do
        if n < 3 then
            deltax = deltax +  Vector(3.1,0,0)
            n = n + 1
        else
            n = 1
            deltax = Vector(3.1,0,0) + deltay
            deltay = deltay +  Vector(0,0,-5)
        end
        num = num - 1
        local o = nil
        if num > 0 then

            o = deck.takeObject({guid=a.guid,position=pos+deltax})
        else
            o = getObjectFromGUID(a.guid)
            o.setPositionSmooth(pos+deltax)
        end
        local numPlayers = #Global.call("getPlayers")
        Wait.condition(function() local copies = numPlayers + getCopies(o); while copies > 1 do o.clone({position=o.getPosition() + Vector(0,1,0)});copies = copies - 1 end end, function() return o.resting end)
    end

end
