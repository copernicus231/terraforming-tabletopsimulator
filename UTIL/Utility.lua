function twoDimPos(position)
    return Vector(position.x,0,position.z)
end

function toLColor(tint)
    return lColor(tint:toString())
end

function lColor(color)
    if color == "Black" then
        return "Brown"
    end
    return color
end

function rColor(color)
    if color == "Brown" then
        return "Black"
    end
    return color
end

function getPlayerName(color)
    return Player[color].steam_name or color
end

function setStandardProject(color,label,cost,prod,rsrc)
  local cpt = getCardPlayTable(color)
  cpt.call("setProject",{label=label,cost=cost,prod=prod,rsrc=rsrc})
  Player[color].lookAt({
      position = cpt.getPosition(),
      pitch    = 55,
      yaw      = cpt.getRotation().y+180,
      distance = 15
  })
end

COLORS ={
    WARN = {238/255,210/255,2/255,1},
    ERROR = {1,0,0,1},
    SUCCESS = {0,1,0,1},
    WHITE = {1,1,1,1}
}
