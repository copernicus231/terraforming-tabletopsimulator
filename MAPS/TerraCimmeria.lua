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
    matrixMap[2].bonus = {Pl=1}
    matrixMap[3].bonus = {St=1}
    matrixMap[4].bonus = {Pl=1}
    matrixMap[5].bonus = {Pl=2}
    matrixMap[6].bonus = {Ti=2}
    matrixMap[10].bonus = {Pl=1,St=1}
    matrixMap[11].bonus = {Pl=1}

    matrixMap[14].bonus = {MC=-5,Colony=1}
    matrixMap[17].bonus = {Pl=1}

    matrixMap[19].bonus = {St=1}
    matrixMap[21].bonus = {St=1}
    matrixMap[23].bonus = {St=2}
    matrixMap[24].bonus = {Ti=2}
    matrixMap[26].bonus = {Card=1}

    matrixMap[30].bonus = {Ti=1}
    matrixMap[31].bonus = {Ti=1}
    matrixMap[32].bonus = {Card=1}
    matrixMap[34].bonus = {Card=1,St=1}
    matrixMap[36].bonus = {Card=2}

    matrixMap[38].bonus = {St=2,Ti=1}

    matrixMap[40].bonus = {Ti=1}
    matrixMap[41].bonus = {St=2}
    matrixMap[43].bonus = {St=2}

    matrixMap[44].bonus = {Pl=2}
    matrixMap[45].bonus = {Ti=1}
    matrixMap[47].bonus = {St=2,Pl=1}
    matrixMap[48].bonus = {Pl=2}
    matrixMap[49].bonus = {Pl=1}
    matrixMap[50].bonus = {Pl=2}

    matrixMap[53].bonus = {Ti=1}
    matrixMap[54].bonus = {Card=1}
    matrixMap[55].bonus = {Pl=2}
    matrixMap[56].bonus = {Pl=2}
    
    matrixMap[57].bonus = {Pl=2}
    matrixMap[58].bonus = {Pl=1}
    matrixMap[59].bonus = {Pl=1}
    matrixMap[60].bonus = {Pl=1}
    matrixMap[61].bonus = {Pl=1}

    matrixMap[12].reserve=true
    matrixMap[19].reserve=true
    matrixMap[23].reserve=true
    matrixMap[24].reserve=true
    matrixMap[25].reserve=true

    matrixMap[34].reserve=true

    matrixMap[38].reserve=true

    matrixMap[46].reserve=true
    matrixMap[47].reserve=true

    matrixMap[53].reserve=true
    matrixMap[54].reserve=true

    matrixMap[60].reserve=true

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
        position = {-0.980,0.2,0.383},rotation={0,0,0},width = 29, height = 29, font_size = 29,font_color={0,0,0,0},color={0,0,0,0.7},hover_color={0,0,0,0},tooltip="Building Colony"
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
