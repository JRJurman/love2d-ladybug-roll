local BlueDie = {
	label="Blue Die",
	shortLabel="Blue",
	min=1, max=3, color={0.3,0.3,0.9},

	buff="gets +2 when assigned for Defending",
	resolveAssignment=function(die)
		if die.assignment == 'DEF' then
			die.value = die.value + 2
		end
	end,

	brokenBuff="+5 starting block on match start",
	onBreaking=function()
		playerStartingBLK = playerStartingBLK + 5
	end
}

local RedDie = {
	label="Red Die",
	shortLabel="Red",
	min=1, max=3, color={0.9,0.3,0.3},

	buff="gets +2 when assigned for Attacking",
	resolveAssignment=function(die)
		if die.assignment == 'ATK' then
			die.value = die.value + 2
		end
	end,

	brokenBuff="-10 to enemy starting block",
	onBreaking=function()
		enemyStartingBLKBonus = enemyStartingBLKBonus - 10
	end
}

local GreenDie = {
	label="Green Die",
	shortLabel="Green",
	min=1, max=3, color={0.3,0.9,0.3},

	buff="heals the player's health by 2 when assigned",
	resolveAssignment=function(die)
		playerHP = math.min(playerHP + 1, playerConfig.startingHP)
	end,

	brokenBuff="+10 to current health",
	onBreaking=function()
		playerHP = playerHP + 10
	end
}

local WhiteDie = {
	label="White Die",
	shortLabel="White",
	min=2, max=4, color={0.9,0.9,0.9},

	brokenBuff="+1 to maximum dice roll values",
	onBreaking=function()
		playerDiceCapBonus = playerDiceCapBonus + 1
	end
}

local YellowDie = {
	label="Yellow Die",
	shortLabel="Yellow",
	min=1, max=3, color={0.9,0.9,0.3},

	buff="gets +2 when left unassigned",
	onSave=function(die)
		die.value = math.min(die.value + 2, 6)
	end,

	brokenBuff="+1 to minimum dice roll values",
	onBreaking=function()
		playerDiceFloorBonus = playerDiceFloorBonus + 1
	end
}

local Ladybug = {
	label="Ladybug",
	shortLabel="Ladybug",
	min=0, max=0, color={0.9,0.3,0.3},

	buff="gets +7 when assigned for Attacking",
	resolveAssignment=function(die)
		if die.assignment == 'ATK' then
			die.value = die.value + 7
		end
	end,

	brokenBuff="Not breakable yet",
	onBreaking=function()
	end
}

return {
	BlueDie = BlueDie,
	RedDie = RedDie,
	GreenDie = GreenDie,
	WhiteDie = WhiteDie,
	YellowDie = YellowDie,
	Ladybug = Ladybug,
}
