Features = {}

function Features:cond(SCROLL_FACTOR)
	if SCROLL_FACTOR >= -350 and SCROLL_FACTOR <= -299 or SCROLL_FACTOR >= -730 and SCROLL_FACTOR <= -670 then
		check = true
	else
		check = false
	end
	return check
end
