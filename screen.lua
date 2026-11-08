local background = textures:newTexture("osu_background", 80, 60)
	:fill(0, 0, 80, 60, vec(1, 1, 1))
	:fill(1, 1, 78, 58, vec(0, 0, 0, 0))

---@param block BlockState
---@return osu.skull
return function(block)
	--[[Study (Stable):
	Hit circles spawn and get removed either when you hit early or you're too late
	When a circle is hit, it spawns a hit effect and a score
	On sliders, hitting early removes without creating a hit effect or score, creating a slider ball instead
	Hit effect and score spawns at the end of a slider track once the ball reaches the end
	]]

	local screen = models:newPart("Screen", "Skull")
	local border = screen:newSprite("")
		:texture(background, 40, 30)
		:pos(20, 38, 0)

	local circle = require("./objects/circle")

	circle(screen, 0, 0, { number = 1 })
	circle(screen, 0.2, 0.5, { number = 2 })
	circle(screen, 0.5, 0.3, { number = 3 })

	local function render(delta)

	end

	local function deinit()

	end

	return { model = screen, render = render, deinit = deinit }
end
