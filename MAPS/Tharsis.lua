require("../CORE/SmallMatrix")
require("../MAPS/BoardBase")
TICKNES=0.2
function initTrSnapMap()
  for i=1,100 do
      trSnapMap[i] = i + 61
  end
end
function initOxygenSnapMap()
  for i = 1,15 do
      oxygenSnapMap[i]  = 16 - i + 181
      oxygenBonusMap[i] = {PLAYER={TERRAFORM=1},EVERYONE={}}
  end
  oxygenBonusMap[9] = {PLAYER={TERRAFORM=1,Temperature=1},EVERYONE={}}
end
function initTemperatureSnapMap()
    for i = 1,20 do
        temperatureSnapMap[i] = i + 161
        temperatureBonusMap[i]={PLAYER={TERRAFORM=1},EVERYONE={}}
    end

    temperatureBonusMap[4]={PLAYER={TERRAFORM=1,ProdHe=1},EVERYONE={}}
    temperatureBonusMap[6]={PLAYER={TERRAFORM=1,ProdHe=1},EVERYONE={}}
    temperatureBonusMap[16]={PLAYER={TERRAFORM=1,Ocean=1},EVERYONE={}}

end
function initOtherSnap()
    oceanSnap = 200
    for i = 1,7 do
        milestoneSnapMap[i] = i + 203
    end
    for i = 1,7 do
        awardSnapMap[i] = i + 213
    end
    dustStormSnap = 225
    erosionSnap = 222
end

function initMap()
  for i = 1,61 do
      matrixMap[i].snap = i
  end
 --BONUS
 matrixMap[1].bonus = {St=2}
 matrixMap[2].bonus = {St=2}
 matrixMap[4].bonus = {Card=1}
 matrixMap[7].bonus = {St=1}
 matrixMap[11].bonus = {Card=2}
 matrixMap[12].bonus = {Card=1}
 matrixMap[18].bonus = {St=1}
 matrixMap[19].bonus = {Ti=1,Pl=1}
 matrixMap[20].bonus = {Pl=1}
 matrixMap[21].bonus = {Pl=1}
 matrixMap[22].bonus = {Pl=1}
 matrixMap[23].bonus = {Pl=2}
 matrixMap[24].bonus = {Pl=1}
 matrixMap[25].bonus = {Pl=1}
 matrixMap[26].bonus = {Pl=2}
 matrixMap[27].bonus = {Pl=2}
 matrixMap[28].bonus = {Pl=2}
 matrixMap[29].bonus = {Pl=2}
 matrixMap[30].bonus = {Pl=2}
 matrixMap[31].bonus = {Pl=2}
 matrixMap[32].bonus = {Pl=2}
 matrixMap[33].bonus = {Pl=2}
 matrixMap[34].bonus = {Pl=2}
 matrixMap[35].bonus = {Pl=2}
 matrixMap[36].bonus = {Pl=1}
 matrixMap[37].bonus = {Pl=2}
 matrixMap[38].bonus = {Pl=1}
 matrixMap[39].bonus = {Pl=1}
 matrixMap[40].bonus = {Pl=1}
 matrixMap[41].bonus = {Pl=1}
 matrixMap[42].bonus = {Pl=1}
 matrixMap[43].bonus = {Pl=1}
 matrixMap[49].bonus = {Pl=1}
 matrixMap[51].bonus = {St=2}
 matrixMap[54].bonus = {Card=1}
 matrixMap[56].bonus = {Ti=1}
 matrixMap[57].bonus = {St=1}
 matrixMap[58].bonus = {St=2}
 matrixMap[61].bonus = {Ti=2}

 matrixMap[2].reserve=true
 matrixMap[4].reserve=true
 matrixMap[5].reserve=true

 matrixMap[11].reserve=true

 matrixMap[26].reserve=true

 matrixMap[29].reserve=true
 matrixMap[30].reserve=true
 matrixMap[31].reserve=true
 matrixMap[32].reserve=true

 matrixMap[41].reserve=true
 matrixMap[42].reserve=true
 matrixMap[43].reserve=true
 matrixMap[61].reserve=true
end

projects={
    powerPlant={
    click_function = 'powerPlantProject', function_owner = self, label = "",
        position = {-0.980,0.11,0.245},rotation={0,0,0},width = 29, height = 29, font_size = 29,font_color={0,0,0,0},color={0,0,0,0.7},hover_color={0,0,0,0},tooltip="Power Plant"
    },
    asteroid={
    click_function = 'asteroidProject', function_owner = self, label = "",
        position = {-0.980,0.11,0.315},rotation={0,0,0},width = 29, height = 29, font_size = 29,font_color={0,0,0,0},color={0,0,0,0.7},hover_color={0,0,0,0},tooltip="Asteroid"
    },
    buildColony={
    click_function = 'buildColonyProject', function_owner = self, label = "",
        position = {-0.980,0.11,0.383},rotation={0,0,0},width = 29, height = 29, font_size = 29,font_color={0,0,0,0},color={0,0,0,0.7},hover_color={0,0,0,0},tooltip="Building Colony"
    },
    aquifer={
    click_function = 'aquiferProject', function_owner = self, label = "",
        position = {-0.980,0.11,0.453},rotation={0,0,0},width = 29, height = 29, font_size = 29,font_color={0,0,0,0},color={0,0,0,0.7},hover_color={0,0,0,0},tooltip="Aquifer"
    },
    greenery={
    click_function = 'greeneryProject', function_owner = self, label = "",
        position = {-0.980,0.11,0.523},rotation={0,0,0},width = 29, height = 29, font_size = 29,font_color={0,0,0,0},color={0,0,0,0.7},hover_color={0,0,0,0},tooltip="Greenery"
    },
    city={
    click_function = 'cityProject', function_owner = self, label = "",
        position = {-0.980,0.11,0.593},rotation={0,0,0},width = 29, height = 29, font_size = 29,font_color={0,0,0,0},color={0,0,0,0.7},hover_color={0,0,0,0},tooltip="City"
    },
}
