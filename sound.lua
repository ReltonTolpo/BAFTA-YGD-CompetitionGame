sound = {}

function sound.load()

	--Import sounds here
	sound.bg_music = love.audio.newSource("/Sounds/BackgroundMusic-Planet.wav")
	sound.bg_music_space = love.audio.newSource("/Sounds/ambientSpace.wav")
	sound.walking_sfx = love.audio.newSource("/Sounds/Walking.wav")
	sound.shot_fx = love.audio.newSource("/Sounds/shot.wav")

	sound.loopBackground = true --Will backround music loop

	sound.bg_music:setLooping(sound.loopBackground)
	sound.bg_music_space:setLooping(sound.loopBackground)
	
	sound.bg_music:setVolume(0.2)
	sound.bg_music_space:setVolume(0.2)

end

function sound.update()

	--TODO LOGIC CODE

end

function UPDATE_SOUND(dt)

	sound.update()

end
