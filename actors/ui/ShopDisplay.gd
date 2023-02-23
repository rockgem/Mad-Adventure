extends Panel

signal clicked


export(String) var item

var item_data


func _ready():
	pass


func _on_ShopDisplay_gui_input(event):
	if event is InputEventScreenTouch and !event.pressed:
		emit_signal("clicked")
