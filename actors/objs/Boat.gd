extends Sprite



func _on_BoatArea_input_event(viewport, event, shape_idx):
	if event is InputEventScreenTouch and !event.pressed:
		var map_nav = load("res://actors/ui/MapNavigation.tscn")
		ManagerGame.emit_signal("pop_scene_to_ui", map_nav)
