Track={marker={},snapMap={},level={},parent=nil,bonusMap={}}
function Track:new(o)
    o = o or {}
    setmetatable(o, self)
    self.__index = self
  return o
end
DELTA = 0.00001

function Track:getSnapPoint(pos)
    return self.parent.getSnapPoints()[self.snapMap[pos]]
end

function Track:getMarkerPosition(color)
    return twoDimPos(self.parent.positionToLocal(self.marker[color].getPosition()))
end

function Track:getSnapPosition(index)
    return twoDimPos(self:getSnapPoint(index).position)
end

function Track:getTrackPosition(color)
    local position = self:getMarkerPosition(color)
    --log("*****")
    for i=1,#self.snapMap do
        local pos =  self:getSnapPosition(i)
        --log("/"..Vector.sqrDistance(position,pos).."/"..DELTA)
        if Vector.sqrDistance(position,pos) < DELTA then
            return i
        end
    end
    log("Object is not part of track ")
    return 0
end

function Track:moveTrack(color,step)
    self:updateLevel(color)
    if (self.level[color] + step) <= #self.snapMap and (self.level[color]  + step) > 0 then
        self.level[color]  = self.level[color]   + step
        local point = self:getSnapPoint(self.level[color])
        self.marker[color].setPositionSmooth(self.parent.positionToWorld(point.position + Vector(0,1,0)*3))
        self.marker[color].setRotation(point.rotation)
        return true
    end
    return false
end

function Track:updateLevel(color)
    self.level[color]=self:getTrackPosition(color)
end

function Track:getLevel(color)
    return self.level[color]
end
function Track:setTrackPosition(color,position)
    self.marker[color].setPositionSmooth(self.parent.positionToWorld(self:getSnapPosition(position) + Vector(0,3,0)))
    self.marker[color].setRotation(self.parent.getRotation())
    self.marker[color].rotate(self:getSnapPoint(position).rotation)
    --TODO CHECK IF DO HERE
    self.level[color]=position
end

function Track:getBonus(color,step)
    local bonus = {}
    while step > 0 do
        step = step - 1
        local bonusStep = self.bonusMap[self.level[color]-step] or {}
        for i,a in pairs(bonusStep) do
            bonus[i] = (bonus[i] or {})
            for x,y in pairs(a) do
                bonus[i][x] = (bonus[i][x] or 0) + y
            end
        end
    end
    return bonus
end
