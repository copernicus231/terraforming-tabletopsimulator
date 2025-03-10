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
    dustStormSnap = 222
    erosionSnap = 225
end
function initMap()
    for i = 1,61 do
        matrixMap[i].snap = i
    end
    --BONUS
    matrixMap[2].bonus = {Pl=1}
    matrixMap[5].bonus = {Card=2}
    matrixMap[6].bonus = {Card=1,MICROBE=2}
    matrixMap[7].bonus = {Pl=1}
    matrixMap[8].bonus = {Pl=2}
    matrixMap[10].bonus = {Pl=1}
    matrixMap[11].bonus = {Pl=1}
    matrixMap[12].bonus = {St=1,Pl=1}
    matrixMap[13].bonus = {Pl=1}
    matrixMap[14].bonus = {SCIENCE=2,Card=1}
    matrixMap[15].bonus = {St=1}
    matrixMap[16].bonus = {St=1}
    matrixMap[17].bonus = {St=1,Pl=1}
    matrixMap[18].bonus = {St=1,Ti=1}

    matrixMap[19].bonus = {Pl=2}
    matrixMap[20].bonus = {Pl=1}
    matrixMap[21].bonus = {Pl=2}
    matrixMap[25].bonus = {St=2}

    matrixMap[30].bonus = {ProdEn=1}
    matrixMap[31].bonus = {Pl=2}
    matrixMap[32].bonus = {St=1,Card=1,SCIENCE=1}

    matrixMap[36].bonus = {Pl=1}
    matrixMap[37].bonus = {Pl=1}
    matrixMap[38].bonus = {St=2}
    matrixMap[39].bonus = {Pl=1}
    matrixMap[40].bonus = {St=1}
    matrixMap[42].bonus = {Pl=1,Ti=1}
    matrixMap[43].bonus = {Pl=1}

    matrixMap[44].bonus = {Pl=1,Ti=1}
    matrixMap[45].bonus = {Pl=2}
    matrixMap[46].bonus = {Pl=2}
    matrixMap[47].bonus = {Pl=1}
    matrixMap[48].bonus = {St=1}
    matrixMap[49].bonus = {Pl=1,Ti=1}
    matrixMap[50].bonus = {Ti=2}

    matrixMap[51].bonus = {Pl=2}
    matrixMap[52].bonus = {Pl=1}
    matrixMap[53].bonus = {St=1,Card=1}
    matrixMap[54].bonus = {St=2}
    matrixMap[55].bonus = {St=1}
    matrixMap[56].bonus = {Card=1}
    matrixMap[61].bonus = {St=1}

    --matrixMap[10].bonus = {"En","He"}
    matrixMap[1].reserve=true
    matrixMap[2].reserve=true
    matrixMap[5].reserve=true
    matrixMap[6].reserve=true

    matrixMap[7].reserve=true
    matrixMap[13].reserve=true

    matrixMap[18].reserve=true
    matrixMap[21].reserve=true
    matrixMap[29].reserve=true

    matrixMap[30].reserve=true
    matrixMap[31].reserve=true

    matrixMap[38].reserve=true

    matrixMap[42].reserve=true
    matrixMap[44].reserve=true
    matrixMap[45].reserve=true
    matrixMap[46].reserve=true
    matrixMap[51].reserve=true
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
        position = {-0.991,0.11,0.38},rotation={0,0,0},width = 30, height = 30, font_size = 30,font_color={0,0,0,0},color={0,0,0,0.7},hover_color={0,0,0,0},tooltip="Building Colony"
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
