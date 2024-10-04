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
	minetest.registered_nodes['cottages:fence_small'].tiles = {'tech_primitive_wood.png'}
	minetest.registered_nodes['cottages:fence_end'].tiles = {'tech_primitive_wood.png'}
	minetest.registered_nodes['cottages:fence_corner'].tiles = {'tech_primitive_wood.png'}
	-- exile recipes
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
end
