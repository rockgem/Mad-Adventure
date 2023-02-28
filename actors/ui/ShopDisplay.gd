extends Panel



signal clicked(item_data)



# this should have an item id so it can display the item here
# see _ready func
export(String) var item

var item_data


func _ready():
	$Icon.texture = load("res://assets/items/%s.png" % item)


func _on_ShopDisplay_gui_input(event):
	if event is InputEventScreenTouch and !event.pressed:
		var i = ManagerInventory.get_item_by_name(item)
		if i is Item:
			emit_signal("clicked", i)
		else:
			print('not an item or null')
		
