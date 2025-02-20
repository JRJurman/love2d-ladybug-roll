local Die = {}

local pipAssets = {
	love.graphics.newImage('Assets/1-pip.png'),
	love.graphics.newImage('Assets/2-pip.png'),
	love.graphics.newImage('Assets/3-pip.png'),
	love.graphics.newImage('Assets/4-pip.png'),
	love.graphics.newImage('Assets/5-pip.png'),
	love.graphics.newImage('Assets/6-pip.png'),
}

-- Function to create a canvas with a rendered die face
function Die.createCanvas(graphic, value)
	local canvasSize = 32
	local canvas = love.graphics.newCanvas(canvasSize, canvasSize)

	love.graphics.setCanvas(canvas)
	love.graphics.clear()

	love.graphics.setColor(1,1,1)
	love.graphics.draw(graphic, 0, 0)

	-- Draw pips
	if value > 0 and value < 7 then
		love.graphics.draw(pipAssets[value], 0, 0)
	end

	-- Apply nearest neighbor filter to fix aliasing when we enlarge the image
	canvas:setFilter("nearest", "nearest")

	return canvas
end

function Die.draw(canvas, x, y, size, selected)
	-- If selected, draw a border
	if selected then
		newLospecColor(29)
		love.graphics.rectangle('fill', x - 5, y - 5, size * 1.125, size * 1.125, 5, 5)
	end

	-- Draw the cached die image
	love.graphics.setColor(1, 1, 1) -- Ensure full brightness
	love.graphics.draw(canvas, x, y, 0, size / 32, size / 32)
end

return Die
