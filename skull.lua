---@class osu.skull
---@field model ModelPart
---@field render fun(delta: number)
---@field deinit function
---@field time integer

---@param default_model ModelPart
---@param init fun(block: BlockState): osu.skull
return function(default_model, init)
	---@type table<integer, osu.skull>
	local block_skulls = {}

	local hash = vec(1, 1000, 1000000)

	function events.world_tick()
		local expire = world.getTime() - 1
		for id, skull in next, block_skulls do
			if skull.time < expire then
				block_skulls[id].deinit()
				block_skulls[id] = nil
			end
		end
	end

	---@type ModelPart
	local last_model = default_model
	function events.skull_render(delta, block)
		last_model:visible(false)
		last_model = default_model

		if block then
			local id = block:getPos():dot(hash)

			if not block_skulls[id] then
				block_skulls[id] = init(block)
			end

			local skull = block_skulls[id]
			last_model = skull.model
			skull.render(delta)
			skull.time = world.getTime()
		end

		last_model:visible(true)
	end
end
