---@type FOXDrawing
local draw = require("../draw")

local circle_texture = textures:newTexture("circle_texture", 1, 1)

---@param root ModelPart
---@param x number
---@param y number
---@param cfg {number: integer, color: Vector3}
return function(root, x, y, cfg)
	local pos = math.lerp(vec(20, 38), vec(-20, 8), vec(x, y)) --[[@as Vector2]]

	local part = root:newPart("Circle"):pos(pos:unpack())
	draw.polygon(part, vec(1, 0.5, 0.5), -0.1, 16, 5)
	draw.polygon(part, vec(1, 1, 1), -0.2, 16, 5, 0.5)

	part:newText("label")
		:text(cfg.number .. "")
		:scale(0.5)
		:pos(-0.25, 1.75, -0.3)
		:alignment("CENTER")
end
