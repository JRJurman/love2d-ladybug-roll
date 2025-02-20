local Button = require('../Components/Button')
local Nameplate = require('../Components/Nameplate')
local Heart = require('../Components/Heart')
local Shield = require('../Components/Shield')

local Player = {}

local ladybugAsset = love.graphics.newImage('Assets/ladybug.png')

function Player.createCanvas()
	local canvas = love.graphics.newCanvas(64, 64)

	love.graphics.setCanvas(canvas)
	love.graphics.clear()

	love.graphics.setColor(1,1,1)
	love.graphics.draw(ladybugAsset, 0, 0)

	-- Reset canvas
	love.graphics.setColor(1, 1, 1)
	love.graphics.setCanvas()

	-- Apply nearest neighbor filter to fix aliasing when we enlarge the image
	canvas:setFilter("nearest", "nearest")

	return canvas
end

Player.canvas = Player.createCanvas()

function Player.draw(isSelected, hp, block)
	love.graphics.setColor(1,1,1)

	-- draw the player graphic
	local canvas = Player.canvas
	local playerX, playerY = 150, 80
	local playerScale = 3
	love.graphics.draw(canvas, playerX, playerY, 0, playerScale, playerScale)

	-- draw the canvas
	Nameplate.draw(playerX - 50, 240, playerConfig.name, isSelected)

	-- draw the heart and health
	Heart.draw(playerX - 96, 50, hp)
	Shield.draw(playerX - 90, 150, block)
end

return Player
