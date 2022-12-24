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
    matrixMap[1].bonus = {St=2}
    matrixMap[2].bonus = {Pl=1}
    matrixMap[5].bonus = {Ti=2}
    matrixMap[6].bonus = {St=2}
    matrixMap[7].bonus = {St=1}
    matrixMap[10].bonus = {Ti=1}
    matrixMap[11].bonus = {Pl=1}
    matrixMap[12].bonus = {Ti=1}
    matrixMap[16].bonus = {Card=1}
    matrixMap[17].bonus = {Card=1,SCIENCE=1,MICROBE=1}
    matrixMap[18].bonus = {Pl=1}
    matrixMap[19].bonus = {St=1,Ti=1}
    matrixMap[20].bonus = {Card=2,St=1}
    matrixMap[21].bonus = {St=1}
    matrixMap[22].bonus = {He=2}
    matrixMap[23].bonus = {He=2}
    matrixMap[25].bonus = {Pl=2}
    matrixMap[26].bonus = {St=1,Pl=1}
    matrixMap[30].bonus = {He=2}
    matrixMap[31].bonus = {Temperature=1}
    matrixMap[32].bonus = {St=1}
    matrixMap[34].bonus = {Pl=1}
    matrixMap[35].bonus = {Ti=1}
    matrixMap[36].bonus = {Pl=1}
    matrixMap[37].bonus = {Pl=1}
    matrixMap[39].bonus = {He=2}
    matrixMap[40].bonus = {He=2}
    matrixMap[42].bonus = {Pl=1}
    matrixMap[43].bonus = {Ti=1,Pl=1}
    matrixMap[44].bonus = {Pl=2}
    matrixMap[48].bonus = {St=1,Pl=1}
    matrixMap[49].bonus = {Pl=1}
    matrixMap[50].bonus = {Pl=2}
    matrixMap[51].bonus = {Pl=1}
    matrixMap[54].bonus = {St=1}
    matrixMap[56].bonus = {Pl=2}
    matrixMap[57].bonus = {Pl=2}
    matrixMap[59].bonus = {Pl=1}
    matrixMap[60].bonus = {Pl=2}
    matrixMap[61].bonus = {St=1,Pl=1}

    matrixMap[17].reserve=true
    matrixMap[18].reserve=true
    matrixMap[22].reserve=true
    matrixMap[23].reserve=true

    matrixMap[24].reserve=true
    matrixMap[25].reserve=true

    matrixMap[30].reserve=true
    matrixMap[35].reserve=true
    matrixMap[39].reserve=true

    matrixMap[46].reserve=true
    matrixMap[51].reserve=true

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
