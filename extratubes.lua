local function request_walk(pos, fromdir, item, num_requested, seen, first)
	if seen[minetest.hash_node_position(pos)]  or num_requested == 0 then
		return 0
	end
	seen[minetest.hash_node_position(pos)] = true

	local num_taken = 0
	local node = minetest.get_node(pos)
	if minetest.get_item_group(node.name, "smart_tube_provider") > 0 then
		local taken = minetest.registered_nodes[node.name].take_items(pos, item, num_requested)
		num_requested = num_requested - taken
		num_taken = num_taken + taken
	end
	local n = {}
	for _, dir in ipairs(pipeworks.meseadjlist) do
		if dir.x ~= fromdir.x or dir.y ~= fromdir.y or dir.z ~= fromdir.z then
			local npos = vector.add(pos, dir)
			local nnode = minetest.get_node(npos)
			if minetest.get_item_group(nnode.name, "tube") > 0 or
					minetest.get_item_group(nnode.name, "tubedevice_receiver") > 0 then
				n[#n+1] = dir
			end
		end
	end
	if minetest.get_item_group(node.name, "smart_tube") == 0 or
			(minetest.get_item_group(node.name, "smart_tube_consumer") > 0 and not first) then
		if #n == 1 then
			local dir = n[1]
			local npos = vector.add(pos, dir)
			return num_taken + request_walk(npos,
					{x = -dir.x, y = -dir.y, z = -dir.z},
					item, num_requested, seen)
		else
			return num_taken
		end
	else
		for _, dir in ipairs(n) do
			local npos = vector.add(pos, dir)
			local taken = request_walk(npos,
					{x = -dir.x, y = -dir.y, z = -dir.z},
					item, num_requested, seen)
			num_requested = num_requested - taken
			num_taken = num_taken + taken
		end
		local meta = minetest.get_meta(pos)
		local requests = minetest.deserialize(meta:get_string("requests")) or {}
		local name = item:get_name()
		if requests[name] == nil then
			requests[name] = {}
		end
		local u = requests[name]
		u[#u+1] = {count = num_taken, dir = fromdir}
		meta:set_string("requests", minetest.serialize(requests))
		return num_taken
	end
end

local function make_request(pos, req)
	local item = ItemStack(req:get_name())
	local num_requested = req:get_count()
	local seen = {}
	request_walk(pos, {x = 0, y = 0, z = 0}, item, num_requested, seen, true)
end 

local function t6(x)
	return {x, x, x, x, x, x}
end

local request_noctr_textures = t6("pipeworks_request_tube_noctr.png")
local request_plain_textures = t6("pipeworks_request_tube_plain.png")
local request_end_textures = t6("pipeworks_request_tube_end.png")
local request_short_texture = "pipeworks_request_tube_short.png"
local request_inv_texture = "pipeworks_request_tube_inv.png"
pipeworks.register_tube("pipeworks:request_tube", "Smart tube segment (consumer)", request_plain_textures,
	request_noctr_textures, request_end_textures, request_short_texture, request_inv_texture,
	{on_construct = function(pos)
		local meta = minetest.get_meta(pos)
		local inv = meta:get_inventory()
		inv:set_size("main", 8*2)
		meta:set_string("formspec",
			"invsize[8,6.5;]"..
			"list[current_name;main;0,0;8,2;]"..
			"list[current_player;main;0,2.5;8,4;]")
	end,
	groups = {smart_tube = 1, smart_tube_consumer = 1, mesecon = 2},
	mesecons = {effector = {action_on = function(pos,node)
					minetest.registered_nodes[node.name].on_punch(pos, node, nil)
				end}},
	can_dig = function(pos, player)
		local inv = minetest.get_meta(pos):get_inventory()
		return inv:is_empty("main")
	end,
	on_punch = function(pos, node, puncher)
		local meta = minetest.get_meta(pos)
		local inv = meta:get_inventory()
		for _, req in ipairs(inv:get_list("main")) do
			make_request(pos, req)
		end
	end,}
)

local function route(pos, node, velocity, stack)
	local meta = minetest.get_meta(pos)
	local requests = minetest.deserialize(meta:get_string("requests")) or {}
	local name = stack:get_name()
	local num = stack:get_count()
	if requests[name] then
		local u = requests[name]
		local len = #u
		for i, req in ipairs(u) do
			if req.count == num then
				u[i] = u[len]
				u[len] = nil
				if len == 1 then
					requests[name] = nil
				end
				meta:set_string("requests", minetest.serialize(requests))
				return {req.dir}
			end
		end
	end
	return {}
end

local router_noctr_textures = t6("pipeworks_router_tube_noctr.png")
local router_plain_textures = t6("pipeworks_router_tube_plain.png")
local router_end_textures = t6("pipeworks_router_tube_end.png")
local router_short_texture = "pipeworks_router_tube_short.png"
local router_inv_texture = "pipeworks_router_tube_inv.png"
pipeworks.register_tube("pipeworks:smart_tube", "Smart tube segment", router_plain_textures,
	router_noctr_textures, router_end_textures, router_short_texture, router_inv_texture,
	{tube = {
		can_go = route,
	},
	groups = {smart_tube = 1},
	on_construct = function(pos)
		local meta = minetest.get_meta(pos)
		meta:set_string("requests", minetest.serialize({}))
	end,}
)

local provider_noctr_textures = t6("pipeworks_provider_tube_noctr.png")
local provider_plain_textures = t6("pipeworks_provider_tube_plain.png")
local provider_end_textures = t6("pipeworks_provider_tube_end.png")
local provider_short_texture = "pipeworks_provider_tube_short.png"
local provider_inv_texture = "pipeworks_provider_tube_inv.png"
pipeworks.register_tube("pipeworks:provider_tube", "Smart tube segment (provider)", provider_plain_textures,
	provider_noctr_textures, provider_end_textures, provider_short_texture, provider_inv_texture,
	{tube = {
		can_go = route,
	},
	groups = {smart_tube = 1, smart_tube_provider = 1},
	take_items = function(pos, item, num_requested)
		local meta = minetest.get_meta(pos)
		local inv = meta:get_inventory()
		
		if not inv:contains_item("main", item) and not inv:is_empty("main") then
			return 0
		end
		
		local function from_inventory(frompos, frominv, frominvname, tube, num_to_take)
			local num_taken = 0
			for spos, stack in ipairs(frominv:get_list(frominvname)) do
				if stack:get_name() == item:get_name() then
					local taken = math.min(stack:get_count(), num_to_take)
					if tube.can_remove then
						taken = math.min(taken, tube.can_remove(frompos, fromnode, stack, dir))
					end
					num_taken = num_taken + taken
					num_to_take = num_to_take - taken
					if taken > 0 then
						local t
						if tube.remove_items then
							t = tube.remove_items(frompos, fromnode, stack, dir, count)
						else
							t = stack:take_item(taken)
							frominv:set_stack(frominvname, spos, stack)
						end
						local dir = vector.subtract(pos, frompos)
						local item1 = pipeworks.tube_item(vector.add(pos, vector.multiply(dir, -0.6)), t)
						item1:get_luaentity().start_pos = frompos
						item1:setvelocity(dir)
						item1:setacceleration({x=0, y=0, z=0})
					end
				end
			end
			
			return num_taken
		end
		
		local function from_pos(frompos, num_to_take)
			local num_taken = 0
			local fromnode = minetest.get_node(frompos)
			if not fromnode then
				return 0
			end
			
			local idef = minetest.registered_nodes[fromnode.name]
			local tube = idef.tube
			if not (tube and tube.input_inventory) then
				return 0
			end
			
			if tube.before_filter then
				tube.before_filter(frompos)
			end
			
			local frommeta = minetest.get_meta(frompos)
			local frominv = frommeta:get_inventory()
			
			if type(tube.input_inventory) == "table" then
				for _, i in ipairs(tube.input_inventory) do
					local taken = from_inventory(i, num_to_take)
					num_taken = num_taken + taken
					num_to_take = num_to_take - taken
					if num_to_take == 0 then
						break
					end
				end
			else
				num_taken = num_taken + from_inventory(frompos, frominv, tube.input_inventory, tube, num_to_take)
			end
		
			if tube.after_filter then
				tube.after_filter(frompos)
			end
			
			return num_taken
		end
		
		local num_taken = 0
		for _, dir in ipairs(pipeworks.meseadjlist) do
			local taken = from_pos(vector.add(pos, dir), num_requested)
			num_taken = num_taken + taken
			num_requested = num_requested - taken
		end
		return num_taken
	end,
	can_dig = function(pos, player)
		local inv = minetest.get_meta(pos):get_inventory()
		return inv:is_empty("main")
	end,
	on_construct = function(pos)
		local meta = minetest.get_meta(pos)
		meta:set_string("requests", minetest.serialize({}))
		local inv = meta:get_inventory()
		inv:set_size("main", 8*2)
		meta:set_string("formspec",
			"invsize[8,6.5;]"..
			"list[current_name;main;0,0;8,2;]"..
			"list[current_player;main;0,2.5;8,4;]")
	end,}
)

