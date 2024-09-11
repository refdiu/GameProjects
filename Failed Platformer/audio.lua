Sfx = {sounds = {"cycle.wav", "enemydamage.wav", "hitHurt.wav", "jump.wav"}}

function Sfx:new()
	o = o or {}
	setmetatable(o, self)
	self.__index = self
	return o
end


function Sfx:play(i)
	data = love.sound.newSoundData(self.sounds[i])
	s = love.audio.newSource(data)
	love.audio.play(s)
end

	
