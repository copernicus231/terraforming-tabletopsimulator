function getSingleObject(tags)
    local objs=getObjectsWithAllTags(tags)
    if objs!= nil and #objs == 1 then
        return objs[1]
    elseif objs!= nil and #objs > 1 then
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
MILESTONS={}
function getMilestone(name)
    return getObject(MILESTONS,name,{"Milestone",name})
end
AWARDS={}
function getAward(name)
    return getObject(AWARDS,name,{"Award",name})
end
DISCARD_HOLDERS={}
function getDiscardHolder(name)
    return getObject(DISCARD_HOLDERS,name,{"DeckHolder","Discard",name})
end
DRAW_HOLDERS={}
function getDrawHolder(name)
    return getObject(DRAW_HOLDERS,name,{"DeckHolder","Draw",name})
end
PLAYER_BOARDS={}
function getPlayerBoard(color)
    return getObject(PLAYER_BOARDS,color,{"PlayerBoard",color})
end
TAG_TABLES={}
function getTagTable(color)
    return getObject(TAG_TABLES,color,{"TagTable",color})
end
CARD_PLAY_TABLES={}
function getCardPlayTable(color)
    return getObject(CARD_PLAY_TABLES,color,{"CardPlayTable",color})
end
PLAYER_MARKERS={}
function getPlayerMarker(color)
    return getObject(PLAYER_MARKERS,color,{"PlayerMarker","PlayerCube",color})
end
DRAFT_HANDLER=nil
function getDraftHandler()
    if DRAFT_HANDLER == nil then
        DRAFT_HANDLER = getSingleObject({"DraftHandler"})
    end
    return  DRAFT_HANDLER
end
TURN_TOKEN=nil
function getTurnToken()
    if TURN_TOKEN == nil then
        TURN_TOKEN = getSingleObject({"TurnToken"})
    end
    return TURN_TOKEN
end
FIRST_PLAYER_TOKEN=nil
function getFirstPlayerToken()
    if FIRST_PLAYER_TOKEN == nil then
        FIRST_PLAYER_TOKEN = getSingleObject({"FirstPlayerToken"})
    end
    return FIRST_PLAYER_TOKEN
end
DRAFT_TOKENS={}
function getDraftToken(color)
    return getObject(DRAFT_TOKENS,color,{"DraftToken",color})
end

OPTIONAL_RESOURCES={}
function getOptionalResource(color)
    return getObject(OPTIONAL_RESOURCES,color,{"OptionalResource",color})
end


DRAFT_ZONES={}
function getDraftZone(color)
    return getObject(DRAFT_ZONES,color,{"Draft",color})
end
TILE_BOARDS={}
function getBoard(name)
    return getObject(TILE_BOARDS,name,{"Board",name})
end
TRACK_MARKERS={}
function getTrackMarker(name)
    return getObject(TRACK_MARKERS,name,{"TrackMarker",name})
end
PATH_MARKERS={}
function getPathMarker(name)
    return getObject(PATH_MARKERS,name,{"PathMarker",name})
end
PLAYER_TOKEN_BAG={}
function getPlayerBag(color)
    return getObject(PLAYER_TOKEN_BAG,color,{"Bag","Token",color})
end
ARROWS={}
function getArrows()
     if #ARROWS == 0 then
          ARROWS = getObjectsWithAllTags({"Arrow"})
     end
     return ARROWS
end
BAGS={}
function getBag(name)
    return getObject(BAGS,name,{"Bag",name})
end
DELEGATE_BAGS={}
function getDelegateBag(color)
    return getObject(DELEGATE_BAGS,color,{"Bag","DelegateToken",color})
end
DOMINANT_MARKER=nil
function getDominantMarker()
  if DOMINANT_MARKER == nil then
    DOMINANT_MARKER=getSingleObject({"DominantPartyMarker"})
  end
  return DOMINANT_MARKER
end
CITY_COUNTER=nil
function getCityCounter()
    if CITY_COUNTER == nil then
      CITY_COUNTER=getSingleObject({"Counter"})
    end
    return CITY_COUNTER
end
