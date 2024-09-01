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
    matrixMap[1].bonus = {Pl=1}
    matrixMap[3].bonus = {St=1}
    matrixMap[6].bonus = {Pl=2}
    matrixMap[10].bonus = {Pl=1}
    matrixMap[11].bonus = {Card=1}
    matrixMap[12].bonus = {Card=1}
    matrixMap[13].bonus = {Pl=2}
    matrixMap[14].bonus = {Pl=2}
    matrixMap[15].bonus = {Pl=2}
    matrixMap[16].bonus = {Pl=1}

    matrixMap[19].bonus = {St=2}
    matrixMap[20].bonus = {Ti=1}
    matrixMap[21].bonus = {Pl=2}
    matrixMap[22].bonus = {Pl=1}

    matrixMap[24].bonus = {Card=1}
    matrixMap[25].bonus = {Pl=1}
    matrixMap[26].bonus = {Delegate=1}
    matrixMap[29].bonus = {Pl=1}
    matrixMap[30].bonus = {Pl=2}
    matrixMap[31].bonus = {MC=-4,Temperature=1}
    matrixMap[32].bonus = {Pl=2}
    matrixMap[33].bonus = {Pl=2}
    matrixMap[34].bonus = {Pl=2}
    matrixMap[35].bonus = {Card=2}
    matrixMap[36].bonus = {Card=2}

    matrixMap[38].bonus = {Pl=1}
    matrixMap[39].bonus = {He=2}
    matrixMap[40].bonus = {He=2,Pl=1}
    matrixMap[41].bonus = {Card=1}
    matrixMap[42].bonus = {Pl=1}
    matrixMap[43].bonus = {Ti=2}
    matrixMap[44].bonus = {Ti=1}
    matrixMap[45].bonus = {St=1}

    matrixMap[47].bonus = {He=2}
    matrixMap[48].bonus = {Pl=2}
    matrixMap[49].bonus = {Pl=1}

    matrixMap[51].bonus = {Pl=1}
    matrixMap[53].bonus = {Pl=1}
    matrixMap[54].bonus = {St=1,Pl=1}
    matrixMap[55].bonus = {St=1}
    matrixMap[56].bonus = {Pl=1}

    matrixMap[57].bonus = {Delegate=1}
    matrixMap[59].bonus = {Card=1}
    matrixMap[60].bonus = {Ti=1}


    matrixMap[13].reserve=true
    matrixMap[14].reserve=true
    matrixMap[21].reserve=true
    matrixMap[29].reserve=true
    matrixMap[32].reserve=true

    matrixMap[33].reserve=true

    matrixMap[34].reserve=true

    matrixMap[39].reserve=true
    matrixMap[40].reserve=true

    matrixMap[41].reserve=true
    matrixMap[46].reserve=true

    matrixMap[47].reserve=true

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
