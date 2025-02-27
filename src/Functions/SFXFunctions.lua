local SFX = {
	selectSFX = love.audio.newSource('Assets/sfx-select.wav', 'static'),
	selectBackSFX = love.audio.newSource('Assets/sfx-select-back.wav', 'static'),
	invalidSelectSFX = love.audio.newSource('Assets/sfx-invalid-select.wav', 'static'),
	transitionSFX = love.audio.newSource('Assets/sfx-transition.wav', 'static'),
	attackSFX = love.audio.newSource('Assets/sfx-attack.wav', 'static'),
	blockSFX = love.audio.newSource('Assets/sfx-block.wav', 'static'),
	specialActionSFX = love.audio.newSource('Assets/sfx-special-action.wav', 'static'),
}

function selectSFX()
	SFX.selectSFX:setVolume(masterVolume * sfxVolume)
	love.audio.play(SFX.selectSFX)
end

function selectBackSFX()
	SFX.selectBackSFX:setVolume(masterVolume * sfxVolume)
	love.audio.play(SFX.selectBackSFX)
end

function invalidSelectSFX()
	SFX.invalidSelectSFX:setVolume(masterVolume * sfxVolume)
	love.audio.play(SFX.invalidSelectSFX)
end

function transitionSFX()
	SFX.transitionSFX:setVolume(masterVolume * sfxVolume)
	love.audio.play(SFX.transitionSFX)
end

function attackSFX()
	SFX.attackSFX:setVolume(masterVolume * sfxVolume)
	love.audio.play(SFX.attackSFX)
end

function blockSFX()
	SFX.blockSFX:setVolume(masterVolume * sfxVolume)
	love.audio.play(SFX.blockSFX)
end

function specialActionSFX()
	SFX.specialActionSFX:setVolume(masterVolume * sfxVolume)
	love.audio.play(SFX.specialActionSFX)
end
