require("../UTIL/TileUtils")
TileBoard={matrix={},parent=nil,zoneTag=nil}

function TileBoard:new(o)
    o = o or {}
    setmetatable(o, self)
    self.__index = self
  return o
end
DELTA = 0.00001


function TileBoard:getPosition(tile)
    return twoDimPos(self.parent.positionToLocal(tile.getPosition()))
end

--IMPROVE PERFORMANCE
function TileBoard:getZonePosition(tile)
    local position = self:getPosition(tile)
    local snaps = self.parent.getSnapPoints()
    for i,hex in pairs(self.matrix) do
        local pos = snaps[hex.snap].position
        if Vector.sqrDistance(position,twoDimPos(pos)) < DELTA then
            return i
        end
    end
    return 0
end

function TileBoard:countAdjacent(position,tag)
    local counter = 0
    for i,neighbor in pairs(self.matrix[position].next()) do
        local neighborTile = self.matrix[neighbor].tile
        if neighborTile != nil and neighborTile.hasTag(tag) then
            counter = counter + 1
        end
    end
    return counter
end
function TileBoard:placeTile(tile,position)
    self.matrix[position].tile = tile
end
function TileBoard:getEmptyPosition(n,reverse)
    local count = 0
    if reverse then
      while count < n do
        for i = #self.matrix,1, -1 do
            local a = self.matrix[i]
            if not a.reserve and a.tile == nil then
                count = count + 1
            end
            if count == n then
                return self.parent.getSnapPoints()[a.snap].position
            end
        end
     end
    else
        while count < n do
            for i = 1,#self.matrix,1 do
                local a = self.matrix[i]
                if not a.reserve and a.tile == nil then
                    count = count + 1
                end
                if count == n then
                    return self.parent.getSnapPoints()[a.snap].position
                end
            end
        end
    end

end
function TileBoard:cleanPosition(position)
    self.matrix[position].tile = nil
end

function TileBoard:getTileAdjacencyBonus(tile)
    --EXPAND FOR OTHER TILES SPECIAL
    return getMetaBonus(tile)
    --if tile.hasTag("Ocean") then
    --    return {MC=2}
    --end
    --return {}
end

function TileBoard:getTilePlacementBonus(tile)
    return getPlacementTileBonus(tile)
end

function TileBoard:getTileBonus(tile)
    local bonus = {}
    if tile.hasTag("SpecialTile") and tile.hasTag("YellowBorderTile") then
        bonus[tile.memo] = {MC=1}
        return bonus
    end
    return {}
end
function TileBoard:getAdjacencyBonusColor(position,color)
    local bonus={}
    bonus[color] = {}
    for i,neighbor in pairs(self.matrix[position].next) do
        local neighborTile = self.matrix[neighbor].tile
        if neighborTile != nil then
            for y,ab in pairs(self:getTileAdjacencyBonus(neighborTile)) do
                bonus[color][y] = (bonus[color][y] or 0) + ab
            end
            for z,ac in pairs(self:getTileBonus(neighborTile)) do
                for x,ad in pairs(ac) do
                    bonus[z] = (bonus[z] or {})
                    bonus[z][x] = (bonus[z][x] or 0) + ad
                end
            end
        end
    end
    return bonus
end

function TileBoard:getPlacementBonusColor(position)
    local color = self.matrix[position].tile.memo
    local bonus = self:getAdjacencyBonusColor(position,color)
    for y,ab in pairs(self.matrix[position].bonus) do
        bonus[color][y] = (bonus[color][y] or 0) + ab
    end
    for x,cd in pairs(self:getTilePlacementBonus(self.matrix[position].tile)) do
            bonus[color][x] = (bonus[color][x] or 0) + cd
    end
    return bonus
end

function TileBoard:getAdjacencyBonus(position)
    local bonus={}
    for i,neighbor in pairs(self.matrix[position].next) do
        local neighborTile = self.matrix[neighbor].tile
        if neighborTile != nil then
            for y,ab in pairs(self:getTileAdjacencyBonus(neighborTile)) do
                bonus[y] = (bonus[y] or 0) + ab
            end
        end
    end
    return bonus
end

function TileBoard:getPlacementBonus(position)
    local bonus = self:getAdjacencyBonus(position)
    for y,ab in pairs(self.matrix[position].bonus) do
        bonus[y] = (bonus[y] or 0) + ab
    end
    return bonus
end
