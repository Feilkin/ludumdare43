--- builds AI navigation data for platformers

local lg = require((...):gsub('plugins.bump', 'graphics'))

return {
	navpath_LICENSE        = "MIT/X11",
	navpath_URL            = "https://github.com/karai17/Simple-Tiled-Implementation",
	navpath_VERSION        = "0.1.0",
	navpath_DESCRIPTION    = "Navigation data for STI.",

	--- Builds navigation data from collision data
	-- @param world The Bump world to add objects to.
	-- @return collidables table containing the handles to the objects in the Bump world.
	navpath_init = function(map, world)
		assert(map.bump_collidables, "navpath only works with bump collision data!")
	end,

	--- Remove layer
	-- @param index to layer to be removed
	-- @param world bump world the holds the tiles
	-- @param tx Translate on X
-- @param ty Translate on Y
-- @param sx Scale on X
-- @param sy Scale on Y
	navpath_removeLayer = function(map, index, world)
	end,

	--- Draw bump collisions world.
	-- @param world bump world holding the tiles geometry
	-- @param tx Translate on X
	-- @param ty Translate on Y
	-- @param sx Scale on X
	-- @param sy Scale on Y
	navpath_draw = function(map, world, tx, ty, sx, sy)
		lg.push()
		lg.scale(sx or 1, sy or sx or 1)
		lg.translate(math.floor(tx or 0), math.floor(ty or 0))

		for _, path in pairs(map.navpath_data) do
			lg.rectangle("line", data.x, data.y, data.width, data.height)
		end

		lg.pop()
	end
}

--- Custom Properties in Tiled are used to tell this plugin what to do.
-- @table Properties
-- @field collidable set to true, can be used on any Layer, Tile, or Object
