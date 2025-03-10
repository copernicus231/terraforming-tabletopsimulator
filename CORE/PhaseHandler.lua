require("../UTIL/GetComponents")
isPreludePhase=false
isColoniesPhase=false
isTurmoilPhase=false

--224897213
function onSave()
    local data_to_save = {click_function=setupButton.click_function,label=setupButton.label,isPreludePhase=isPreludePhase,
    isColoniesPhase=isColoniesPhase,isTurmoilPhase=isTurmoilPhase,tooltip=setupButton.tooltip}
    save_state = JSON.encode(data_to_save)
    return save_state
end
function onLoad(save_state)
    setupButton = {
        index = 0, click_function = 'setup', function_owner = self, label = "<<Setup>>",
        position = {0,0.2,0.7}, width = 1000, height = 250, font_size = 100,font_color={0,0,0,100},color={1,1,1,0.5},tooltip="Setup"
    }
    if save_state != nil and save_state != '' then
        local json = JSON.decode(save_state)
        setupButton.click_function=json.click_function
        setupButton.label=json.label
        setupButton.tooltip=json.tooltip
        isPreludePhase=json.isPreludePhase or isPreludePhase
        isColoniesPhase=json.isColoniesPhase or isColoniesPhase
        isTurmoilPhase=json.isTurmoilPhase or isTurmoilPhase
    end
    self.createButton(setupButton)
end

function setupPlayerBoards()
        for i,color in pairs(Global.call("getPlayers")) do
            getPlayerBoard(color).call("setProduction",{resource="MC",value=0})
            getPlayerBoard(color).call("setProduction",{resource="St",value=0})
            getPlayerBoard(color).call("setProduction",{resource="Ti",value=0})
            getPlayerBoard(color).call("setProduction",{resource="En",value=0})
            getPlayerBoard(color).call("setProduction",{resource="Pl",value=0})
            getPlayerBoard(color).call("setProduction",{resource="He",value=0})
        end
end
function producePlayerBoards()
    local resources = {"MC","St","Ti","Pl","En","He"}
    for i,color in pairs(Global.call("getPlayers")) do
        local sumarize={}
        for i,resource in pairs(resources) do
            sumarize[resource] = {}
            sumarize[resource]["old"] = getPlayerBoard(color).call("getResourceCount",{resource=resource})
            sumarize[resource]["new"] = getPlayerBoard(color).call("getProduction",{resource=resource})
        end
        local tr = getBoard("BaseGame").call("getTrackLevel",{color=color,track="tr"})
        getPlayerBoard(color).call("energyToHeat")
        getPlayerBoard(color).call("produceAll",{tr=tr})
        sumarize["MC"]["total"] = sumarize["MC"].old+sumarize["MC"].new + tr
        sumarize["St"]["total"] = sumarize["St"].old+sumarize["St"].new
        sumarize["Ti"]["total"] =sumarize["Ti"].old+sumarize["Ti"].new
        sumarize["Pl"]["total"] =sumarize["Pl"].old+sumarize["Pl"].new
        sumarize["En"]["total"] =sumarize["En"].new
        sumarize["He"]["total"] = sumarize["He"].old+sumarize["He"].new+sumarize["En"].old
        printToAll(string.format("%s sumary:\n\tMC: %s + %s (Prod) + %s(TR) -> %s\n\tSt: %s + %s (Prod) -> %s\n\tTi: %s + %s (Prod) -> %s\n\tPl: %s + %s (Prod) -> %s\n\tEn: %s (Prod) -> %s\n\tHe: %s + %s (Prod) + %s (En) -> %s\n\t",
        self.getDescription(),
        tostring(sumarize["MC"].old),tostring(sumarize["MC"].new),tostring(tr),tostring(sumarize["MC"].total),
        tostring(sumarize["St"].old),tostring(sumarize["St"].new),tostring(sumarize["St"].total),
        tostring(sumarize["Ti"].old),tostring(sumarize["Ti"].new),tostring(sumarize["Ti"].total),
        tostring(sumarize["Pl"].old),tostring(sumarize["Pl"].new),tostring(sumarize["Pl"].total),
        tostring(sumarize["En"].new),tostring(sumarize["En"].total),
        tostring(sumarize["He"].old),tostring(sumarize["He"].new),tostring(sumarize["En"].old),tostring(sumarize["He"].total)
        ),Color.fromString(color))
        --validation
    end
