require("../CORE/BigMatrix")
require("../MAPS/BoardBase")
TICKNES=0.2
isBigMap = true
function initTrSnapMap()
    for i=1,100 do
        trSnapMap[i] = 91+i
    end
end
function initOxygenSnapMap()
    for i = 1,18 do
        oxygenSnapMap[i]  = 214 + 19-i
        oxygenBonusMap[i] = {PLAYER={TERRAFORM=1},EVERYONE={}}
    end
    oxygenBonusMap[7] = {PLAYER={TERRAFORM=1,ProdHe=1},EVERYONE={}}
    oxygenBonusMap[11] = {PLAYER={TERRAFORM=1,Temperature=1},EVERYONE={}}
end
function initTemperatureSnapMap()
    for i = 1,23 do
        temperatureSnapMap[i]  = 191 + i
        temperatureBonusMap[i]={PLAYER={TERRAFORM=1},EVERYONE={}}
    end
    temperatureBonusMap[6]={PLAYER={TERRAFORM=1,ProdHe=1},EVERYONE={}}
    temperatureBonusMap[9]={PLAYER={TERRAFORM=1,ProdHe=1},EVERYONE={}}
    temperatureBonusMap[15]={PLAYER={TERRAFORM=1,Card=1},EVERYONE={}}
    temperatureBonusMap[19]={PLAYER={TERRAFORM=1,Ocean=1},EVERYONE={}}
end
function initOceanSnap()
    oceanSnap = 236
end

function initMap()
    for i = 1,91 do
        matrixMap[i].snap  =  i
    end
    --BONUS
    matrixMap[2].bonus = {He=1}
    matrixMap[3].bonus = {He=2}
    matrixMap[4].bonus = {He=2}
    matrixMap[5].bonus = {He=1}
    matrixMap[7].bonus = {St=1}
    matrixMap[9].bonus = {Card=3}
    matrixMap[14].bonus = {St=1,Pl=1}
    matrixMap[15].bonus = {MICROBE=1}
    matrixMap[16].bonus = {Pl=1}
    matrixMap[17].bonus = {Pl=1}
    matrixMap[19].bonus = {Pl=1}
    matrixMap[20].bonus = {Pl=2}
    matrixMap[21].bonus = {MICROBE=2}
    matrixMap[22].bonus = {Pl=1}
    matrixMap[23].bonus = {Pl=3}
    matrixMap[24].bonus = {Card=1}
    matrixMap[25].bonus = {Pl=2}
    matrixMap[27].bonus = {Card=1}
    matrixMap[28].bonus = {Ti=1}
    matrixMap[29].bonus = {Pl=2}
    matrixMap[30].bonus = {Pl=2}
    matrixMap[31].bonus = {Pl=1}
    matrixMap[32].bonus = {Pl=1}
    matrixMap[33].bonus = {Pl=2}
    matrixMap[34].bonus = {Pl=1}
    matrixMap[35].bonus = {Pl=1}
    matrixMap[36].bonus = {Ti=1}
    matrixMap[37].bonus = {Ti=2}
    matrixMap[40].bonus = {St=2}
    matrixMap[42].bonus = {Pl=1}
    matrixMap[43].bonus = {Pl=1}
    matrixMap[44].bonus = {Pl=1}
    matrixMap[45].bonus = {Pl=1}
    matrixMap[50].bonus = {St=1}
    matrixMap[52].bonus = {Pl=1}
    matrixMap[55].bonus = {Pl=2}
    matrixMap[56].bonus = {St=1}
    matrixMap[57].bonus = {Ti=1}
    matrixMap[60].bonus = {St=2}
    matrixMap[61].bonus = {St=2}
    matrixMap[62].bonus = {Pl=1}
    matrixMap[63].bonus = {Pl=1}
    matrixMap[64].bonus = {Pl=2}
    matrixMap[65].bonus = {Ti=1}
    matrixMap[67].bonus = {St=1}
    matrixMap[69].bonus = {St=1}
    matrixMap[70].bonus = {St=1,Card=1}
    matrixMap[71].bonus = {St=1}
    matrixMap[72].bonus = {Card=1}
    matrixMap[73].bonus = {Pl=1}
    matrixMap[74].bonus = {St=1}
    matrixMap[75].bonus = {Ti=1}
    matrixMap[77].bonus = {Ti=1}
    matrixMap[79].bonus = {Ti=1}
    matrixMap[80].bonus = {Pl=2}
    matrixMap[83].bonus = {Ti=1}
    matrixMap[84].bonus = {Ti=1,Card=1}
    matrixMap[88].bonus = {St=1}
    matrixMap[89].bonus = {St=1}


    matrixMap[15].reserve=true
    matrixMap[20].reserve=true
    matrixMap[21].reserve=true
    matrixMap[24].reserve=true

    matrixMap[26].reserve=true

    matrixMap[33].reserve=true
    matrixMap[34].reserve=true
    matrixMap[35].reserve=true
    matrixMap[36].reserve=true

    matrixMap[44].reserve=true
    matrixMap[50].reserve=true
    matrixMap[51].reserve=true

    matrixMap[61].reserve=true
    matrixMap[64].reserve=true
    matrixMap[66].reserve=true
    matrixMap[72].reserve=true
    matrixMap[80].reserve=true

end

projects={
    powerPlant={
    click_function = 'powerPlantProject', function_owner = self, label = "",
        position = {-1.011,0.11,0.39},rotation={0,0,0},width = 30, height = 30, font_size = 30,font_color={0,0,0,0},color={0,0,0,0.7},hover_color={0,0,0,0},tooltip="Power Plant"
    },
    asteroid={
    click_function = 'asteroidProject', function_owner = self, label = "",
        position = {-1.011,0.11,0.455},rotation={0,0,0},width = 30, height = 30, font_size = 30,font_color={0,0,0,0},color={0,0,0,0.7},hover_color={0,0,0,0},tooltip="Asteroid"
    },
--    buildColony={
--    click_function = 'buildColonyProject', function_owner = self, label = "",
--        position = {-1.074,0.2,-0.08},rotation={0,0,0},width = 30, height = 30, font_size = 30,font_color={0,0,0,0},color={0,0,0,0.7},hover_color={0,0,0,0},tooltip="Road"
--    },
    aquifer={
    click_function = 'aquiferProject', function_owner = self, label = "",
        position = {-1.011,0.11,0.52},rotation={0,0,0},width = 30, height = 30, font_size = 30,font_color={0,0,0,0},color={0,0,0,0.7},hover_color={0,0,0,0},tooltip="Aquifer"
    },
    greenery={
    click_function = 'greeneryProject', function_owner = self, label = "",
        position = {-1.011,0.11,0.583},rotation={0,0,0},width = 30, height = 30, font_size = 30,font_color={0,0,0,0},color={0,0,0,0.7},hover_color={0,0,0,0},tooltip="Greenery"
    },
    city={
    click_function = 'cityProject', function_owner = self, label = "",
        position = {-1.011,0.11,0.642},rotation={0,0,0},width = 30, height = 30, font_size = 30,font_color={0,0,0,0},color={0,0,0,0.7},hover_color={0,0,0,0},tooltip="City"
    },
}
