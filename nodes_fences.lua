-- 22.01.13 Changed texture to that of the wood from the minimal development game

local S = cottages.S

minetest.register_node("cottages:fence_small", {
		description = S("small fence"),
		drawtype = "nodebox",
                -- top, bottom, side1, side2, inner, outer
		tiles = {"cottages_minimal_wood.png"},
		paramtype = "light",
		paramtype2 = "facedir",
		groups = {snappy=2,choppy=2,oddly_breakable_by_hand=2},
		node_box = {
			type = "fixed",
			fixed = {
				{ -0.45, -0.35,  0.46,  0.45, -0.20,  0.50},
				{ -0.45,  0.00,  0.46,  0.45,  0.15,  0.50},
				{ -0.45,  0.35,  0.46,  0.45,  0.50,  0.50},

				{ -0.50, -0.50,  0.46, -0.45,  0.50,  0.50},
				{  0.45, -0.50,  0.46,  0.50,  0.50,  0.50},
			},
		},
		selection_box = {
			type = "fixed",
			fixed = {
				{ -0.50, -0.50, 0.4,  0.50,  0.50,  0.5},
			},
		},
		is_ground_content = false,
})


minetest.register_node("cottages:fence_corner", {
		description = S("small fence corner"),
		drawtype = "nodebox",
                -- top, bottom, side1, side2, inner, outer
		tiles = {"cottages_minimal_wood.png"},
		paramtype = "light",
		paramtype2 = "facedir",
		groups = {snappy=2,choppy=2,oddly_breakable_by_hand=2},
		node_box = {
			type = "fixed",
			fixed = {
				{ -0.45, -0.35,  0.46,  0.45, -0.20,  0.50},
				{ -0.45,  0.00,  0.46,  0.45,  0.15,  0.50},
				{ -0.45,  0.35,  0.46,  0.45,  0.50,  0.50},

				{ -0.50, -0.50,  0.46, -0.45,  0.50,  0.50},
				{  0.45, -0.50,  0.46,  0.50,  0.50,  0.50},

				{  0.46, -0.35, -0.45,  0.50, -0.20,  0.45},
				{  0.46,  0.00, -0.45,  0.50,  0.15,  0.45},
				{  0.46,  0.35, -0.45,  0.50,  0.50,  0.45},

				{  0.46, -0.50, -0.50,  0.50,  0.50, -0.45},
				{  0.46, -0.50,  0.45,  0.50,  0.50,  0.50},
			},
		},
		selection_box = {
			type = "fixed",
			fixed = {
				{ -0.50, -0.50,-0.5,  0.50,  0.50,  0.5},
			},
		},
		is_ground_content = false,
})


minetest.register_node("cottages:fence_end", {
		description = S("small fence end"),
		drawtype = "nodebox",
                -- top, bottom, side1, side2, inner, outer
		tiles = {"cottages_minimal_wood.png"},
		paramtype = "light",
		paramtype2 = "facedir",
		groups = {snappy=2,choppy=2,oddly_breakable_by_hand=2},
		node_box = {
			type = "fixed",
			fixed = {
				{ -0.45, -0.35,  0.46,  0.45, -0.20,  0.50},
				{ -0.45,  0.00,  0.46,  0.45,  0.15,  0.50},
				{ -0.45,  0.35,  0.46,  0.45,  0.50,  0.50},

				{ -0.50, -0.50,  0.46, -0.45,  0.50,  0.50},
				{  0.45, -0.50,  0.46,  0.50,  0.50,  0.50},

				{  0.46, -0.35, -0.45,  0.50, -0.20,  0.45},
				{  0.46,  0.00, -0.45,  0.50,  0.15,  0.45},
				{  0.46,  0.35, -0.45,  0.50,  0.50,  0.45},

				{  0.46, -0.50, -0.50,  0.50,  0.50, -0.45},
				{  0.46, -0.50,  0.45,  0.50,  0.50,  0.50},

				{ -0.50, -0.35, -0.45, -0.46, -0.20,  0.45},
				{ -0.50,  0.00, -0.45, -0.46,  0.15,  0.45},
				{ -0.50,  0.35, -0.45, -0.46,  0.50,  0.45},

				{ -0.50, -0.50, -0.50, -0.46,  0.50, -0.45},
				{ -0.50, -0.50,  0.45, -0.46,  0.50,  0.50},
			},
		},
		selection_box = {
			type = "fixed",
			fixed = {
				{ -0.50, -0.50,-0.5,  0.50,  0.50,  0.5},
			},
		},
		is_ground_content = false,
})

