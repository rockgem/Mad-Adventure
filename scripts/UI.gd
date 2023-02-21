extends Control



func _on_UI_gui_input(event):
	if event is InputEventScreenTouch and !event.pressed:
		var item = Item.new()
		ManagerInventory.add_item_to_bag(item)


func _on_Character_pressed():
	get_node('%Main').show()
