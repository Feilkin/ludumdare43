local tiny = require "tiny"

local spriteRenderer = tiny.processingSystem()
spriteRenderer.filter = tiny.requireAll("sprite", "spritesheet", "body")

function spriteRenderer:preWrap(dt)
	for name, b in pairs(self.world.batches) do
		b:clear()
	end
end

function spriteRenderer:process(e, dt)
	local sheet = self.world.sheets[e.spritesheet]
	local batch = self.world.batches[e.spritesheet]
	local quad = sheet:getQuad(e.sprite)
	local x, y = e.body:getPos()
	local w, h = e.body:getSize()
	batch:add(quad, x + (e.flip_x and w or 0),
		y, 0, e.flip_x and -1 or 1, 1)
end

return spriteRenderer