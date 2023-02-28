extends Control






func _ready():
	ManagerGame.connect("dialog_activated", self, 'on_dialog_activated')
	ManagerGame.connect("npc_shop_activated", self, 'on_npc_shop_activated')
	ManagerGame.connect("pop_scene_to_ui", self, 'on_pop_scene_to_ui')


func on_dialog_activated(timeline: String):
	var dialog = Dialogic.start(timeline)
	dialog.connect('timeline_start', self, 'on_timeline_start')
	dialog.connect('timeline_end', self, 'on_timeline_end')
	add_child(dialog)


func on_timeline_start(t_name):
	ManagerGame.emit_signal("player_movement_stop", true)

func on_timeline_end(t_name):
	ManagerGame.emit_signal("player_movement_stop", false)


func on_npc_shop_activated():
	var s = load("res://actors/ui/Shop.tscn").instance()
	$Popup.add_child(s)


func on_pop_scene_to_ui(scene):
	$Popup.add_child(scene.instance())


func _on_UI_gui_input(event):
	if event is InputEventScreenTouch and !event.pressed:
		var item = Item.new()
		ManagerInventory.add_item_to_bag(item)


func _on_Character_pressed():
	get_node('%Main').show()


func _on_Main_visibility_changed():
	if $Main.visible:
		$Main/Tab/Bag.refresh_list()
