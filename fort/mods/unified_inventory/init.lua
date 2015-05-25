-- Unified Inventory for Minetest 0.4.8+

local modpath = minetest.get_modpath(minetest.get_current_modname())
local worldpath = minetest.get_worldpath()


-- Data tables definitions
unified_inventory = {
	activefilter = {},
	active_search_direction = {},
	alternate = {},
	current_page = {},
	current_searchbox = {},
	current_index = {},
	current_item = {},
	current_craft_direction = {},
	registered_craft_types = {},
	crafts_for = {usage = {}, recipe = {} },
	players = {},
	items_list_size = 0,
	items_list = {},
	filtered_items_list_size = {},
	filtered_items_list = {},
	pages = {},
	buttons = {},

	-- Homepos stuff
	home_pos = {},
	home_filename =	worldpath.."/unified_inventory_home.home",

	-- Default inventory page
	default = "craft",

	-- intllib
	gettext = rawget(_G, "intllib") and intllib.Getter() or function(s) return s end,
}

-- Disable default creative inventory
if rawget(_G, "creative_inventory") then
	function creative_inventory.set_creative_formspec(player, start_i, pagenum)
		return
	end
end

dofile(modpath.."/group.lua")
dofile(modpath.."/api.lua")
dofile(modpath.."/internal.lua")
dofile(modpath.."/callbacks.lua")
dofile(modpath.."/register.lua")
dofile(modpath.."/bags.lua")
dofile(modpath.."/item_names.lua")
if minetest.get_modpath("datastorage") then
	dofile(modpath.."/waypoints.lua")
end

