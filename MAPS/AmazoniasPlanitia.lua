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
    for i = 1,19 do
        oxygenSnapMap[i]  = 214 + 20-i
        oxygenBonusMap[i] = {PLAYER={TERRAFORM=1},EVERYONE={}}
    end
    oxygenBonusMap[8] = {PLAYER={TERRAFORM=1,Card=1},EVERYONE={}}
    oxygenBonusMap[12] = {PLAYER={TERRAFORM=1,Temperature=1},EVERYONE={}}
end
function initTemperatureSnapMap()
    for i = 1,23 do
        temperatureSnapMap[i]  = 191 + i
        temperatureBonusMap[i]={PLAYER={TERRAFORM=1},EVERYONE={}}
    end
    temperatureBonusMap[4]={PLAYER={TERRAFORM=1,ProdHe=1},EVERYONE={}}
    temperatureBonusMap[6]={PLAYER={TERRAFORM=1,ProdHe=1},EVERYONE={}}
    temperatureBonusMap[11]={PLAYER={TERRAFORM=1,ProdPl=1},EVERYONE={}}
    temperatureBonusMap[16]={PLAYER={TERRAFORM=1,Ocean=1},EVERYONE={}}
end
function initOtherSnap()
    oceanSnap = 237
    for i = 1,7 do
        milestoneSnapMap[i] = i + 240
    end
    for i = 1,7 do
        awardSnapMap[i] = i + 250
    end
    dustStormSnap = 262
    erosionSnap = 259
end

function initMap()
    for i = 1,91 do
        matrixMap[i].snap  =  i
    end
    --BONUS
    matrixMap[1].bonus = {St=1}
    matrixMap[2].bonus = {St=2}
    matrixMap[3].bonus = {St=1}
    matrixMap[4].bonus = {Card=1}
    matrixMap[5].bonus = {Ti=2}
    matrixMap[8].bonus = {Delegate=1}
    matrixMap[9].bonus = {St=1}
    matrixMap[11].bonus = {Pl=1}
    matrixMap[12].bonus = {Pl=2}
    matrixMap[13].bonus = {Ti=2}
    matrixMap[14].bonus = {St=2}
    matrixMap[16].bonus = {Card=2}
    matrixMap[18].bonus = {Pl=1}
    matrixMap[22].bonus = {Ti=1}
    matrixMap[26].bonus = {Pl=1}
    matrixMap[27].bonus = {Pl=1}
    matrixMap[28].bonus = {Pl=2}
    matrixMap[29].bonus = {Pl=1}
    matrixMap[30].bonus = {Pl=1,Card=1}

    matrixMap[31].bonus = {St=2}
    matrixMap[32].bonus = {Pl=1}
    matrixMap[33].bonus = {StdRsrc=1}
    matrixMap[34].bonus = {Pl=1}
    matrixMap[35].bonus = {Card=1}
    matrixMap[36].bonus = {Pl=1}
    matrixMap[37].bonus = {Pl=2}
    matrixMap[38].bonus = {Pl=1}
    matrixMap[39].bonus = {StdRsrc=1}
    matrixMap[40].bonus = {Pl=2}

    matrixMap[41].bonus = {Pl=1}
    matrixMap[42].bonus = {Pl=1}
    matrixMap[43].bonus = {Pl=2}
    matrixMap[44].bonus = {Pl=2}
    matrixMap[45].bonus = {Pl=2}
    matrixMap[46].bonus = {Pl=2}
    matrixMap[47].bonus = {Pl=2,St=1}
    matrixMap[48].bonus = {Pl=1}
    matrixMap[50].bonus = {Pl=1}
    matrixMap[51].bonus = {Card=1}


    matrixMap[52].bonus = {Pl=1}
    matrixMap[53].bonus = {Pl=2}
    matrixMap[54].bonus = {Pl=2}
    matrixMap[55].bonus = {En=2}
    matrixMap[56].bonus = {En=1}
    matrixMap[57].bonus = {En=2}
    matrixMap[59].bonus = {Pl=1}
    matrixMap[60].bonus = {Pl=1}

    matrixMap[62].bonus = {Pl=1}
    matrixMap[63].bonus = {Card=2}
    matrixMap[64].bonus = {Pl=1}
    matrixMap[65].bonus = {En=1}
    matrixMap[66].bonus = {En=2}
    matrixMap[67].bonus = {Pl=1}
    matrixMap[68].bonus = {Delegate=2}
    matrixMap[69].bonus = {St=1}
    matrixMap[70].bonus = {Delegate=1}

    matrixMap[71].bonus = {St=1,Ti=1}
    matrixMap[73].bonus = {Ti=1}
    matrixMap[76].bonus = {Pl=2}
    matrixMap[78].bonus = {Ti=1}

    matrixMap[81].bonus = {StdRsrc=1}
    matrixMap[83].bonus = {Pl=3}
    matrixMap[84].bonus = {Pl=2}
    matrixMap[85].bonus = {St=2}

    matrixMap[87].bonus = {St=1,Ti=1}
    matrixMap[88].bonus = {St=2}
    matrixMap[90].bonus = {Pl=1}
    matrixMap[91].bonus = {Card=1}

    matrixMap[7].reserve=true
    matrixMap[12].reserve=true
    matrixMap[13].reserve=true
    matrixMap[14].reserve=true

    matrixMap[19].reserve=true

    matrixMap[23].reserve=true

    matrixMap[35].reserve=true
    matrixMap[40].reserve=true
    matrixMap[45].reserve=true
    matrixMap[46].reserve=true

    matrixMap[51].reserve=true
    matrixMap[54].reserve=true

    matrixMap[63].reserve=true

    matrixMap[71].reserve=true
    matrixMap[79].reserve=true