end
function setupModules()
    getBoard("BaseGame").call("setup",{})
    getBoard("VenusNext").call("setup",{})
    getBoard("GlobalEvent").call("setup",{})
    Wait.frames(function() getBoard("SpacePort").call("setup",{}) end,170)
    getBoard("PathFinders").call("setup",{})

    getBag("SpecialTile").call("setup",{})
    getBoard("Luna").call("setup",{})
    getBoard("Nuclear").call("setup",{})
    getBag("EarlyBase").call("setup",{})
    getBag("Milestone").call("setup",{})
    --local obj4 = getObjectsWithAllTags({"Card","Infrastructure"})
    --delay = 20
    --for i,a in ipairs(obj4) do
    --    Wait.frames(function()  a.setPositionSmooth(vector(56.78, 1.07, -10.20) + vector(0, 3, 0)) end,delay)
    --    delay = delay + 20
    --end
    Wait.frames(function()  getBag("Gagarin").call("setup",{}) end,200)

    --getObjectFromGUID("392f08").call("setup",{})
    --ADD OTHER MODULES
end
function setupDecks()
    local obj3 = getObjectsWithAllTags({"Card","Project"})
    local delay = 20
    for i,a in ipairs(obj3) do
        Wait.frames(function() a.flip(); a.setPositionSmooth(getDrawHolder("MainDeck").getPosition() + vector(0, 3, 0)) end,delay)
        delay = delay + 20
    end
 local obj = getObjectsWithAllTags({"Card","Corp"})
 delay = 20
 for i,a in ipairs(obj) do
     Wait.frames(function() a.flip(); a.setPositionSmooth(getDrawHolder("Corp").getPosition() + vector(0, 3, 0)) end,delay)
     delay = delay + 20
 end
 local obj2 = getObjectsWithAllTags({"Card","Prelude"})
 delay = 20
 for i,a in ipairs(obj2) do
     Wait.frames(function() a.flip(); a.setPositionSmooth(getDrawHolder("Prelude").getPosition() + vector(0, 3, 0)) end,delay)
     delay = delay + 20
 end



end
function dealInitalHand()
     local colors = Global.call("getPlayers",{})
     Wait.frames(function() getDrawHolder("MainDeck").call("shuffle",{});getDrawHolder("Corp").call("shuffle",{});getDrawHolder("Prelude").call("shuffle",{}) end,400)
     Wait.frames(function() getDrawHolder("MainDeck").call("dealCards",{colors=colors,n=10}) end,440)
     Wait.frames(function() getDrawHolder("Prelude").call("dealCards",{colors=colors,n=4}) end,500)
     Wait.frames(function() getDrawHolder("Corp").call("dealCards",{colors=colors,n=3}) end,560)
