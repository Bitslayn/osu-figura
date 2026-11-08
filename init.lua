---@class osu
local api = {}

---@type osu.skull.vars
local skull = require("./skull")

---@param part ModelPart
function api:setDefaultModel(part)
	skull.default_model = part:copy(""):moveTo(models)
end

return api