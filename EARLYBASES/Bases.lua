require("../UTIL/GetComponents")
INITIAL_POSITION=Vector(80.00, 0.86, -11.00)
function setup()
    local bag =getBag("EarlyBase")
    bag.shuffle()
    local numBases = #Global.call("getPlayers",{})
    local dest=INITIAL_POSITION
    for i=1,numBases do
        bag.takeObject({position=dest,rotation=Vector(0,270,0)})
        bag.takeObject({position=dest-Vector(0,0,4),rotation=Vector(0,270,0)})
        dest = dest + Vector(3,0,0)
    end
end
