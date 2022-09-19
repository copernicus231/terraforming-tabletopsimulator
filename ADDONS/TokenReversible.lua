require("../UTIL/GetComponents")
function onLoad(save_state)
    bottomFlip= {
        index = 0, click_function = 'done', function_owner = self, label = "",
        position = {0,0,0},rotation=self.getRotation(), width = 600, height = 600, font_size = 360,font_color={0,0,0,100},color={253/255, 231/255, 46/255,0},scale={x=1, y=1, z=1},tooltip = "Ready"
    }
    if self.is_face_down then
        click_function = 'pending'
    end
    self.createButton(bottomFlip)
end

function callFunction()
    getDraftHandler().call("pick",{state=self.is_face_down})
end

function getState()
    return self.is_face_down
end

function done()
    if not self.is_face_down then
        self.flip()
    end
    Wait.condition(function() self.editButton({index=0,click_function='pending',rotation=self.getRotation()});callFunction() end,function() return self.resting end)

end

function pending()
    if self.is_face_down then
        self.flip()
    end
    Wait.condition(function() self.editButton({index=0,click_function='done',rotation=self.getRotation()});callFunction() end,function() return self.resting end)

end
