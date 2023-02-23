extends Node


var all_items = {}


func _ready():
	var f = File.new()
	f.close()


func add_item_to_bag(data: Item):
	ManagerGame.player_data['inv_items'].append(data.props)


func get_item_by_name(id: String) -> Item:
	var item = Item.new()
	
	return item


func get_item_by_idx(idx: int) -> Item:
	idx = clamp(idx, 0, ManagerGame.inv_items_slots - 1)
	
	if ManagerGame.player_data['inv_items'][idx] == {}:
		return null
	
	var item = Item.new()
	item.props = ManagerGame.player_data['inv_items'][idx]
	
	return item


func generate_item(item_id: String, item_name: String, type: int) -> Item:
	var item_data = Item.new()
	item_data.init_item(item_id, item_name, type)
	
	return item_data
