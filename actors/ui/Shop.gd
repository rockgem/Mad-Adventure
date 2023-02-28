extends Control


var current_selected_item: Item


func _ready():
	for child in get_node('%List').get_children():
		child.connect('clicked', self, 'on_clicked')
	
	get_node('%Gold').get_node("Value").text = str(ManagerGame.player_data['gold'])


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
	
	ManagerGame.player_data['gold'] -= current_selected_item.props['price']
	get_node('%Gold').get_node("Value").text = str(ManagerGame.player_data['gold'])
	
#	get_node('%Floater').show()
#	get_node('%Floater').text = '-%s' % current_selected_item.props['price']
#	var t = get_tree().create_tween()
#	t.tween_property(get_node('%Floater'), 'rect_position:y', -8.0, 0.4)
#	yield(t, "finished")
#	get_node('%Floater').rect_position.y = 0
#	get_node('%Floater').hide()
	
