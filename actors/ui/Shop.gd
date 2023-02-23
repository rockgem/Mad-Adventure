extends Control



func _on_Shop_gui_input(event):
	if event is InputEventScreenTouch and !event.pressed:
		ManagerGame.emit_signal("player_movement_stop", false)
		queue_free()
