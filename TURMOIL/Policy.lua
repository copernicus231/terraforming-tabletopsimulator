require("../UTIL/GetComponents")

function onLoad(save_state)
    getBoard("WorldGoverment").setVar("currentIndex",self.getStateId())
    getBoard("WorldGoverment").setVar("rulePolicy",self.getGUID())
end
