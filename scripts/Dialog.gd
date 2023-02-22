extends Control


var is_dialog_finished: bool = false



func pre_load_dialog(data):
	get_node('%Text').percent_visible = 0.0
	$Timer.start()


func _on_Timer_timeout():
	get_node('%Text').visible_characters += 1
	if get_node('%Text').percent_visible >= 1.0:
		$Timer.stop()


func _on_Dialog_gui_input(event):
	if is_dialog_finished:
		queue_free()
	
	if event is InputEventScreenTouch and !event.pressed and is_dialog_finished == false:
		get_node('%Text').percent_visible = 1.0
		$Timer.stop()
		is_dialog_finished = true