end
function randomFirstPlayer()
    local colors = Global.call("getPlayers",{})
    math.randomseed(os.time())
    return colors[math.random(#colors)]
end
function setupFirstPlayer(color)
    getFirstPlayerToken().setPositionSmooth(getCardPlayTable(color).positionToWorld(Vector(0,3,-1.5)),false,false)
   --Wait.frames(function() getTurnToken().call("setPlayerPosition",color) end, 100)
end
function setup()
    broadcastToAll("<<Setup>>")
    setupPlayerBoards()
    
    setupModules()
    setupDecks()
    dealInitalHand()
    Global.call("setCurrentPlayer",randomFirstPlayer())
    local color = Global.call("getCurrentPlayer")
    setupFirstPlayer(color)
    Wait.frames(function() getTurnToken().call("setPlayerPosition",color) end, 100)
    broadcastToAll("<Research Phase>")
    if isPreludePhase then
        setupButton.click_function = 'preludePhase'
        setupButton.label= "<Prelude Phase>"
        setupButton.tooltip = "Prelude Phase"
        self.editButton({index=0,click_function = 'preludePhase',label = "<Prelude Phase>",tooltip="Prelude Phase"})
    else
        setupButton.click_function = 'actionPhase'
        setupButton.label= "<Action Phase>"
        setupButton.tooltip = "Action Phase"
        self.editButton({index=0,click_function = 'actionPhase',label = "<Action Phase>",tooltip="Action Phase"})
    end
end
function preludePhase()
    broadcastToAll("<Prelude Phase>")
    setupButton.click_function = 'actionPhase'
    setupButton.label= "<Action Phase>"
    setupButton.tooltip = "Action Phase"
    self.editButton({index=0,click_function = 'actionPhase',label = "<Action Phase>",tooltip="Action Phase"})
end
function startGeneration()
    broadcastToAll("<<Start Generation>>")
    getBoard("BaseGame").call("moveTrack",{name = "tr",step = 1,color="Grey"})
    for i,a in pairs(getObjectsWithAllTags({"PlayerStatus","Disable"})) do
         a.setState(1)
    end
    setupButton.click_function = 'playerOrderPhase'
    setupButton.label= "<Player Order Phase>"
    setupButton.tooltip = "Player Order Phase"
    self.editButton({index=0,click_function = 'playerOrderPhase',label = "<Player Order Phase>",tooltip="Player Order Phase"})
end
function playerOrderPhase()
    broadcastToAll("<Player Order Phase>")
    Global.call("setCurrentPlayer",Global.call("getNextPlayer",Global.call("getCurrentPlayer")))
    setupFirstPlayer(Global.call("getCurrentPlayer"))
    setupButton.click_function = 'researchPhase'
    setupButton.label= "<Research Phase>"
    setupButton.tooltip = "Research Phase"
    self.editButton({index=0,click_function = 'researchPhase',label = "<Research Phase>",tooltip="Research Phase"})
end
function researchPhase()
    broadcastToAll("<Research Phase>")
    getDraftHandler().call("startDraft")
    getTurnToken().call("setReadyCount")
    setupButton.click_function = 'actionPhase'
    setupButton.label= "<Action Phase>"
    setupButton.tooltip = "Action Phase"
    self.editButton({index=0,click_function = 'actionPhase',label = "<Action Phase>",tooltip="Action Phase"})
end
function actionPhase()
    broadcastToAll("<Action Phase>")
    setupButton.click_function = 'productionPhase'
    setupButton.label= "<Production Phase>"
    setupButton.tooltip = "Production Phase"
    self.editButton({index=0,click_function = 'productionPhase',label = "<Production Phase>",tooltip="Production Phase"})
end

function productionPhase()
    broadcastToAll("<Production Phase>")
    producePlayerBoards()
    setupButton.click_function = 'solarPhase'
    setupButton.label= "<Solar Phase>"
    setupButton.tooltip = "Solar Phase"
    self.editButton({index=0,click_function = 'solarPhase',label = "<Solar Phase>",tooltip="Solar Phase"})
end

function solarPhase()
    broadcastToAll("<Solar Phase>")
    if endGameCheck() then
        finalScoring()
        return
    end
    setupButton.click_function = 'worldGoverment'
    setupButton.label= "<SP> World Goverment"
    setupButton.tooltip = "World Goverment"
    self.editButton({index=0,click_function = 'worldGoverment',label = "<SP> World Goverment",tooltip="World Goverment"})
end

function worldGoverment()
    broadcastToAll("<Solar Phase> World Goverment")
    if isColoniesPhase then
        setupButton.click_function = 'colonyProduction'
        setupButton.label= "<SP> Colony Production"
        setupButton.tooltip = "Colony Production"
        self.editButton({index=0,click_function = 'colonyProduction',label = "<SP> Colony Production",tooltip="Colony Production"})
    elseif isTurmoilPhase then
        setupButton.click_function = 'turmoil'
        setupButton.label= "<SP> Turmoil"
        setupButton.tooltip = "Turmoil"
        self.editButton({index=0,click_function = 'turmoil',label = "<SP> Turmoil",tooltip="Turmoil"})
    else
        setupButton.click_function = 'startGeneration'
        setupButton.label= "<<Start Generation>>"
        setupButton.tooltip = "Start Generation"
        self.editButton({index=0,click_function = 'startGeneration',label = "<<Start Generation>>",tooltip="Start Generation"})
    end

end

function colonyProduction()
    broadcastToAll("<Solar Phase> Colony Production")
    getBoard("SpacePort").call("nextGeneration",{})
    if isTurmoilPhase then
        setupButton.click_function = 'turmoil'
        setupButton.label= "<SP> Turmoil"
        setupButton.tooltip = "Turmoil"
        self.editButton({index=0,click_function = 'turmoil',label = "<SP> Turmoil",tooltip="Turmoil"})
    else
        setupButton.click_function = 'startGeneration'
        setupButton.label= "<<Start Generation>>"
        setupButton.tooltip = "Start Generation"
        self.editButton({index=0,click_function = 'startGeneration',label = "<<Start Generation>>",tooltip="Start Generation"})
    end

end

function endGameCheck()
    broadcastToAll("<Solar Phase> End Game Check")
    return false
end

function turmoil()
    broadcastToAll("<Solar Phase> Turmoil")
    getBoard("GlobalEvent").call("trRevision",{})
    setupButton.click_function = 'startGeneration'
    setupButton.label= "<<Start Generation>>"
    setupButton.tooltip = "Start Generation"
    self.editButton({index=0,click_function = 'startGeneration',label = "<<Start Generation>>",tooltip="Start Generation"})
end

function finalScoring()
    broadcastToAll("<<Final Scoring>>")
end
