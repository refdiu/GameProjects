Features = {}

function Features:new()
	o = o or {}
	setmetatable(o, self)
	self.__index = self
	return o
end


function Features:cond_p1(SCROLL_FACTOR)
	if SCROLL_FACTOR >= -550 and SCROLL_FACTOR <= -498 or SCROLL_FACTOR >= -900 and SCROLL_FACTOR <= -862 then
		check = true
	else
		check = false
	end
	return check
end

function Features:cond_p2(SCROLL_FACTOR)
	if SCROLL_FACTOR >= -139 and SCROLL_FACTOR <= -75 then
		check = true
	else
		check = false
	end
	return check
end


function Features:checklvl2(SCROLL_FACTOR, Yp)
	if Yp >= -336 and Yp <= -335 then
		for i = 1, 10 do
			if SCROLL_FACTOR == self.values[i] then
				g = self.values[i]
			else
				g = false
			end
		end
		return g
	end
end