if not (minetest.get_modpath('crafting')) then
	minetest.register_craft({
		output = "cottages:fence_small 3",
		recipe = {
			{cottages.craftitem_fence, cottages.craftitem_fence},
		}
	})

	-- xfences can be configured to replace normal fences - which makes them uncraftable
	if ( minetest.get_modpath("xfences") ~= nil ) then
		minetest.register_craft({
			output = "cottages:fence_small 3",
			recipe = {
				{"xfences:fence","xfences:fence" },
			}
		})
	end

	minetest.register_craft({
		output = "cottages:fence_corner",
		recipe = {
			{"cottages:fence_small","cottages:fence_small" },
		}
	})

	minetest.register_craft({
		output = "cottages:fence_small 2",
		recipe = {
			{"cottages:fence_corner" },
		}
	})

	minetest.register_craft({
		output = "cottages:fence_end",
		recipe = {
			{"cottages:fence_small","cottages:fence_small", "cottages:fence_small" },
		}
	})

	minetest.register_craft({
		output = "cottages:fence_small 3",
		recipe = {
			{"cottages:fence_end" },
		}
	})
else
	-- exile recipes
	minetest.registered_nodes['cottages:fence_small'].tiles = {'tech_primitive_wood.png'}
	minetest.registered_nodes['cottages:fence_end'].tiles = {'tech_primitive_wood.png'}
	minetest.registered_nodes['cottages:fence_corner'].tiles = {'tech_primitive_wood.png'}
	-- create oild variants for fence
	local basic_fence = minetest.registered_nodes['cottages:fence_small']
	local basic_fence_end = minetest.registered_nodes['cottages:fence_end']
	local basic_fence_corner = minetest.registered_nodes['cottages:fence_corner']
	minetest.register_node('cottages:fence_small_oiled', {
		description = S("Oiled small fence"),
		tiles = { 'tech_oiled_wood.png' },
		drawtype = basic_fence.drawtype,
		paramtype = basic_fence.paramtype,
		paramtype2 = basic_fence.paramtype2,
		groups = basic_fence.groups,
		node_box = basic_fence.node_box,
		selection_box = basic_fence.selection_box,
		is_ground_content = basic_fence.is_ground_content,
	})
	minetest.register_node('cottages:fence_end_oiled', {
		description = S("Oiled fence end"),
		tiles = { 'tech_oiled_wood.png' },
		drawtype = basic_fence_end.drawtype,
		paramtype = basic_fence_end.paramtype,
		paramtype2 = basic_fence_end.paramtype2,
		groups = basic_fence_end.groups,
		node_box = basic_fence_end.node_box,
		selection_box = basic_fence_end.selection_box,
		is_ground_content = basic_fence_end.is_ground_content,
	})
	minetest.register_node('cottages:fence_corner_oiled', {
		description = S("Oiled fence corner"),
		tiles = { 'tech_oiled_wood.png' },
		drawtype = basic_fence_corner.drawtype,
		paramtype = basic_fence_corner.paramtype,
		paramtype2 = basic_fence_corner.paramtype2,
		groups = basic_fence_corner.groups,
		node_box = basic_fence_corner.node_box,
		selection_box = basic_fence_corner.selection_box,
		is_ground_content = basic_fence_corner.is_ground_content,
	})
	crafting.register_recipe({
		type = "chopping_block",
		output = "cottages:fence_small 4",
		items = { "group:log 1" },
		level = 1,
		always_known = true
	})
	crafting.register_recipe({
		type = 'chopping_block',
		output = 'cottages:fence_end',
		items = { 'cottages:fence_small 3' },
		level = 1,
		always_known = true
	})
	crafting.register_recipe({
		type = 'chopping_block',
		output = 'cottages:fence_corner',
		items = { 'cottages:fence_small 2' },
		level = 1,
		always_known = true
	})
	crafting.register_recipe({
		type = "chopping_block",
		output = "cottages:fence_small_oiled 4",
		items = { "group:log 1", "tech:vegetable_oil" },
		level = 1,
		always_known = true
	})
	crafting.register_recipe({
		type = 'chopping_block',
		output = 'cottages:fence_end_oiled',
		items = { 'cottages:fence_small_oiled 3' },
		level = 1,
		always_known = true
	})
	crafting.register_recipe({
		type = 'chopping_block',
		output = 'cottages:fence_corner_oiled',
		items = { 'cottages:fence_small_oiled 2' },
		level = 1,
		always_known = true
	})
	crafting.register_recipe({ -- upgrade existing fences with oil later at the mixing_spot
		type = 'mixing_spot',
		output = 'cottages:fence_corner_oiled',
		items = { 'cottages:fence_small 4', 'tech:vegetable_oil' },
		level = 1,
		always_known = true
	})
	crafting.register_recipe({
		type = 'mixing_spot',
		output = 'cottages:fence_end_oiled',
		items = { 'cottages:fence_end', 'tech:vegetable_oil' },
		level = 1,
		always_known = true
	})
	crafting.register_recipe({
		type = 'mixing_spot',
		output = 'cottages:fence_corner_oiled',
		items = { 'cottages:fence_corner', 'tech:vegetable_oil' },
		level = 1,
		always_known = true
	})
end
