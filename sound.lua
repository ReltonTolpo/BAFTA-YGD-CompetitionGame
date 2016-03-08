sound = {}

function sound.load()

	--Import sounds here
	sound.bg_music = love.audio.newSource("/sounds/BackgroundMusic-Planet.wav")
	sound.walking_sfx = love.audio.newSource("/sounds/Walking.wav")

	sound.loopBackground = true --Will backround music loop

	sound.bg_music:setLooping(sound.loopBackground)
	sound.bg_music:setVolume(0.6)
	
	sound.bg_music:play()

end

function sound.update()

	--TODO LOGIC CODE

end

function UPDATE_SOUND(dt)

	sound.update()

end
