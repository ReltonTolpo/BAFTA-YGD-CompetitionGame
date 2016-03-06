sound = {}

function sound.load()

	--import sounds here
	sound.bg_music = love.audio.newSource("/sounds/BackgroundMusic.wav")
	sound.walking_sfx = love.audio.newSource("/sounds/Walking.wav")

	sound.loopBackground = true --will backround music loop

	sound.bg_music:setLooping(sound.loopBackground)
	sound.bg_music:play()

end

function sound.update()



end

function UPDATE_SOUND(dt)

	sound.update()

end
