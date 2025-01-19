require("../UTIL/GetComponents")
--INITIAL_POSITION = Vector(-1.61, 1.07, -12.85)
--{1.53, 1.08, -12.85}
--{4.66, 1.09, -12.85}
--3.13
function setup()
    local m_position = Vector(-1.61, 1.07, -12.85)
    local a_position = Vector(15.20, 1.12, -12.85)
    --{18.32, 1.12, -12.85}
    local delta = Vector(3.13, 0, 0)
    math.randomseed(os.time())
    getBag("Award").shuffle()
    getBag("Milestone").shuffle()
    for i=1,5 do
        local m_dest = m_position
        local a_dest = a_position
        local award = getBag("Award").takeObject({position=a_dest,rotation=Vector(0,180,0)})
        local milestone = getBag("Milestone").takeObject({position=m_dest,rotation=Vector(0,180,0)})
        Wait.condition(function()
            award.setLock(true)
        end,function() return not award.spawning and award.resting and not award.isSmoothMoving() end)
        Wait.condition(function()
            milestone.setLock(true)
        end,function() return not milestone.spawning and milestone.resting and not milestone.isSmoothMoving() end)
        m_position = m_position + delta
        a_position = a_position + delta
    end
end