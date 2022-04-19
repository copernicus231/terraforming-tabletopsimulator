function getTags(card)
    local meta = string.find(card.getDescription(),"{")
    if meta != nil and meta == 1 then
        local j = JSON.decode(card.getDescription())
        if #j.Tags == 0 then
            return {"Non"}
        end
        return j.Tags
    end

    local tags = getSpecifiedValuesFromDescription("Tags?:",card.getDescription())
    if #tags then
        if #tags == 0 then
            tags = {"Non"}
        end
    end
    return tags
end

function contains(list, x)
	for _, v in pairs(list) do
		if v == x then return true end
	end
	return false
end

function getCost(card)
    local meta = string.find(card.getDescription(),"{")
    if meta != nil and meta == 1 then
        local j = JSON.decode(card.getDescription())
        return tonumber(j.Cost)
    end
    local cost = getSpecifiedValuesFromDescription("Cost:",card.getDescription())
    return tonumber(cost[1] or "0")
end
function getDiscount(card)
    local meta = string.find(card.getDescription(),"{")
    if meta != nil and meta == 1 then
        local j = JSON.decode(card.getDescription())
        if j.Discount != nil then
            --for x,y in pairs(j.Discount) do
            --    return {total = y,tag = x}
            --end
            return j.Discount
        else
            return {}
        end
    end

    local discount = getSpecifiedValuesFromDescription("Discount?:",card.getDescription())
    for i,a in pairs(discount) do
        log("discount:"..a)
    end

    return {total=tonumber(discount[1] or "0"),tag=discount[2]}
end
function getVP(card)
    local meta = string.find(card.getDescription(),"{")
    if meta != nil and meta == 1 then
        local j = JSON.decode(card.getDescription())
        return tonumber(j.VP) or 0
    end
    local vp = getSpecifiedValuesFromDescription("VP?:",card.getDescription())
    if vp[2] != nil then
        return 0
    end
    return tonumber(vp[1]) or 0
end
function getProductions(card)

    local meta = string.find(card.getDescription(),"{")
    if meta != nil and meta == 1 then
        local j = JSON.decode(card.getDescription())
        return j.Prod or {}
    end
    if card.hasTag("Corp") then
        return card.getVar("startingProd")
    end
    return {}
end

function getResources(card)

    local meta = string.find(card.getDescription(),"{")
    if meta != nil and meta == 1 then
        local j = JSON.decode(card.getDescription())
        return j.Resource or {}
    end
    if card.hasTag("Corp") then
        local res = card.getVar("startingRes")
        res["MC"]=card.getVar("startingMC")
        return res
    end
    return {}
end

function getProductionsAny(card)
    local meta = string.find(card.getDescription(),"{")
    if meta != nil and meta == 1 then
        local j = JSON.decode(card.getDescription())
        return j.ProdAny or {}
    end
    return {}
end

function getResourcesAny(card)
    local meta = string.find(card.getDescription(),"{")
    if meta != nil and meta == 1 then
        local j = JSON.decode(card.getDescription())
        return j.ResourceAny or {}
    end
    return {}
end

function getRequirement(card)
    local meta = string.find(card.getDescription(),"{")
    if meta != nil and meta == 1 then
        local j = JSON.decode(card.getDescription())
        return j.Requirement or {}
    end
    return {}
end

function getIncomes(card)
    local meta = string.find(card.getDescription(),"{")
    if meta != nil and meta == 1 then
        local j = JSON.decode(card.getDescription())
        return j.Income or {}
    end
    return {}
end
function getCopies(card)
    local meta = string.find(card.getDescription(),"{")
    if meta != nil and meta == 1 then
        local j = JSON.decode(card.getDescription())
        return j.Copy or 0
    end
    return 0
end

function getAltCost(card)
    local meta = string.find(card.getDescription(),"{")
    if meta != nil and meta == 1 then
        local j = JSON.decode(card.getDescription())
        return j.AltCost or {}
    end
    return {}
end

function getSpecifiedValuesFromDescription(searchPattern,description)
  local isValue = false
  local valueList = {}
  local index = 1
  for subString in string.gmatch(description, "%S+") do
    if string.find(subString, ":") ~= nil then
      isValue = false
    end

    if isValue then
      valueList[index] = subString
      index = index + 1
    end
    if (string.match(subString, searchPattern)) then
      isValue = true
    end
  end
  return valueList
end