end

projects={
--    powerPlant={
--    click_function = 'powerPlantProject', function_owner = self, label = "",
--        position = {-1.011,0.11,0.39},rotation={0,0,0},width = 30, height = 30, font_size = 30,font_color={0,0,0,0},color={0,0,0,0.7},hover_color={0,0,0,0},tooltip="Power Plant"
--    },
--    asteroid={
--    click_function = 'asteroidProject', function_owner = self, label = "",
--       position = {-1.011,0.11,0.455},rotation={0,0,0},width = 30, height = 30, font_size = 30,font_color={0,0,0,0},color={0,0,0,0.7},hover_color={0,0,0,0},tooltip="Asteroid"
--    },
--    buildColony={
--    click_function = 'buildColonyProject', function_owner = self, label = "",
--        position = {-1.074,0.2,-0.08},rotation={0,0,0},width = 30, height = 30, font_size = 30,font_color={0,0,0,0},color={0,0,0,0.7},hover_color={0,0,0,0},tooltip="Road"
--    },
--    aquifer={
--    click_function = 'aquiferProject', function_owner = self, label = "",
--       position = {-1.011,0.11,0.52},rotation={0,0,0},width = 30, height = 30, font_size = 30,font_color={0,0,0,0},color={0,0,0,0.7},hover_color={0,0,0,0},tooltip="Aquifer"
--    },
--    greenery={
--    click_function = 'greeneryProject', function_owner = self, label = "",
--        position = {-1.011,0.11,0.583},rotation={0,0,0},width = 30, height = 30, font_size = 30,font_color={0,0,0,0},color={0,0,0,0.7},hover_color={0,0,0,0},tooltip="Greenery"
--    },
--    city={
--    click_function = 'cityProject', function_owner = self, label = "",
--        position = {-1.011,0.11,0.642},rotation={0,0,0},width = 30, height = 30, font_size = 30,font_color={0,0,0,0},color={0,0,0,0.7},hover_color={0,0,0,0},tooltip="City"
--    },
}
