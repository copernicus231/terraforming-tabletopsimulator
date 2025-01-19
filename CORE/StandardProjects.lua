require("../UTIL/Utility")
require("../UTIL/GetComponents")

function onLoad()
    for i,a in pairs(projects) do
        self.createButton(a)
    end
end

function powerPlantProject(obj,player_clicker_color,alt_click)
    setStandardProject(player_clicker_color,"Power Plant",{MC=11},{En=1},{})
end

function asteroidProject(obj,player_clicker_color,alt_click)
  setStandardProject(player_clicker_color,"Asteroid",{MC=14},{},{Temperature=1})
end

function buildColonyProject(obj,player_clicker_color,alt_click)
  setStandardProject(player_clicker_color,"Build Colony",{MC=17},{},{})
end

function aquiferProject(obj,player_clicker_color,alt_click)
  setStandardProject(player_clicker_color,"Aquifer",{MC=18},{},{Ocean=1})
end

function greeneryProject(obj,player_clicker_color,alt_click)
  setStandardProject(player_clicker_color,"Greenery",{MC=23},{},{Greenery=1})
end

function cityProject(obj,player_clicker_color,alt_click)
  setStandardProject(player_clicker_color,"City",{MC=25},{MC=1},{City=1})
end
