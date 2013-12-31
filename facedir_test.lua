facedir_table = {}
--facedir_table = {[0] = {["front"] = {["y"] = 0, ["x"] = 0, ["z"] = -1}, ["top"] = {["y"] = 1, ["x"] = 0, ["z"] = 0}}, [1] = {["front"] = {["y"] = 0, ["x"] = -1, ["z"] = 0}, ["top"] = {["y"] = 1, ["x"] = 0, ["z"] = 0}}, [2] = {["front"] = {["y"] = 0, ["x"] = 0, ["z"] = 1}, ["top"] = {["y"] = 1, ["x"] = 0, ["z"] = 0}}, [3] = {["front"] = {["y"] = 0, ["x"] = 1, ["z"] = 0}, ["top"] = {["y"] = 1, ["x"] = 0, ["z"] = 0}}, [4] = {["front"] = {["y"] = 1, ["x"] = 0, ["z"] = 0}, ["top"] = {["y"] = 0, ["x"] = 0, ["z"] = 1}}, [5] = {["front"] = {["y"] = 0, ["x"] = -1, ["z"] = 0}, ["top"] = {["y"] = 0, ["x"] = 0, ["z"] = 1}}, [6] = {["front"] = {["y"] = -1, ["x"] = 0, ["z"] = 0}, ["top"] = {["y"] = 0, ["x"] = 0, ["z"] = 1}}, [7] = {["front"] = {["y"] = 0, ["x"] = 1, ["z"] = 0}, ["top"] = {["y"] = 0, ["x"] = 0, ["z"] = 1}}, [8] = {["front"] = {["y"] = -1, ["x"] = 0, ["z"] = 0}, ["top"] = {["y"] = 0, ["x"] = 0, ["z"] = -1}}, [9] = {["front"] = {["y"] = 0, ["x"] = -1, ["z"] = 0}, ["top"] = {["y"] = 0, ["x"] = 0, ["z"] = -1}}, [10] = {["front"] = {["y"] = 1, ["x"] = 0, ["z"] = 0}, ["top"] = {["y"] = 0, ["x"] = 0, ["z"] = -1}}, [11] = {["front"] = {["y"] = 0, ["x"] = 1, ["z"] = 0}, ["top"] = {["y"] = 0, ["x"] = 0, ["z"] = -1}}, [12] = {["front"] = {["y"] = 0, ["x"] = 0, ["z"] = -1}, ["top"] = {["y"] = 0, ["x"] = 1, ["z"] = 0}}, [13] = {["front"] = {["y"] = 1, ["x"] = 0, ["z"] = 0}, ["top"] = {["y"] = 0, ["x"] = 1, ["z"] = 0}}, [14] = {["front"] = {["y"] = 0, ["x"] = 0, ["z"] = 1}, ["top"] = {["y"] = 0, ["x"] = 1, ["z"] = 0}}, [15] = {["front"] = {["y"] = -1, ["x"] = 0, ["z"] = 0}, ["top"] = {["y"] = 0, ["x"] = 1, ["z"] = 0}}, [16] = {["front"] = {["y"] = 0, ["x"] = 0, ["z"] = -1}, ["top"] = {["y"] = 0, ["x"] = -1, ["z"] = 0}}, [17] = {["front"] = {["y"] = -1, ["x"] = 0, ["z"] = 0}, ["top"] = {["y"] = 0, ["x"] = -1, ["z"] = 0}}, [18] = {["front"] = {["y"] = 0, ["x"] = 0, ["z"] = 1}, ["top"] = {["y"] = 0, ["x"] = -1, ["z"] = 0}}, [19] = {["front"] = {["y"] = 1, ["x"] = 0, ["z"] = 0}, ["top"] = {["y"] = 0, ["x"] = -1, ["z"] = 0}}, [20] = {["front"] = {["y"] = 0, ["x"] = 0, ["z"] = -1}, ["top"] = {["y"] = -1, ["x"] = 0, ["z"] = 0}}, [21] = {["front"] = {["y"] = 0, ["x"] = 1, ["z"] = 0}, ["top"] = {["y"] = -1, ["x"] = 0, ["z"] = 0}}, [22] = {["front"] = {["y"] = 0, ["x"] = 0, ["z"] = 1}, ["top"] = {["y"] = -1, ["x"] = 0, ["z"] = 0}}, [23] = {["front"] = {["y"] = 0, ["x"] = -1, ["z"] = 0}, ["top"] = {["y"] = -1, ["x"] = 0, ["z"] = 0}}}

