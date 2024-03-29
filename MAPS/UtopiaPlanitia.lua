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
function initOceanSnap()
    oceanSnap = 200
end

function initMap()
  for i = 1,61 do
      matrixMap[i].snap = i
  end
    --BONUS
    matrixMap[1].bonus = {He=2}
    matrixMap[2].bonus = {Temperature=1}
    matrixMap[3].bonus = {He=2}
    matrixMap[4].bonus = {Ocean=1}
    matrixMap[5].bonus = {He=2}
    matrixMap[6].bonus = {St=1}
    matrixMap[12].bonus = {Ti=1}
    matrixMap[13].bonus = {Pl=1}
    matrixMap[18].bonus = {St=1}
    matrixMap[19].bonus = {St=1,Pl=1}
    matrixMap[20].bonus = {Pl=2}
    matrixMap[24].bonus = {Pl=2}
    matrixMap[25].bonus = {Pl=1}
    matrixMap[26].bonus = {St=1}
    matrixMap[27].bonus = {Card=1,St=1}
    matrixMap[28].bonus = {St=1,Ti=1}
    matrixMap[29].bonus = {Pl=1}
    matrixMap[31].bonus = {Pl=2}
    matrixMap[32].bonus = {Card=1,CardBuilding=1}
    matrixMap[33].bonus = {Pl=2}
    matrixMap[34].bonus = {Pl=1}
    matrixMap[35].bonus = {Pl=1}
    matrixMap[36].bonus = {St=1,Ti=1}
    matrixMap[37].bonus = {St=1}
    matrixMap[38].bonus = {St=1}
    matrixMap[39].bonus = {Pl=1}
    matrixMap[40].bonus = {Pl=1}
    matrixMap[41].bonus = {Pl=1}
    matrixMap[42].bonus = {Pl=1}
    matrixMap[43].bonus = {Pl=1}
    matrixMap[45].bonus = {Pl=1}
    matrixMap[46].bonus = {Pl=1}
    matrixMap[47].bonus = {Pl=1}
    matrixMap[48].bonus = {St=1}
    matrixMap[49].bonus = {Card=1,Ti=1}
    matrixMap[50].bonus = {St=1}
    matrixMap[51].bonus = {Pl=1}
    matrixMap[52].bonus = {Pl=2}
    matrixMap[53].bonus = {Pl=1}
    matrixMap[54].bonus = {Pl=1}
    matrixMap[55].bonus = {Card=1,St=1}
    matrixMap[57].bonus = {Card=1}
    matrixMap[58].bonus = {Pl=2}
    matrixMap[59].bonus = {Pl=1}
    matrixMap[61].bonus = {Ti=1}

    matrixMap[6].reserve=true
    matrixMap[12].reserve=true
    matrixMap[20].reserve=true

    matrixMap[32].reserve=true
    matrixMap[33].reserve=true
    matrixMap[34].reserve=true
    matrixMap[35].reserve=true

    matrixMap[39].reserve=true
    matrixMap[47].reserve=true

    matrixMap[52].reserve=true
    matrixMap[53].reserve=true

    matrixMap[57].reserve=true

end

projects={
    powerPlant={
    click_function = 'powerPlantProject', function_owner = self, label = "",
        position = {-0.991,0.11,0.24},rotation={0,0,0},width = 30, height = 30, font_size = 30,font_color={0,0,0,0},color={0,0,0,0.7},hover_color={0,0,0,0},tooltip="Power Plant"
    },
    asteroid={
    click_function = 'asteroidProject', function_owner = self, label = "",
        position = {-0.991,0.11,0.31},rotation={0,0,0},width = 30, height = 30, font_size = 30,font_color={0,0,0,0},color={0,0,0,0.7},hover_color={0,0,0,0},tooltip="Asteroid"
    },
    buildColony={
    click_function = 'buildColonyProject', function_owner = self, label = "",
        position = {-0.991,0.2,0.38},rotation={0,0,0},width = 30, height = 30, font_size = 30,font_color={0,0,0,0},color={0,0,0,0.7},hover_color={0,0,0,0},tooltip="Building Colony"
    },
    aquifer={
    click_function = 'aquiferProject', function_owner = self, label = "",
        position = {-0.991,0.11,0.45},rotation={0,0,0},width = 30, height = 30, font_size = 30,font_color={0,0,0,0},color={0,0,0,0.7},hover_color={0,0,0,0},tooltip="Aquifer"
    },
    greenery={
    click_function = 'greeneryProject', function_owner = self, label = "",
        position = {-0.991,0.11,0.52},rotation={0,0,0},width = 30, height = 30, font_size = 30,font_color={0,0,0,0},color={0,0,0,0.7},hover_color={0,0,0,0},tooltip="Greenery"
    },
    city={
    click_function = 'cityProject', function_owner = self, label = "",
        position = {-0.991,0.11,0.59},rotation={0,0,0},width = 30, height = 30, font_size = 30,font_color={0,0,0,0},color={0,0,0,0.7},hover_color={0,0,0,0},tooltip="City"
    },
}
