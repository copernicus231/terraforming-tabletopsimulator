require("../UTIL/GetComponents")

function onLoad(save_state)
    getBoard("WorldGoverment").call("policyChange",{index=self.getStateId(),guid=self.getGUID()})
end