facedir_table = {
        [0] = {front = {x = 0, y = 0, z = -1},
                top = {x = 0, y = 1, z = 0}},
        [1] = {front = {x = -1, y = 0, z = 0},
                top = {x = 0, y = 1, z = 0}},
        [2] = {front = {x = 0, y = 0, z = 1},
                top = {x = 0, y = 1, z = 0}},
        [3] = {front = {x = 1, y = 0, z = 0},
                top = {x = 0, y = 1, z = 0}},
        [4] = {front = {x = 0, y = 1, z = 0},
                top = {x = 0, y = 0, z = 1}},
        [5] = {front = {x = -1, y = 0, z = 0},
                top = {x = 0, y = 0, z = 1}},
        [6] = {front = {x = 0, y = -1, z = 0},
                top = {x = 0, y = 0, z = 1}},
        [7] = {front = {x = 1, y = 0, z = 0},
                top = {x = 0, y = 0, z = 1}},
        [8] = {front = {x = 0, y = -1, z = 0},
                top = {x = 0, y = 0, z = -1}},
        [9] = {front = {x = -1, y = 0, z = 0},
                top = {x = 0, y = 0, z = -1}},
        [10] = {front = {x = 0, y = 1, z = 0},
                top = {x = 0, y = 0, z = -1}},
        [11] = {front = {x = 1, y = 0, z = 0},
                top = {x = 0, y = 0, z = -1}},
        [12] = {front = {x = 0, y = 0, z = -1},
                top = {x = 1, y = 0, z = 0}},
        [13] = {front = {x = 0, y = 1, z = 0},
                top = {x = 1, y = 0, z = 0}},
        [14] = {front = {x = 0, y = 0, z = 1},
                top = {x = 1, y = 0, z = 0}},
        [15] = {front = {x = 0, y = -1, z = 0},
                top = {x = 1, y = 0, z = 0}},
        [16] = {front = {x = 0, y = 0, z = -1},
                top = {x = -1, y = 0, z = 0}},
        [17] = {front = {x = 0, y = -1, z = 0},
                top = {x = -1, y = 0, z = 0}},
        [18] = {front = {x = 0, y = 0, z = 1},
                top = {x = -1, y = 0, z = 0}},
        [19] = {front = {x = 0, y = 1, z = 0},
                top = {x = -1, y = 0, z = 0}},
        [20] = {front = {x = 0, y = 0, z = -1},
                top = {x = 0, y = -1, z = 0}},
        [21] = {front = {x = 1, y = 0, z = 0},
                top = {x = 0, y = -1, z = 0}},
        [22] = {front = {x = 0, y = 0, z = 1},
                top = {x = 0, y = -1, z = 0}},
        [23] = {front = {x = -1, y = 0, z = 0},
                top = {x = 0, y = -1, z = 0}},
}

local function table_pos(pos)
	return "{x = "..pos.x..", y = "..pos.y..", z = "..pos.z.."}"
end

--print("facedir_table = {")
--for i = 0, 23 do
--	print("	["..i.."] = {front = "..table_pos(facedir_table[i].front)..",")
--	print("		top = "..table_pos(facedir_table[i].top).."},")
--end
--print("}")

dirs_to_facedir_table = {}

local function dir_to_side(dir)
	local a = dir.x + 2*dir.y + 3*dir.z
	if a > 0 then
		return a - 1
	else
		return 2 - a
	end
end

local function side_to_dir(side)
	return ({{x = 1, y = 0, z = 0},
		{x = 0, y = 1, z = 0},
		{x = 0, y = 0, z = 1},
		{x = -1, y = 0, z = 0},
		{x = 0, y = -1, z = 0},
		{x = 0, y = 0, z = -1}})[side+1]
end

for i = 0, 5 do
	assert(dir_to_side(side_to_dir(i)) == i)
end

for i = 0, 23 do
	local top = dir_to_side(facedir_table[i].top)
	local front = dir_to_side(facedir_table[i].front)
	dirs_to_facedir_table[6*top+front] = i
end

--dirs_to_facedir_table = {13, 14, nil, 15, 12, 3, nil, 2, 1, nil, 0, 7, 4, nil, 5, 6, nil, nil, 19, 18, nil, 17, 16, 21, nil, 22, 23, nil, 20, 11, 10, nil, 9, 8}

for i = 0, 5 do
for j = 0, 5 do
	if i%3 ~= j%3 then
		local fd = dirs_to_facedir_table[6*i+j]
		assert(dir_to_side(facedir_table[fd].top) == i)
		assert(dir_to_side(facedir_table[fd].front) == j)
	end
end
end

local function cross(a, b)
	return {x = a.y*b.z - a.z*b.y,
		y = a.z*b.x - a.x*b.z,
		z = a.x*b.y - a.y*b.x}
end

local function facedir_from_dirs(top, front)
	return dirs_to_facedir_table[6*dir_to_side(top)+dir_to_side(front)]
end

