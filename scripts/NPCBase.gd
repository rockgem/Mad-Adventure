extends Node2D

##### NOTE #############################################################
# this npc node is intended to only have npc datas like dialogs and quests
# the npcs that open shops or trigger other popups, are NPCShops scenes
########################################################################


var speech = 'Hello'



# open dialogs and shit
func interact():
	if ManagerGame.player_global_ref.objs_nearby.has($ClickArea):
		ManagerGame.emit_signal("dialog_activated", speech)


func _on_ClickArea_input_event(viewport, event, shape_idx):
	if event is InputEventScreenTouch and !event.pressed:
		interact()
