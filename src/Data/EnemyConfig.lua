local Enemy = require('../Components/Enemy')

local beetleGraphic=love.graphics.newImage('Assets/enemy-beetle.png')
local Beetle = {
	name='Beetle',
	canvas=Enemy.createCanvas(beetleGraphic),
	visualDescription='an insect with a large front horn and wings.',
	startingHP=3, startingBLK=0,
	ready=function(round, hp, blk)
		return {{ type='ATK', value=4 + math.random(0, 4) }}
	end
}

local centipedeGraphic=love.graphics.newImage('Assets/enemy-centipede.png')
local Centipede = {
	name='Centipede',
	canvas=Enemy.createCanvas(centipedeGraphic),
	visualDescription='an insect with many segments poised and ready to attack.',
	startingHP=3, startingBLK=0,
	ready=function(round, hp, blk)
		return {{ type='ATK', value=4 + math.random(0, 4) }}
	end
}

local ladyBeetleGraphic=love.graphics.newImage('Assets/enemy-ladybeetle.png')
local LadyBeetle = {
	name='LadyBeetle',
	canvas=Enemy.createCanvas(ladyBeetleGraphic),
	visualDescription='an insect with large wings covered in red spots and splotches.',
	startingHP=3, startingBLK=0,
	ready=function(round, hp, blk)
		return {{ type='ATK', value=4 + math.random(0, 4) }}
	end
}

local mantisGraphic=love.graphics.newImage('Assets/enemy-mantis.png')
local Mantis = {
	name='Mantis',
	canvas=Enemy.createCanvas(mantisGraphic),
	visualDescription="an insect with a long body and thin legs, it's arms ready to extend and attack.",
	startingHP=3, startingBLK=0,
	ready=function(round, hp, blk)
		return {{ type='ATK', value=4 + math.random(0, 4) }}
	end
}

local mothGraphic=love.graphics.newImage('Assets/enemy-moth.png')
local Moth = {
	name='Moth',
	canvas=Enemy.createCanvas(mothGraphic),
	visualDescription='an insect floating with giant round wings, with red ring patterns.',
	startingHP=3, startingBLK=0,
	ready=function(round, hp, blk)
		return {{ type='ATK', value=4 + math.random(0, 4) }}
	end
}

local spiderGraphic=love.graphics.newImage('Assets/enemy-spider.png')
local Spider = {
	name='Spider',
	canvas=Enemy.createCanvas(spiderGraphic),
	visualDescription='a fat insect with many thin legs and red eyes.',
	startingHP=3, startingBLK=0,
	ready=function(round, hp, blk)
		return {{ type='ATK', value=4 + math.random(0, 4) }}
	end
}

return {
	Beetle = Beetle,
	Centipede = Centipede,
	LadyBeetle = LadyBeetle,
	Mantis = Mantis,
	Moth = Moth,
	Spider = Spider,
}