local function rv(v, dir)
	local vs = dir_to_side(v)
	local side = dir_to_side(dir)
	if vs%3 == side%3 then
		return v
	else
		return cross(v, dir)
	end
end

local function rotate_from_side(facedir, dir)
	local top = facedir_table[facedir].top
	local front = facedir_table[facedir].front
	return facedir_from_dirs(rv(top, dir), rv(front, dir))
end

local function rotate_side(facedir, side)
	if side%3 == 1 then
		if side == 1 then
			return dir_to_side(facedir_table[facedir].top)
		else
			return (dir_to_side(facedir_table[facedir].top)+3)%6
		end
	elseif side%3 == 2 then
		if side == 5 then
			return dir_to_side(facedir_table[facedir].front)
		else
			return (dir_to_side(facedir_table[facedir].front)+3)%6
		end
	else
		if side == 0 then
			return dir_to_side(cross(facedir_table[facedir].front,facedir_table[facedir].top))
		else
			return dir_to_side(cross(facedir_table[facedir].top,facedir_table[facedir].front))
		end
	end
end

local color = 0
minetest.register_node("pipeworks:facedir_tester", {
	description = "Facedir tester",
	drawtype = "normal",
	paramtype2 = "facedir",
	tiles = {"pipeworks_red.png", "pipeworks_white.png", "pipeworks_white.png", "pipeworks_white.png", "pipeworks_white.png", "pipeworks_blue.png"},
	on_punch = function(pos, node)
		node.param2 = 0
		minetest.set_node(pos, node)
	end,
	on_use = function(itemstack, user, pointed_thing)
		if pointed_thing.type ~= "node" then return end
		local pos = pointed_thing.under
		local node = minetest.get_node(pos)
		--if node.name ~= "pipeworks:facedir_tester" then return end
		local dir = vector.subtract(pointed_thing.above, pointed_thing.under)
		local facedir = node.param2
		local msg
		if color == 0 then
			color = 1
			msg = "Click BLUE side"
			facedir_table[facedir].top = dir
		else
			color = 0
			msg = "Click RED side"
			facedir_table[facedir].front = dir
			dirs_to_facedir_table[6*dir_to_side(facedir_table[facedir].top)+dir_to_side(dir)] = facedir
			node.param2 = (facedir+1)%24
			minetest.set_node(pos, node)
			local r = vector.add(dir, minetest.facedir_to_dir(facedir))
			if r.x ~= 0 or r.y ~= 0 or r.z ~= 0 then
				print("WTF?????????????????????????????????????????????????????????????", facedir)
			end
		end
		minetest.chat_send_player(user:get_player_name(), msg)
		--node.param2 = rotate_from_side(facedir, dir)
		--minetest.swap_node(pos, node)
	end
})

tube_table = {}
tube_table_facedirs = {}

tubes = {{}, {0}, {0, 3}, {0, 1}, {0, 1, 2}, {0, 1, 3}, {0, 1, 2, 3}, {0, 1, 3, 4}, {0, 1, 2, 3, 4}, {0, 1, 2, 3, 4, 5}}
for index, tube in ipairs(tubes) do
	for facedir = 23, 0, -1 do
		local s = 0
		for _, i in ipairs(tube) do
			s = s+2^rotate_side(facedir, i)
		end
		tube_table[s] = index
		tube_table_facedirs[s] = facedir
	end
end

print(dump(tube_table))
print(dump(tube_table_facedirs))

local s = "tube_table = {[0] = "..tube_table[0]
for i = 1, 63 do
	s = s..", "..tube_table[i]
end
s = s.."}"
print(s)

local s = "tube_table_facedirs = {[0] = "..tube_table_facedirs[0]
for i = 1, 63 do
	s = s..", "..tube_table_facedirs[i]
end
s = s.."}"
print(s)

--tube_table = {[0] = 1, 2, 2, 4, 2, 4, 4, 5, 2, 3, 4, 6, 4, 6, 5, 7, 2, 4, 3, 6, 4, 5, 6, 7, 4, 6, 6, 8, 5, 7, 7, 9, 2, 4, 4, 5, 3, 6, 6, 7, 4, 6, 5, 7, 6, 8, 7, 9, 4, 5, 6, 7, 6, 7, 8, 9, 5, 7, 7, 9, 7, 9, 9, 10}
--tube_table_facedirs = {[0] = 0, 0, 5, 0, 3, 4, 3, 0, 2, 0, 2, 0, 6, 4, 3, 0, 7, 12, 5, 12, 7, 4, 5, 5, 18, 20, 16, 0, 7, 4, 7, 0, 1, 8, 1, 1, 1, 13, 1, 1, 10, 8, 2, 2, 17, 4, 3, 6, 9, 9, 9, 9, 21, 13, 1, 1, 10, 10, 11, 2, 19, 4, 3, 0}

