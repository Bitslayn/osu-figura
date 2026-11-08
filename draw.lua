---@class FOXDrawing
local draw = {}

local dot = textures:newTexture("draw_dot", 1, 1):pixel(0, 0, vec(1, 1, 1))

---@param parent ModelPart
---@param color Vector3
---@param layer number
---@param sides integer
---@param radius number
---@param weight number?
function draw.polygon(parent, color, layer, sides, radius, weight)
	local root = parent:newPart("Polygon"):pos(0, 0, layer)

	-- Create points
	---@type Vector2[]
	local points = {}
	for i = 1, sides do
		local rad = math.rad(360 / sides * i)
		points[i] = vec(math.sin(rad), math.cos(rad))
	end

	weight = weight or radius
	weight = (radius - weight) / radius

	-- Create polygon
	-- local dim = texture:getDimensions()
	-- local pad = (dim - 1) / dim
	for s = 1, sides do
		---@type Vector2[]
		local uvs = { points[s] * weight, points[s], points[s % sides + 1], points[s % sides + 1] * weight }
		local sprite = root:newSprite("" .. s):texture(dot):color(color):renderType("EMISSIVE_SOLID")

		for i, vert in ipairs(sprite:getVertices()) do
			local uv = -uvs[i]
			vert:pos(uv.xy_ * radius)
			-- :uv(uv * pad / 2 + 0.5)
		end
	end
end

return draw
