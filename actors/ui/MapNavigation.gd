extends Control

onready var limit_right = $Panel/Panel/Map.rect_size.x - $Panel/Panel.rect_size.x
onready var limit_down =  $Panel/Panel/Map.rect_size.y - $Panel/Panel.rect_size.y

func _ready():
	for child in get_node('%Map').get_children():
		child.connect('clicked', self, 'on_location_clicked')


func on_location_clicked(towards: String):
	get_tree().change_scene("res://scenes/%s.tscn" % towards)


func _on_Map_gui_input(event):
	if event is InputEventScreenDrag:
		get_node('%Map').rect_position += event.relative
		
		if get_node('%Map').rect_position.x > 0.0:
			get_node('%Map').rect_position.x = 0.0
		if get_node('%Map').rect_position.x < -limit_right:
			get_node('%Map').rect_position.x = -limit_right
		
		if get_node('%Map').rect_position.y > 0.0:
			get_node('%Map').rect_position.y = 0.0
		if get_node('%Map').rect_position.y < -limit_down:
			get_node('%Map').rect_position.y = -limit_down


func _on_MapNavigation_gui_input(event):
	pass # Replace with function body.


func _on_Close_pressed():
	queue_free()
