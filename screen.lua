---@param block BlockState
---@return osu.skull
return function(block)
	local screen = models:newPart("Screen", "Skull")

	local function render(delta)

	end

	local function deinit()

	end

	return { model = screen, render = render, deinit = deinit }
end
