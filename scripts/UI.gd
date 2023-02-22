extends Control



func _ready():
	ManagerGame.connect("dialog_activated", self, 'on_dialog_activated')

func on_dialog_activated(data):
	var d = load("res://actors/ui/Dialog.tscn").instance()
	$Popup.add_child(d)
	d.pre_load_dialog(data)


func _on_UI_gui_input(event):
	if event is InputEventScreenTouch and !event.pressed:
		var item = Item.new()
		ManagerInventory.add_item_to_bag(item)


func _on_Character_pressed():
	get_node('%Main').show()
