return function(default_model)
	---@param block BlockState
	---@return osu.skull
	local function skull_init(block)
		return {
			model = default_model,
			render = function()
				
			end
		}
	end

	---@param skull osu.skull
	local function skull_deinit(skull)

	end

	require("./skull")(default_model, skull_init, skull_deinit)
end
