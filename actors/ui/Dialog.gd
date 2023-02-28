extends Control


var idx = 0
var size = -1

var data: DialogData


func pre_load_dialog(data: DialogData):
	self.data = data
	get_node('%Text').percent_visible = 0.0
	$Timer.start()
	
	idx = 0
	size = self.data.props.size()
	
	get_node('%Text').text = self.data.props[idx]
	
	
	ManagerGame.emit_signal("player_movement_stop", true)


func _on_Timer_timeout():
	get_node('%Text').visible_characters += 1
	if get_node('%Text').percent_visible >= 1.0:
		$Timer.stop()


func _on_Dialog_gui_input(event):
	if event is InputEventScreenTouch and !event.pressed:
		if $Timer.is_stopped() == false:
			get_node('%Text').percent_visible = 1.0
			$Timer.stop()
		else:
			idx += 1
			if idx >= size:
				ManagerGame.emit_signal("player_movement_stop", false)
				queue_free()
				return
			get_node('%Text').percent_visible = 0.0
			get_node('%Text').text = data.props[idx]
			$Timer.start()
