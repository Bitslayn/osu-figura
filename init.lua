---@param default_model ModelPart
return function(default_model)
	local skull = require("./skull")
	local screen = require("./screen")

	skull(default_model, screen)
end
