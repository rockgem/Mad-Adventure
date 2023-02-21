extends Node2D

##### NOTE #############################################################
# this npc node is intended to only have npc datas like dialogs and quests
# the npcs that open shops or trigger other popups are NPCShops node
########################################################################




# open dialogs and shit
func interact():
	pass


func _on_ClickArea_input_event(viewport, event, shape_idx):
	interact()
