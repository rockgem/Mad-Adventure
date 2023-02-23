extends Control


var current_selected_item: Item


func _ready():
	for child in get_node('%List').get_children():
		child.connect('clicked', self, 'on_clicked')


func on_clicked(item: Item):
	current_selected_item = item
	
	get_node('%Info').get_node("VBoxContainer").show()
	get_node('%Info').get_node("VBoxContainer").get_node("Name").text = item.props['name']
	get_node('%Info').get_node("VBoxContainer").get_node("Price").text = 'Price: ' + str(item.props['price'])


func _on_Shop_gui_input(event):
	if event is InputEventScreenTouch and !event.pressed:
		ManagerGame.emit_signal("player_movement_stop", false)
		queue_free()


func _on_Buy_pressed():
	ManagerInventory.add_item_to_bag(current_selected_item)
