LightForest = {}

function LightForest.draw()
	-- Canvas size (lower res to force pixelation)
	local canvasWidth, canvasHeight = 160, 120
	local backgroundCanvas = love.graphics.newCanvas(canvasWidth, canvasHeight)

	-- Draw on the canvas
	love.graphics.setCanvas(backgroundCanvas)
	love.graphics.clear()

	-- Background (Sky)
	love.graphics.setColor(0.5, 0.8, 1)
	love.graphics.rectangle("fill", 0, 0, canvasWidth, canvasHeight)

	-- Darker hill in the back
	love.graphics.setColor(0, 0.5, 0)
	love.graphics.circle("fill", 130, canvasHeight + 10, 90)

	-- Lighter hill in the front
	love.graphics.setColor(0.1, 0.7, 0.1)
	love.graphics.circle("fill", 40, canvasHeight + 40, 90)

	love.graphics.setColor(1, 1, 1)

	-- Reset canvas
	love.graphics.setCanvas()
	backgroundCanvas:setFilter("nearest", "nearest") -- Pixelated effect

	-- Scale the canvas for pixelation effect
	love.graphics.draw(backgroundCanvas, 0, 0, 0, 5, 5) -- Scales up to fit the screen
end

return LightForest
