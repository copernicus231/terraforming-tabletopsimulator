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
	matrixMap[1].bonus = {Pl=2}
    matrixMap[2].bonus = {Pl=2}
    matrixMap[3].bonus = {Pl=1}
    matrixMap[4].bonus = {St=1,Pl=1}
    matrixMap[5].bonus = {Ti=2}
    matrixMap[6].bonus = {Card=1,Rsrc=1}
    matrixMap[7].bonus = {Pl=4}
    matrixMap[8].bonus = {Pl=2}
    matrixMap[9].bonus = {Pl=1}
    matrixMap[11].bonus = {Ti=1}
    matrixMap[12].bonus = {Pl=1}
    matrixMap[13].bonus = {Pl=1}
    matrixMap[14].bonus = {Pl=2}
    matrixMap[16].bonus = {MICROBE=2,Card=1}
    matrixMap[18].bonus = {St=1}
    matrixMap[19].bonus = {Pl=2}
    matrixMap[21].bonus = {St=1}
    matrixMap[22].bonus = {St=1}
    matrixMap[24].bonus = {Card=3}
    matrixMap[26].bonus = {Ti=1}
    matrixMap[27].bonus = {Pl=1}
    matrixMap[28].bonus = {Pl=3}
    matrixMap[29].bonus = {St=1}
    matrixMap[30].bonus = {St=2}
    matrixMap[34].bonus = {Card=2,StdRsrc=1}
    matrixMap[36].bonus = {Pl=2}
    matrixMap[37].bonus = {Pl=1}
    matrixMap[38].bonus = {Ti=1}
    matrixMap[39].bonus = {St=2}
    matrixMap[44].bonus = {MICROBE=3}
    matrixMap[45].bonus = {Pl=1}
    matrixMap[50].bonus = {Rsrc=1,Card=2,SCIENCE=1}
    matrixMap[51].bonus = {Pl=2}
    matrixMap[53].bonus = {St=1}
    matrixMap[54].bonus = {St=1}
    matrixMap[60].bonus = {StdRsrc=1,St=1,StdRsrc=1}

    matrixMap[1].reserve=true
    matrixMap[2].reserve=true
    matrixMap[3].reserve=true
    matrixMap[4].reserve=true

    matrixMap[6].reserve=true
    matrixMap[9].reserve=true

    matrixMap[18].reserve=true
    matrixMap[36].reserve=true
    matrixMap[37].reserve=true

    matrixMap[44].reserve=true
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
