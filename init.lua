return function(default_model)
	local screen = require("./screen")

	---@param block BlockState
	---@return osu.skull
	local function skull_init(block)
		return screen()
	end

	require("./skull")(default_model, skull_init)
end
