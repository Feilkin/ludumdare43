-- my LD43 entry
--
-- (c) feilkin 2018
-- github.com/feilkin
-- twitter.com/feilkin

-- some globals to speed things up
Gamestate = require "hump.gamestate"
Timer = require "hump.timer"
Signal = require "hump.signal"

COLORS = require "dawnbringer32"
GAMESTATES = {
	splash   = require "gamestates.splash",
	menu     = require "gamestates.menu",
	settings = require "gamestates.settings",
	play     = require "gamestates.play",
	pause    = require "gamestates.pause",
}

function load_fonts()
	FONTS = {}
	FONTS.header = love.graphics.newFont("res/fonts/VCR_OSD_MONO_1.001.ttf", 22)
	FONTS.body =love.graphics.newFont("res/fonts/munro.ttf", 10)
end

function love.load()
	love.graphics.setDefaultFilter("nearest", "nearest", 4)
	
	load_fonts()
	love.graphics.setFont(FONTS.body)

	Gamestate.registerEvents()
	Gamestate.switch(GAMESTATES.splash)
end

function love.update(dt)
	Timer.update(dt)
end

function love.draw()
	love.graphics.scale(2, 2) -- make this feel a lot more pixely
end
