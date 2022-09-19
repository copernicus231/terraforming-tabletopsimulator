function getMetaBonus(tile)
    local d = tile.getDescription()
    local json = JSON.decode(d)
    if json != nil and  json.adj!=nil then
        return json.adj
    end
    return {}
end

function getPlacementTileBonus(tile)
    local d = tile.getDescription()
    local json = JSON.decode(d)
    if json != nil and json.place!=nil then
        return json.place
    end
    return {}
end
