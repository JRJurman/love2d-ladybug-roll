local StageProgress = require('../Components/StageProgress')
local TextAndGraphic = require('../Components/TextAndGraphic')
local TextBlocks = require('../Data/TextBlocks')
local DiceTray = require('../Components/DiceTray')
local Button = require('../Components/Button')

local IntroScreen = {}
IntroScreen.screen = 4

-- dice set for rendering what's in our starting bag
local dice = {}

function IntroScreen.load()
	screen = IntroScreen.screen
	stage = 1
	selectedRow = 'intro'
	selectedDiceIndex = 0

	for index, dieConfig in ipairs(diceBag) do
		local newDie = { value = dieConfig.max, assignment = nil, diceBagIndex = index, dieConfig = dieConfig }
		table.insert(dice, newDie)
	end

	tts.readIntroLore()
end

function IntroScreen.update(dt)
	if screen ~= IntroScreen.screen then return end
end

function IntroScreen.keypressed(key)
	if screen ~= IntroScreen.screen then return end

	-- change which set of elements we are selecting
	if key == 'up' then
		if selectedRow == 'dice' then
			selectedRow = 'intro'
			tts.readIntroLore()
		elseif selectedRow == 'begin' then
			selectedDiceIndex = 0
			selectedRow = 'dice'
			tts.readIntroDiceTray()
		end
	end

	if key == 'down' then
		if selectedRow == 'intro' then
			selectedDiceIndex = 0
			selectedRow = 'dice'
			tts.readIntroDiceTray()
		elseif selectedRow == 'dice' then
			selectedRow = 'begin'
			tts.readBeginButton()
		end
	end

	if selectedRow == 'dice' then
		if key == 'left' then
			selectedDiceIndex = math.max(selectedDiceIndex - 1, 1)
			tts.readSelectedDiceConfig(diceBag[selectedDiceIndex])
		end
		if key == 'right' then
			selectedDiceIndex = math.min(selectedDiceIndex + 1, #dice)
			tts.readSelectedDiceConfig(diceBag[selectedDiceIndex])
		end
	end

	if selectedRow == 'begin' then
		if key == 'x' then
			TransitionScreen.load(DicePackScreen, true)
		end
	end
end

function IntroScreen.draw()
	if screen ~= IntroScreen.screen then return end

	StageProgress.draw()

	local width = 730
	local x = getXForWidth(width)

	local textBlockHeight = 240
	local textBlockY = 110
	TextAndGraphic.draw(x, textBlockY, width, textBlockHeight, {1,1,1}, selectedRow == 'intro', TextBlocks.introLore, 330)

	DiceTray.draw(x, 365, width, dice, selectedRow == 'dice' and selectedDiceIndex or nil)

	Button.draw(x, 510, width, 50, {1,1,1}, selectedRow == 'begin', 'Begin')
end

return IntroScreen
