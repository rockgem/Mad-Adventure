extends Panel



signal clicked



export(String) var item

var item_data


func _ready():
	$Icon.texture = load("res://assets/items/%s.png" % item)


func _on_ShopDisplay_gui_input(event):
	if event is InputEventScreenTouch and !event.pressed:
		var item = ManagerInventory.get_item_by_name(item)
		if item is Item:
			emit_signal("clicked")
		else:
			print('not an item or null')
		
