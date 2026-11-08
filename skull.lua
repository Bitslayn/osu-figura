---@class osu.skull
---@field model ModelPart
---@field render fun(delta: number)
---@field time integer

---@param default_model ModelPart
---@param init fun(block: BlockState): osu.skull
---@param deinit fun(skull: osu.skull)
return function(default_model, init, deinit)
	---@type table<integer, osu.skull>
	local block_skulls = {}

	local hash = vec(1, 1000, 1000000)

	function events.world_tick()
		local expire = world.getTime() - 1
		for id, skull in next, block_skulls do
			if skull.time < expire then
				deinit(skull)
				block_skulls[id] = nil
			end
		end
	end

	---@type ModelPart
	local last_model = default_model
	function events.skull_render(delta, block)
		last_model:visible(false)

		if block then
			local id = block:getPos():dot(hash)

			if not block_skulls[id] then
				block_skulls[id] = init(block)
			end

			last_model = block_skulls[id].model
			block_skulls[id].render(delta)
			block_skulls[id].time = world.getTime()

			return
		end

		last_model = default_model
		last_model:visible(true)
	end
end
