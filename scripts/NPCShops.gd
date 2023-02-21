extends Node2D


##### NOTE #############################################################
# this npc is designed to signal scenes to pop them up in the UI
# such as a shop pop-up panel or a wizard that offers skills enhancements which then pops a Panel
########################################################################


# open shops or whatever this npc does
func interact():
	if ManagerGame.player_global_ref.objs_nearby.has($ClickArea):
		pass


func _on_ClickArea_input_event(viewport, event, shape_idx):
	if event is InputEventScreenTouch and !event.pressed:
		interact()


