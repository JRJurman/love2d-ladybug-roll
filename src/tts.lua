local tts = {}
ttsText = ''
repeatingText = 0

-- repeat at any time
function tts.repeatText()
	print('tts: repeating...')
	repeatingText = 0.5
end

-- title screen
function tts.readTitleScreen()
	ttsText = 'Ladybug Roll, created by Jesse Jurman. Press enter or space to start.'
	print('tts: '..ttsText)
end

-- game screen
function tts.rollingDice()
	ttsText = 'Rolling dice'
	print('tts: '..ttsText)
end

function tts.readCharactersPreview()
	local actionText = ''
	for index, action in ipairs(enemyActions) do
		if index > 1 then
			actionText = actionText..', and '
		end
		if action.type == 'ATK' then
			actionText = actionText..'attack for '..action.value..' damage'
		end
		if action.type == 'DEF' then
			actionText = actionText..'block '..action.value..' future damage'
		end
	end
	local enemyStatus = 'You are facing off against a '..enemyConfig.name..' with '..enemyHP..' health, and '..enemyBLK..' block. '
	local enemyActionText = 'They are planning to '..actionText..'. '
	local instructions = ''
	if stage == 1 then
		instructions = 'Press right to learn more about the enemy, or left to see your own stats. Press down to view your dice.'
	end
	ttsText = enemyStatus..enemyActionText..instructions
	print('tts: '..ttsText)
end

function tts.readCharactersUpdate()
	local actionText = ''
	for index, action in ipairs(enemyActions) do
		if index > 1 then
			actionText = actionText..', and '
		end
		if action.type == 'ATK' then
			actionText = actionText..'attack for '..action.value..' damage'
		end
		if action.type == 'DEF' then
			actionText = actionText..'block '..action.value..' future damage'
		end
	end
	local enemyStatus = enemyConfig.name..' is still standing with '..enemyHP..' health, and '..enemyBLK..' block. '
	local enemyActionText = 'They are planning to '..actionText..'.'
	ttsText = enemyStatus..enemyActionText
	print('tts: '..ttsText)
end

function tts.readDiceTrayPreview()
	local diceOptions = ''
	for index, die in ipairs(activeDice) do
		local dieConfig = diceBag[die.diceBagIndex]
		diceOptions = diceOptions..', a '..dieConfig.shortLabel..' '..die.value
		if (die.assignment) then
			diceOptions = diceOptions..' (assigned)'
		end
	end
	ttsText = 'You have rolled '..#activeDice..' dice;'..diceOptions..'. Press right to scan and assign these dice. Press down after assigning dice to confirm your selection and attack!'
	print('tts: '..ttsText)
end

function tts.readDiceAssignment()
	local assignedAttackDiceText = ''
	local assignedDefenseDiceText = ''
	local assignedDice = getAssignedDiceIndexes(activeDice)

	for index, assignedDieIndex in ipairs(assignedDice) do
		local die = activeDice[assignedDieIndex]
		local dieConfig = diceBag[die.diceBagIndex]

		if (die.assignment == 'ATK') then
			assignedAttackDiceText = assignedAttackDiceText..', a '..dieConfig.shortLabel..' '..die.value
		end
		if (die.assignment == 'DEF') then
			assignedDefenseDiceText = assignedDefenseDiceText..', a '..dieConfig.shortLabel..' '..die.value
		end
	end

	-- if there were no dice assigned, replace text with that
	if #assignedAttackDiceText == 0 then
		assignedAttackDiceText = 'no dice'
	end

	if #assignedDefenseDiceText == 0 then
		assignedDefenseDiceText = 'no dice'
	end

	ttsText = 'You are attacking with '..assignedAttackDiceText..' and are defending with '..assignedDefenseDiceText..'. Press X to confirm.'
	print('tts: '..ttsText)
end

function tts.readSelectedDie()
	local selectedDie = activeDice[selectedDiceIndex]
	local dieConfig = diceBag[selectedDie.diceBagIndex]

	local dieSlot = ''
	if selectedDiceIndex == 1 then
		dieSlot = 'First Die, a '
	elseif selectedDiceIndex == 2 then
		dieSlot = 'Second Die, a '
	elseif selectedDiceIndex == 2 then
		dieSlot = 'Third Die, a '
	elseif selectedDiceIndex == 2 then
		dieSlot = 'Fourth Die, a '
	end

	local dieDescription = ''
	dieDescription = dieDescription..dieConfig.label..' with '..selectedDie.value..' face up. '
	dieDescription = dieDescription..'A '..dieConfig.label..' gets '..dieConfig.buff..'. '
	if selectedDie.assignment then
		dieDescription = dieDescription..'Assigned for '..(selectedDie.assignment == 'ATK' and 'attacking' or 'defending')..'. '
	else
		dieDescription = dieDescription..'Not currently assigned. Press A to use for Attacking, and D to use for Defending.'
	end
	ttsText = dieSlot..dieDescription
	print('tts: '..ttsText)
end

function tts.readAssignmentResult()
	-- should probably just be a sound effect
	print('tts: Assigned!')
end

return tts
