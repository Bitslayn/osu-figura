---@class osu.skull.vars
local class = {}

---@type ModelPart
class.default_model = models:newPart("")

---@type ModelPart
local last_model = class.default_model
function events.skull_render(_, block)
	last_model:visible(false)

	if block then
		return
	end

	last_model = class.default_model
	last_model:visible(true)
end

return class