local Heart = {}

local heartAsset = love.graphics.newImage('Assets/ui-heart.png')
local heartAssetSize = 32

-- Function to create a canvas with a heart icon
function Heart.createCanvas()
	local canvas = love.graphics.newCanvas(32, 32)

	love.graphics.setCanvas(canvas)
	love.graphics.clear()

	love.graphics.setColor(1,1,1)
	love.graphics.draw(heartAsset, 0, 0)

	-- Reset canvas
	love.graphics.setColor(1, 1, 1)
	love.graphics.setCanvas()

	-- Apply nearest neighbor filter to fix aliasing when we enlarge the image
	canvas:setFilter("nearest", "nearest")

	return canvas
end

Heart.canvas = Heart.createCanvas()

function Heart.draw(x, y, value, size)
	love.graphics.setColor(1, 1, 1)
	love.graphics.draw(Heart.canvas, x, y, 0, size / heartAssetSize, size / heartAssetSize)
	setLospecColor(01)
	love.graphics.setFont(getFont(40))
	love.graphics.printf(value, x, y + 10, size, 'center')
end

return Heart
