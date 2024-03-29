Tag={name="",count=0,discount=0,income=0}
function Tag:new(o)
    o = o or {}
    setmetatable(o, self)
    self.__index = self
  return o
end

function Tag:addCount(step)
    if self.count + step < 0 then
        self.count = 0
    else
        self.count = self.count + step
    end
    return self.count
end

function Tag:addDiscount(step)
    if self.discount + step > 0 then
        self.discount = 0
    else
        self.discount = self.discount + step
    end
    return self.discount
end

function Tag:addIncome(step)
    if self.income + step < 0 then
        self.income = 0
    else
        self.income = self.income + step
    end
    return self.income
end
