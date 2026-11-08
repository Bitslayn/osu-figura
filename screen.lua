return function()
	local screen = models:newPart("Screen", "Skull")

	local function render(delta)

	end

	local function deinit()

	end

	return {model = screen, render = render, deinit = deinit}
end
