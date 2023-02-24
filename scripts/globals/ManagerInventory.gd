extends Node


var all_items = {}


func _ready():
	var f = File.new()
	f.open("res://resources/data/items.json", f.READ)
	all_items = parse_json(f.get_as_text())
	f.close()


func add_item_to_bag(data: Item):
	var count = 0
	for dict in ManagerGame.player_data['inv_items']:
		if dict.empty():
			ManagerGame.player_data['inv_items'][count] = data.props.duplicate()
			break
		elif dict['id'] == data['props']['id']:
			dict['stack'] += 1
			break
		
		count += 1
	
	ManagerGame.collection.update(Firebase.Auth.auth['localid'], ManagerGame.player_data)


func get_item_by_name(id: String):
	if all_items.has(id) == false:
		return
	
	var item = Item.new()
	item.props = all_items.get(id)
	
	return item


func get_item_by_idx(idx: int) -> Item:
	idx = clamp(idx, 0, ManagerGame.inv_items_slots - 1)
	
	if ManagerGame.player_data['inv_items'][idx] == {}:
		return null
	
	var item = Item.new()
	item.props = ManagerGame.player_data['inv_items'][idx]
	
	return item


#func generate_item(item_id: String, item_name: String, type: int) -> Item:
#	var item_data = Item.new()
#	item_data.init_item(item_id, item_name, type)
#
#	return item_data
